import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    // 属性
    property var paneMap: ({}) // 存储所有窗格的引用
    property string rootPaneId: "" // 根窗格ID

    // 拖放区域，用于识别拖拽过程中的目标区域
    Rectangle {
        id: dropIndicator
        visible: false
        color: "#0d6efd"
        opacity: 0.3
        z: 1000
    }

    // 创建根窗格
    Component.onCompleted: {
        var rootPane = createPane();
        rootPaneId = rootPane.paneId;
        paneMap[rootPaneId] = rootPane;

        // 设置根窗格大小
        rootPane.anchors.fill = parent;
    }

    // 创建新的窗格
    function createPane() {
        var paneComponent = Qt.createComponent("EditorPane.qml");
        if (paneComponent.status === Component.Ready) {
            var newPane = paneComponent.createObject(root);

            // 连接窗格信号
            newPane.paneSplit.connect(handlePaneSplit);
            newPane.requestMerge.connect(handlePaneMerge);

            return newPane;
        }
        return null;
    }

    // 处理窗格分割
    function handlePaneSplit(paneId, isVertical, childIds) {
        var parentPane = paneMap[paneId];
        if (!parentPane)
            return;

        // 保存子窗格引用
        for (var i = 0; i < childIds.length; i++) {
            paneMap[childIds[i]] = parentPane.childPanes[i];
        }

        // 创建分割布局
        var splitView = Qt.createQmlObject('
            import QtQuick;
            import QtQuick.Controls;
            SplitView {
                orientation: ' + (isVertical ? '"vertical"' : '"horizontal"') + '
            }', parentPane, "splitView");

        splitView.anchors.fill = parentPane;

        // 添加子窗格到分割视图
        for (var j = 0; j < parentPane.childPanes.length; j++) {
            var childPane = parentPane.childPanes[j];
            childPane.parent = splitView;

            if (isVertical) {
                // 垂直分割时设置高度
                splitView.SplitView.preferredHeight = parent.height / 2;
            } else {
                // 水平分割时设置宽度
                splitView.SplitView.preferredWidth = parent.width / 2;
            }
        }
    }

    // 处理窗格合并
    function handlePaneMerge(paneId) {
        // 实现窗格合并逻辑
        console.log("请求合并窗格:", paneId);
    }

    // 显示拖放指示器
    function showDropIndicator(targetRect, position) {
        // 位置: "top", "right", "bottom", "left" 或 "center"

        dropIndicator.visible = true;

        // 根据位置设置指示器大小和位置
        if (position === "top") {
            dropIndicator.x = targetRect.x;
            dropIndicator.y = targetRect.y;
            dropIndicator.width = targetRect.width;
            dropIndicator.height = targetRect.height / 2;
        } else if (position === "right") {
            dropIndicator.x = targetRect.x + targetRect.width / 2;
            dropIndicator.y = targetRect.y;
            dropIndicator.width = targetRect.width / 2;
            dropIndicator.height = targetRect.height;
        } else if (position === "bottom") {
            dropIndicator.x = targetRect.x;
            dropIndicator.y = targetRect.y + targetRect.height / 2;
            dropIndicator.width = targetRect.width;
            dropIndicator.height = targetRect.height / 2;
        } else if (position === "left") {
            dropIndicator.x = targetRect.x;
            dropIndicator.y = targetRect.y;
            dropIndicator.width = targetRect.width / 2;
            dropIndicator.height = targetRect.height;
        } else {
            // center
            dropIndicator.x = targetRect.x;
            dropIndicator.y = targetRect.y;
            dropIndicator.width = targetRect.width;
            dropIndicator.height = targetRect.height;
        }
    }

    // 隐藏拖放指示器
    function hideDropIndicator() {
        dropIndicator.visible = false;
    }

    // 获取指定ID的窗格
    function getPane(paneId) {
        return paneMap[paneId];
    }
}
