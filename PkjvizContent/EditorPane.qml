import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: pane
    color: "#1e1e1e"

    // 属性
    property var tabData: [] // 存储标签数据的数组: [{title: "file1.py", content: "..."}, ...]
    property int currentTabIndex: 0
    property string paneId: "pane" + Math.random().toString().substr(2, 8)
    property bool isVertical: true // 是否垂直分割
    property var childPanes: [] // 子窗格，分割后使用
    property bool isSplit: false // 是否已分割

    // 信号
    signal tabClosed(int index)
    signal paneSplit(string paneId, bool isVertical, var childIds)
    signal requestMerge(string paneId)

    // 窗格的内容
    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // 标签栏
        Rectangle {
            id: tabBar
            Layout.fillWidth: true
            Layout.preferredHeight: 30
            color: "#333333"

            RowLayout {
                id: tabsRow
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                spacing: 0

                // 标签由TabDragHandle组件动态创建
                // 会在Component.onCompleted中添加
            }

            // 标签栏右侧的菜单
            Row {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 5
                spacing: 5

                // 添加标签按钮
                Rectangle {
                    width: 25
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                    color: addTabMouseArea.containsMouse ? "#555555" : "transparent"
                    radius: 2

                    Text {
                        anchors.centerIn: parent
                        text: "+"
                        color: "#cccccc"
                        font.pixelSize: 16
                    }

                    MouseArea {
                        id: addTabMouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: addNewTab("新文件.py", "")
                    }
                }

                // 分割按钮
                Rectangle {
                    width: 25
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                    color: splitMouseArea.containsMouse ? "#555555" : "transparent"
                    radius: 2

                    Text {
                        anchors.centerIn: parent
                        text: "◫"
                        color: "#cccccc"
                        font.pixelSize: 16
                    }

                    MouseArea {
                        id: splitMouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: splitPaneMenu.open()
                    }

                    // 分割菜单
                    Menu {
                        id: splitPaneMenu
                        y: parent.height

                        MenuItem {
                            text: "垂直分割"
                            onTriggered: splitPane(true)
                        }
                        MenuItem {
                            text: "水平分割"
                            onTriggered: splitPane(false)
                        }
                    }
                }
            }
        }

        // 编辑区域
        Rectangle {
            id: editorContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1e1e1e"

            // 当前显示的编辑器
            TextArea {
                id: editor
                anchors.fill: parent
                anchors.margins: 5
                text: tabData.length > 0 && currentTabIndex >= 0 && currentTabIndex < tabData.length ? tabData[currentTabIndex].content : ""
                color: "#cccccc"
                font.family: "Consolas"
                font.pixelSize: 14
                wrapMode: TextEdit.NoWrap

                background: Rectangle {
                    color: "transparent"
                }

                onTextChanged: {
                    if (tabData.length > 0 && currentTabIndex >= 0 && currentTabIndex < tabData.length) {
                        tabData[currentTabIndex].content = text;
                    }
                }
            }
        }
    }

    // 处理拆分窗格
    function splitPane(isVertical) {
        if (isSplit)
            return;

        isSplit = true;
        this.isVertical = isVertical;

        // 创建两个子窗格
        var childPane1 = Qt.createQmlObject('import QtQuick; import "." as Local; Local.EditorPane {}', pane, "childPane1");
        var childPane2 = Qt.createQmlObject('import QtQuick; import "." as Local; Local.EditorPane {}', pane, "childPane2");

        // 复制当前标签数据到第一个子窗格
        childPane1.tabData = JSON.parse(JSON.stringify(tabData));
        childPane1.currentTabIndex = currentTabIndex;

        // 添加一个新标签到第二个子窗格
        childPane2.addNewTab("新文件.py", "");

        childPanes = [childPane1, childPane2];

        // 通知已分割
        paneSplit(paneId, isVertical, [childPane1.paneId, childPane2.paneId]);
    }

    // 添加新标签
    function addNewTab(title, content) {
        tabData.push({
            title: title,
            content: content
        });

        // 添加标签组件
        var tabComponent = Qt.createComponent("TabDragHandle.qml");
        if (tabComponent.status === Component.Ready) {
            var newTab = tabComponent.createObject(tabsRow, {
                tabText: title,
                tabIndex: tabData.length - 1,
                sourcePane: pane
            });

            newTab.tabClicked.connect(function (index) {
                currentTabIndex = index;
                updateTabActiveStates();
            });

            newTab.tabDragged.connect(handleTabDragged);

            // 设置为当前激活标签
            currentTabIndex = tabData.length - 1;
            updateTabActiveStates();
        }
    }

    // 关闭标签
    function closeTab(index) {
        if (index < 0 || index >= tabData.length)
            return;

        // 移除标签数据
        tabData.splice(index, 1);

        // 移除标签组件
        var tabItem = tabsRow.children[index];
        if (tabItem) {
            tabItem.destroy();
        }

        // 更新其他标签的索引
        for (var i = 0; i < tabsRow.children.length; i++) {
            if (tabsRow.children[i].tabIndex !== undefined) {
                if (tabsRow.children[i].tabIndex > index) {
                    tabsRow.children[i].tabIndex--;
                }
            }
        }

        // 更新当前标签
        if (tabData.length === 0) {
            currentTabIndex = -1;
        } else if (currentTabIndex >= tabData.length) {
            currentTabIndex = tabData.length - 1;
        }

        updateTabActiveStates();
        tabClosed(index);
    }

    // 更新标签激活状态
    function updateTabActiveStates() {
        for (var i = 0; i < tabsRow.children.length; i++) {
            if (tabsRow.children[i].tabIndex !== undefined) {
                tabsRow.children[i].isActive = (tabsRow.children[i].tabIndex === currentTabIndex);
            }
        }
    }

    // 处理标签拖拽
    function handleTabDragged(tabIndex, fromPane, toPane, dropPoint) {
        if (!toPane) {
            // 如果没有目标窗格，尝试根据位置进行分割
            var globalRect = fromPane.mapToGlobal(0, 0, fromPane.width, fromPane.height);
            var parentManager = findSplitViewManager();

            if (parentManager) {
                // 确定拖放位置
                var relativeX = (dropPoint.x - globalRect.x) / globalRect.width;
                var relativeY = (dropPoint.y - globalRect.y) / globalRect.height;

                // 根据相对位置决定分割方向
                var position = "";
                if (relativeY < 0.25) {
                    position = "top";
                    isVertical = true;
                } else if (relativeY > 0.75) {
                    position = "bottom";
                    isVertical = true;
                } else if (relativeX < 0.25) {
                    position = "left";
                    isVertical = false;
                } else if (relativeX > 0.75) {
                    position = "right";
                    isVertical = false;
                } else {
                    // 中间区域不处理
                    return;
                }

                // 显示拖放指示器
                parentManager.showDropIndicator(globalRect, position);

                // 分割窗格
                splitPane(isVertical);

                // 移动标签到新窗格
                var targetPane = isVertical ? (position === "top" ? childPanes[0] : childPanes[1]) : (position === "left" ? childPanes[0] : childPanes[1]);

                // 复制标签数据
                var tabToMove = tabData[tabIndex];
                targetPane.addNewTab(tabToMove.title, tabToMove.content);

                // 关闭原标签
                closeTab(tabIndex);

                // 隐藏拖放指示器
                parentManager.hideDropIndicator();
            }
        } else if (fromPane !== toPane) {
            // 不同窗格间移动标签
            console.log("标签从", fromPane.paneId, "移动到", toPane.paneId);

            // 复制标签数据
            var tabToMove = fromPane.tabData[tabIndex];
            toPane.addNewTab(tabToMove.title, tabToMove.content);

            // 关闭原标签
            fromPane.closeTab(tabIndex);
        } else {
            // 同一窗格内重新排序标签
            console.log("在窗格内重新排序标签", tabIndex);
        }
    }

    // 查找父级SplitViewManager
    function findSplitViewManager() {
        var parent = pane.parent;
        while (parent) {
            if (parent.objectName === "splitViewManager" || parent.paneMap !== undefined) {
                return parent;
            }
            parent = parent.parent;
        }
        return null;
    }

    // 初始化时添加默认标签
    Component.onCompleted: {
        if (tabData.length === 0) {
            addNewTab("untitled-1.py", "# 新建文件\n");
        }
    }
}
