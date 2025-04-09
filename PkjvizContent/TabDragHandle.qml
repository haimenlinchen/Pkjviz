import QtQuick
import QtQuick.Controls

Item {
    id: root

    // 属性
    property string tabText: "Tab"
    property bool isActive: false
    property int tabIndex: -1
    property var sourcePane: null    // 源窗口
    property var targetPane: null    // 目标窗口 (拖放时设置)

    // 信号
    signal tabDragged(int tabIndex, var fromPane, var toPane, point dropPoint)
    signal tabClicked(int tabIndex)

    width: 120
    height: 30

    // 拖动时的视觉提示
    Rectangle {
        id: background
        anchors.fill: parent
        color: isActive ? "#4a4a4a" : (dragArea.containsMouse ? "#3a3a3a" : "transparent")

        // 标签文本
        Text {
            id: tabTitle
            anchors.centerIn: parent
            text: tabText
            color: "#cccccc"
            font.pixelSize: 12
        }

        // 关闭按钮
        Rectangle {
            id: closeButton
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 5
            width: 16
            height: 16
            color: closeMouseArea.containsMouse ? "#666666" : "transparent"
            radius: 2
            visible: dragArea.containsMouse || isActive

            Text {
                anchors.centerIn: parent
                text: "×"
                color: "#cccccc"
                font.pixelSize: 12
            }

            MouseArea {
                id: closeMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    // 关闭标签的处理逻辑
                    if (sourcePane) {
                        sourcePane.closeTab(tabIndex);
                    }
                    mouse.accepted = true;
                }
            }
        }
    }

    // 拖动区域
    MouseArea {
        id: dragArea
        anchors.fill: parent
        hoverEnabled: true
        drag.target: root
        drag.threshold: 5

        property point startPosition: Qt.point(0, 0)
        property bool isDragging: false
        property var lastHoveredPane: null
        property string dropPosition: ""

        onPressed: {
            startPosition = Qt.point(root.x, root.y);
            tabClicked(tabIndex);
        }

        onReleased: {
            if (isDragging) {
                // 获取全局坐标，用于确定放置位置
                var globalPos = mapToGlobal(mouseX, mouseY);
                tabDragged(tabIndex, sourcePane, targetPane, globalPos);

                // 重置位置和状态
                root.x = startPosition.x;
                root.y = startPosition.y;
                isDragging = false;

                // 隐藏拖放指示器
                var manager = findSplitViewManager();
                if (manager) {
                    manager.hideDropIndicator();
                }
            }
        }

        onPositionChanged: {
            if (pressed && !isDragging && (Math.abs(root.x - startPosition.x) > 10 || Math.abs(root.y - startPosition.y) > 10)) {
                isDragging = true;
            }

            if (isDragging) {
                // 获取全局坐标
                var globalPos = mapToGlobal(mouseX, mouseY);

                // 查找当前悬停的窗格
                var manager = findSplitViewManager();
                if (manager) {
                    // 获取当前鼠标下的窗格
                    var hoveredPane = findPaneAtPosition(globalPos);

                    if (hoveredPane) {
                        // 计算相对位置
                        var paneRect = hoveredPane.mapToGlobal(0, 0, hoveredPane.width, hoveredPane.height);
                        var relativeX = (globalPos.x - paneRect.x) / paneRect.width;
                        var relativeY = (globalPos.y - paneRect.y) / paneRect.height;

                        // 确定拖放位置
                        var position = "";
                        if (relativeY < 0.25) {
                            position = "top";
                        } else if (relativeY > 0.75) {
                            position = "bottom";
                        } else if (relativeX < 0.25) {
                            position = "left";
                        } else if (relativeX > 0.75) {
                            position = "right";
                        } else {
                            position = "center";
                        }

                        // 更新悬停窗格和位置
                        if (lastHoveredPane !== hoveredPane || dropPosition !== position) {
                            lastHoveredPane = hoveredPane;
                            dropPosition = position;
                            targetPane = hoveredPane;

                            // 显示拖放指示器
                            manager.showDropIndicator(paneRect, position);
                        }
                    } else {
                        // 不在任何窗格上，隐藏指示器
                        if (lastHoveredPane !== null) {
                            lastHoveredPane = null;
                            targetPane = null;
                            manager.hideDropIndicator();
                        }
                    }
                }
            }
        }

        onClicked: {
            if (!isDragging) {
                tabClicked(tabIndex);
            }
        }
    }

    // 拖动时的阴影效果
    Drag.active: dragArea.isDragging
    Drag.hotSpot.x: width / 2
    Drag.hotSpot.y: height / 2

    // 在拖动时显示半透明效果
    states: State {
        when: dragArea.isDragging

        PropertyChanges {
            target: root
            opacity: 0.7
            scale: 1.05
            z: 100
        }
    }

    transitions: Transition {
        NumberAnimation {
            properties: "opacity, scale"
            duration: 200
            easing.type: Easing.OutQuad
        }
    }

    // 查找指定位置的窗格
    function findPaneAtPosition(globalPos) {
        var manager = findSplitViewManager();
        if (!manager || !manager.paneMap) {
            return null;
        }

        // 遍历所有窗格查找匹配的
        for (var id in manager.paneMap) {
            var pane = manager.paneMap[id];
            if (pane) {
                var rect = pane.mapToGlobal(0, 0, pane.width, pane.height);
                if (globalPos.x >= rect.x && globalPos.x <= rect.x + rect.width && globalPos.y >= rect.y && globalPos.y <= rect.y + rect.height) {
                    return pane;
                }
            }
        }

        return null;
    }

    // 查找父级SplitViewManager
    function findSplitViewManager() {
        var parent = root.parent;
        while (parent) {
            if (parent.objectName === "splitViewManager" || parent.paneMap !== undefined) {
                return parent;
            }
            parent = parent.parent;
        }
        return null;
    }
}
