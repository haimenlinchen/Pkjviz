/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import Pkjviz
import "."  // 导入当前目录，以便能找到PacketSender.qml、LogEditor.qml和ResizeHandle.qml

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    visible: true
    color: "#1e1e1e"
    objectName: "root"

    ColumnLayout {
        id: mainColumn
        anchors.fill: parent
        spacing: 0
        objectName: "mainColumn"

        // 顶部菜单栏
        Rectangle {
            id: menuBar
            Layout.fillWidth: true
            Layout.preferredHeight: 25
            color: "#252526"

            RowLayout {
                anchors.fill: parent
                spacing: 0

                MenuBar {
                    id: menuBarContent
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle {
                        color: "#252526"
                    }

                    Menu {
                        title: "文件"
                        MenuItem {
                            text: "新建文件"
                        }
                        MenuItem {
                            text: "新建窗口"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "打开文件..."
                        }
                        MenuItem {
                            text: "打开文件夹..."
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "保存"
                        }
                        MenuItem {
                            text: "另存为..."
                        }
                        MenuItem {
                            text: "全部保存"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "退出"
                        }
                    }
                    Menu {
                        title: "编辑"
                        MenuItem {
                            text: "撤销"
                        }
                        MenuItem {
                            text: "重做"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "剪切"
                        }
                        MenuItem {
                            text: "复制"
                        }
                        MenuItem {
                            text: "粘贴"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "查找"
                        }
                        MenuItem {
                            text: "替换"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "全选"
                        }
                    }
                    Menu {
                        title: "视图"
                        MenuItem {
                            text: "命令面板"
                        }
                        MenuItem {
                            text: "打开视图"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "外观"
                        }
                        MenuItem {
                            text: "缩放"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "显示/隐藏侧边栏"
                        }
                        MenuItem {
                            text: "显示/隐藏面板"
                        }
                        MenuItem {
                            text: "全屏"
                        }
                    }
                    Menu {
                        title: "运行"
                        MenuItem {
                            text: "启动调试"
                        }
                        MenuItem {
                            text: "运行"
                        }
                        MenuItem {
                            text: "停止"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "运行配置"
                        }
                    }
                    Menu {
                        title: "终端"
                        MenuItem {
                            text: "新建终端"
                        }
                        MenuItem {
                            text: "分割终端"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "清除终端"
                        }
                    }
                    Menu {
                        title: "帮助"
                        MenuItem {
                            text: "欢迎"
                        }
                        MenuItem {
                            text: "文档"
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "检查更新"
                        }
                        MenuItem {
                            text: "关于"
                        }
                    }
                }
            }
        }

        // 工具栏
        Rectangle {
            id: toolbar
            Layout.fillWidth: true
            Layout.preferredHeight: 35
            color: "#333333"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                spacing: 5

                ToolButton {
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 25
                    text: "新建"
                    background: Rectangle {
                        color: parent.pressed ? "#4a4a4a" : "transparent"
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                ToolButton {
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 25
                    text: "打开"
                    background: Rectangle {
                        color: parent.pressed ? "#4a4a4a" : "transparent"
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                ToolButton {
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 25
                    text: "保存"
                    background: Rectangle {
                        color: parent.pressed ? "#4a4a4a" : "transparent"
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 1
                    Layout.preferredHeight: 20
                    color: "#4a4a4a"
                }

                ToolButton {
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 25
                    text: "运行"
                    background: Rectangle {
                        color: parent.pressed ? "#4a4a4a" : "transparent"
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                ToolButton {
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 25
                    text: "停止"
                    background: Rectangle {
                        color: parent.pressed ? "#4a4a4a" : "transparent"
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 1
                    Layout.preferredHeight: 20
                    color: "#4a4a4a"
                }

                // 模式切换开关
                Rectangle {
                    id: switchButton
                    Layout.preferredWidth: 180
                    Layout.preferredHeight: 25
                    color: "#2b2b2b"
                    radius: 3
                    objectName: "switchButton"

                    Row {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 2

                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: switchButton.mode === 0 ? "#4a4a4a" : "transparent"
                            radius: 2

                            Text {
                                anchors.centerIn: parent
                                color: "#cccccc"
                                text: "离线"
                                font.pixelSize: 12
                            }

                            MouseArea {
                                anchors.fill: parent
                                objectName: "switchButtonOfflineMouseArea"
                            }
                        }

                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: switchButton.mode === 1 ? "#4a4a4a" : "transparent"
                            radius: 2

                            Text {
                                anchors.centerIn: parent
                                color: "#cccccc"
                                text: "在线"
                                font.pixelSize: 12
                            }

                            MouseArea {
                                anchors.fill: parent
                                objectName: "switchButtonOnlineMouseArea"
                            }
                        }

                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: switchButton.mode === 2 ? "#4a4a4a" : "transparent"
                            radius: 2

                            Text {
                                anchors.centerIn: parent
                                color: "#cccccc"
                                text: "演示"
                                font.pixelSize: 12
                            }

                            MouseArea {
                                anchors.fill: parent
                                objectName: "switchButtonDemoMouseArea"
                            }
                        }
                    }

                    // 用于跟踪状态的属性
                    property int mode: 0  // 0:离线, 1:在线, 2:演示
                    property bool checked: mode === 1  // 只有在线模式才启用设备和发包工具
                }

                Rectangle {
                    Layout.preferredWidth: 1
                    Layout.preferredHeight: 20
                    color: "#4a4a4a"
                }

                // 搜索框
                Rectangle {
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 25
                    color: "#2b2b2b"
                    radius: 3

                    TextField {
                        id: searchField
                        anchors.fill: parent
                        anchors.margins: 5
                        placeholderText: "搜索..."
                        background: Rectangle {
                            color: "transparent"
                        }
                        color: "#cccccc"
                    }
                }

                // 弹性空间，将环境选择器推到最右侧
                Item {
                    Layout.fillWidth: true
                }

                // 环境选择下拉框
                Rectangle {
                    Layout.preferredWidth: 160
                    Layout.preferredHeight: 25
                    color: "#2b2b2b"
                    radius: 3

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 8
                        anchors.rightMargin: 8
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        spacing: 6

                        Text {
                            text: "环境:"
                            color: "#cccccc"
                            font.pixelSize: 12
                            font.bold: true
                        }

                        ComboBox {
                            id: environmentSelector
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            model: ["LT", "NB-SDK", "NB-Cosim"]
                            currentIndex: 0
                            objectName: "environmentSelector"

                            background: Rectangle {
                                color: "#333333"
                                radius: 2
                                border.color: "#555555"
                                border.width: 1
                            }

                            contentItem: Text {
                                leftPadding: 5
                                text: environmentSelector.displayText
                                color: "#ffffff"
                                font.pixelSize: 12
                                font.bold: true
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            indicator: Text {
                                id: indicator
                                text: "▼"
                                color: "#ffffff"
                                font.pixelSize: 12
                                font.bold: true
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                anchors.right: parent.right
                                anchors.rightMargin: 8
                                anchors.verticalCenter: parent.verticalCenter
                                font.family: "Arial"
                            }

                            delegate: ItemDelegate {
                                width: environmentSelector.width
                                height: 28

                                contentItem: Text {
                                    text: modelData
                                    color: "#ffffff"
                                    font.pixelSize: 12
                                    font.bold: highlighted
                                    leftPadding: 5
                                    verticalAlignment: Text.AlignVCenter
                                }

                                background: Rectangle {
                                    color: highlighted ? "#0078d7" : "#333333"
                                }

                                highlighted: environmentSelector.highlightedIndex === index
                            }

                            popup: Popup {
                                y: environmentSelector.height
                                width: environmentSelector.width
                                implicitHeight: contentItem.implicitHeight
                                padding: 1

                                background: Rectangle {
                                    color: "#333333"
                                    border.color: "#555555"
                                    border.width: 1
                                    radius: 2
                                }

                                contentItem: ListView {
                                    clip: true
                                    implicitHeight: contentHeight
                                    model: environmentSelector.popup.visible ? environmentSelector.delegateModel : null
                                    currentIndex: environmentSelector.highlightedIndex

                                    ScrollIndicator.vertical: ScrollIndicator {}
                                }
                            }
                        }
                    }
                }
            }
        }

        // 主要内容区域
        Rectangle {
            id: mainContent
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1e1e1e"
            objectName: "mainContent"

            RowLayout {
                anchors.fill: parent
                spacing: 0

                // 左侧面板
                Rectangle {
                    id: leftPanel
                    Layout.preferredWidth: 250
                    Layout.fillHeight: true
                    color: "#1e1e1e"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        // 文件浏览器标题
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            color: "#252526"

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.rightMargin: 10
                                spacing: 5

                                Text {
                                    Layout.alignment: Qt.AlignVCenter
                                    color: "#cccccc"
                                    text: "资源管理器"
                                    font.bold: true
                                }

                                Item {
                                    Layout.fillWidth: true
                                }

                                ToolButton {
                                    Layout.preferredWidth: 20
                                    Layout.preferredHeight: 20
                                    text: "⋮"
                                    font.pixelSize: 14
                                    background: Rectangle {
                                        color: parent.pressed ? "#4a4a4a" : "transparent"
                                    }
                                    contentItem: Text {
                                        text: parent.text
                                        color: "#cccccc"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            }
                        }

                        // 文件列表
                        ListView {
                            id: fileListView
                            Layout.fillWidth: true
                            Layout.fillHeight: switchButton.mode !== 2 ? true : true / 2
                            model: ["📁 src", "  📄 main.py", "  📄 utils.py", "📁 tests", "  📄 test_main.py", "📁 docs", "  📄 README.md"]
                            property var selectedItems: []
                            objectName: "fileListView"
                            delegate: Rectangle {
                                width: parent.width
                                height: 25
                                color: fileListView.selectedItems.includes(index) ? "#3a3d3e" : "transparent"
                                property bool isSelected: fileListView.selectedItems.includes(index)

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 10
                                    anchors.rightMargin: 10
                                    spacing: 5

                                    Text {
                                        Layout.alignment: Qt.AlignVCenter
                                        color: "#cccccc"
                                        text: modelData
                                        font.family: "Consolas"
                                    }

                                    Item {
                                        Layout.fillWidth: true
                                    }
                                }

                                MouseArea {
                                    id: fileItemMouseArea
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                                    onEntered: parent.color = isSelected ? "#3a3d3e" : "#2a2d2e"
                                    onExited: parent.color = isSelected ? "#3a3d3e" : "transparent"
                                    objectName: "fileItemMouseArea_" + index
                                }
                            }

                            // 文件上下文菜单
                            Menu {
                                id: fileContextMenu
                                background: Rectangle {
                                    implicitWidth: 160
                                    color: "#252526"
                                    border.color: "#3c3c3c"
                                    border.width: 1
                                    radius: 3
                                }
                                objectName: "fileContextMenu"

                                MenuItem {
                                    text: "重命名"
                                    height: 30
                                    background: Rectangle {
                                        color: parent.hovered ? "#2a2d2e" : "transparent"
                                    }
                                    contentItem: Text {
                                        text: parent.text
                                        color: "#cccccc"
                                        font.pixelSize: 12
                                        leftPadding: 8
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    objectName: "fileRenameMenuItem"
                                }

                                MenuItem {
                                    text: "删除"
                                    height: 30
                                    background: Rectangle {
                                        color: parent.hovered ? "#2a2d2e" : "transparent"
                                    }
                                    contentItem: Text {
                                        text: parent.text
                                        color: "#cccccc"
                                        font.pixelSize: 12
                                        leftPadding: 8
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    objectName: "fileDeleteMenuItem"
                                }

                                MenuItem {
                                    text: fileListView.selectedItems.length > 1 ? "对选择项进行比较" : "选择以进行比较"
                                    height: 30
                                    background: Rectangle {
                                        color: parent.hovered ? "#2a2d2e" : "transparent"
                                    }
                                    contentItem: Text {
                                        text: parent.text
                                        color: "#cccccc"
                                        font.pixelSize: 12
                                        leftPadding: 8
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    objectName: "fileCompareMenuItem"
                                }
                            }
                        }

                        // 演示内容窗口（仅在演示模式下显示）
                        Rectangle {
                            id: demoContentPanel
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#1e1e1e"
                            visible: switchButton.mode === 2

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 0

                                // 演示内容标题
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 30
                                    color: "#252526"

                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: 10
                                        anchors.rightMargin: 10
                                        spacing: 5

                                        Text {
                                            Layout.alignment: Qt.AlignVCenter
                                            color: "#cccccc"
                                            text: "可选的演示内容"
                                            font.bold: true
                                        }

                                        Item {
                                            Layout.fillWidth: true
                                        }

                                        ToolButton {
                                            Layout.preferredWidth: 20
                                            Layout.preferredHeight: 20
                                            text: "⋮"
                                            font.pixelSize: 14
                                            background: Rectangle {
                                                color: parent.pressed ? "#4a4a4a" : "transparent"
                                            }
                                            contentItem: Text {
                                                text: parent.text
                                                color: "#cccccc"
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                            }
                                        }
                                    }
                                }

                                // 演示内容列表
                                ListView {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    model: ["acl_arp_acl", "acl_dot1_qos", "vxlan_decap", "mpls_basic_decap", "uc_vlan_ipv4"]
                                    objectName: "demoContentListView"
                                    delegate: Rectangle {
                                        width: parent.width
                                        height: 30
                                        color: "transparent"

                                        RowLayout {
                                            anchors.fill: parent
                                            anchors.leftMargin: 10
                                            anchors.rightMargin: 10
                                            spacing: 5

                                            Text {
                                                Layout.alignment: Qt.AlignVCenter
                                                color: "#cccccc"
                                                text: modelData
                                                font.family: "Consolas"
                                            }

                                            Item {
                                                Layout.fillWidth: true
                                            }

                                            ToolButton {
                                                Layout.preferredWidth: 20
                                                Layout.preferredHeight: 20
                                                text: "▶"
                                                font.pixelSize: 12
                                                background: Rectangle {
                                                    color: parent.pressed ? "#4a4a4a" : "transparent"
                                                    radius: 2
                                                }
                                                contentItem: Text {
                                                    text: parent.text
                                                    color: "#7cbb5e"
                                                    horizontalAlignment: Text.AlignHCenter
                                                    verticalAlignment: Text.AlignVCenter
                                                }
                                                objectName: "demoPlayButton_" + index
                                            }
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onEntered: parent.color = "#2a2d2e"
                                            onExited: parent.color = "transparent"
                                            objectName: "demoContentMouseArea_" + index
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                // 分割线
                Rectangle {
                    Layout.preferredWidth: 1
                    Layout.fillHeight: true
                    color: "#333333"
                }

                // 编辑区域 - 使用Layout.fillWidth确保它填充中间空间
                Rectangle {
                    id: editorArea
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#1e1e1e"
                    objectName: "editorArea"

                    // 使用SplitViewManager替换原来的编辑器实现
                    EditorSplitViewManager {
                        id: splitViewManager
                        anchors.fill: parent
                        anchors.bottomMargin: onlineTools.visible ? onlineTools.height : 0
                    }

                    // 在线/离线模式下的工具区域
                    Rectangle {
                        id: onlineTools
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: (switchButton.mode === 0 || switchButton.mode === 1) ? (isCollapsed ? 30 : onlineToolsResizeHandle.toolsHeight) : 0
                        color: "#1e1e1e"
                        visible: switchButton.mode === 0 || switchButton.mode === 1  // 在离线或在线模式下显示
                        objectName: "onlineTools"

                        // 简化属性，只保留一个isCollapsed状态
                        property bool isCollapsed: false
                        property alias resizeHandle: onlineToolsResizeHandle

                        // 添加高度变化的动画效果
                        Behavior on height {
                            NumberAnimation {
                                duration: 200
                                easing.type: Easing.OutQuad
                            }
                        }

                        // 统一的工具栏标题
                        Rectangle {
                            id: toolbarHeader
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 30
                            color: "#252526"

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.rightMargin: 10
                                spacing: 5

                                Text {
                                    Layout.alignment: Qt.AlignVCenter
                                    color: "#cccccc"
                                    // 根据当前模式显示不同的标题
                                    text: switchButton.mode === 0 ? "寄存器数据和日志编辑器" : "设备列表和发包工具"
                                    font.bold: true
                                }

                                Item {
                                    Layout.fillWidth: true
                                }

                                // 统一的收拢按钮
                                ToolButton {
                                    Layout.preferredWidth: 20
                                    Layout.preferredHeight: 20
                                    text: onlineTools.isCollapsed ? "▼" : "▲"
                                    font.pixelSize: 14
                                    background: Rectangle {
                                        color: parent.pressed ? "#4a4a4a" : "transparent"
                                    }
                                    contentItem: Text {
                                        text: parent.text
                                        color: "#cccccc"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    objectName: "editorsUnifiedCollapseButton"
                                }
                            }
                        }

                        // 主体内容区域
                        RowLayout {
                            anchors.top: toolbarHeader.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            spacing: 0
                            visible: !onlineTools.isCollapsed

                            // 离线模式工具区 - 包含寄存器数据编辑器和Log编辑器
                            Item {
                                id: offlineToolsContainer
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                visible: switchButton.mode === 0  // 仅在离线模式显示
                                objectName: "offlineToolsContainer"

                                RowLayout {
                                    anchors.fill: parent
                                    spacing: 0

                                    // 左侧 - 寄存器数据编辑器
                                    Rectangle {
                                        Layout.preferredWidth: parent.width * 0.3
                                        Layout.fillHeight: true
                                        color: "#252526"

                                        ColumnLayout {
                                            anchors.fill: parent
                                            spacing: 0

                                            // 寄存器编辑器标题
                                            Rectangle {
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: 30
                                                color: "#2b2b2b"

                                                RowLayout {
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 10
                                                    anchors.rightMargin: 10
                                                    spacing: 5

                                                    Text {
                                                        Layout.alignment: Qt.AlignVCenter
                                                        color: "#cccccc"
                                                        text: "寄存器数据编辑器"
                                                        font.bold: true
                                                    }

                                                    Item {
                                                        Layout.fillWidth: true
                                                    }
                                                }
                                            }

                                            // 寄存器编辑区域
                                            ScrollView {
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                Layout.margins: 5
                                                clip: true

                                                TextArea {
                                                    id: registerDataTextArea
                                                    anchors.fill: parent
                                                    color: "#cccccc"
                                                    background: Rectangle {
                                                        color: "#1e1e1e"
                                                    }
                                                    placeholderText: "输入寄存器数据...\n例如:\nEAX=0x00000001\nEBX=0x00000002"
                                                    font.family: "Consolas"
                                                    font.pixelSize: 14
                                                    objectName: "registerDataTextArea"
                                                    wrapMode: TextEdit.Wrap
                                                }
                                            }
                                        }
                                    }

                                    // 分割线
                                    Rectangle {
                                        Layout.preferredWidth: 1
                                        Layout.fillHeight: true
                                        color: "#333333"
                                    }

                                    // 右侧 - Log编辑器
                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        color: "#252526"

                                        ColumnLayout {
                                            anchors.fill: parent
                                            spacing: 0

                                            // Log编辑器标题
                                            Rectangle {
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: 30
                                                color: "#2b2b2b"

                                                RowLayout {
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 10
                                                    anchors.rightMargin: 10
                                                    spacing: 5

                                                    Text {
                                                        Layout.alignment: Qt.AlignVCenter
                                                        color: "#cccccc"
                                                        text: "Log编辑器"
                                                        font.bold: true
                                                    }

                                                    Item {
                                                        Layout.fillWidth: true
                                                    }
                                                }
                                            }

                                            // Log编辑区域
                                            ScrollView {
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                Layout.margins: 5
                                                clip: true

                                                TextArea {
                                                    id: logEditorTextArea
                                                    anchors.fill: parent
                                                    color: "#cccccc"
                                                    background: Rectangle {
                                                        color: "#1e1e1e"
                                                    }
                                                    placeholderText: "在此输入日志数据...\n可用于模拟系统日志输出"
                                                    font.family: "Consolas"
                                                    font.pixelSize: 14
                                                    objectName: "logEditorTextArea"
                                                    wrapMode: TextEdit.Wrap
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            // 在线模式工具区 - 包含设备列表和发包工具
                            Item {
                                id: onlineToolsContainer
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                visible: switchButton.mode === 1  // 仅在在线模式显示
                                objectName: "onlineToolsContainer"

                                RowLayout {
                                    anchors.fill: parent
                                    spacing: 0

                                    // 左侧 - 设备列表
                                    Rectangle {
                                        Layout.preferredWidth: parent.width * 0.3
                                        Layout.fillHeight: true
                                        color: "#252526"

                                        ColumnLayout {
                                            anchors.fill: parent
                                            spacing: 0

                                            // 设备列表标题
                                            Rectangle {
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: 30
                                                color: "#2b2b2b"

                                                RowLayout {
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 10
                                                    anchors.rightMargin: 10
                                                    spacing: 5

                                                    Text {
                                                        Layout.alignment: Qt.AlignVCenter
                                                        color: "#cccccc"
                                                        text: "可用设备"
                                                        font.bold: true
                                                    }

                                                    Item {
                                                        Layout.fillWidth: true
                                                    }

                                                    ToolButton {
                                                        Layout.preferredWidth: 20
                                                        Layout.preferredHeight: 20
                                                        text: "⟳"
                                                        font.pixelSize: 14
                                                        background: Rectangle {
                                                            color: parent.pressed ? "#4a4a4a" : "transparent"
                                                        }
                                                        contentItem: Text {
                                                            text: parent.text
                                                            color: "#cccccc"
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                        }
                                                    }
                                                }
                                            }

                                            // 设备列表
                                            ListView {
                                                id: deviceListView
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                model: ["设备1 (192.168.1.1)", "设备2 (192.168.1.2)", "设备3 (192.168.1.3)"]
                                                currentIndex: -1
                                                clip: true
                                                spacing: 0
                                                objectName: "deviceListView"
                                                delegate: Rectangle {
                                                    width: parent.width
                                                    height: 35
                                                    color: ListView.isCurrentItem ? "#2a2d2e" : "transparent"

                                                    RowLayout {
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 10
                                                        anchors.rightMargin: 10
                                                        spacing: 5

                                                        Rectangle {
                                                            width: 8
                                                            height: 8
                                                            radius: 4
                                                            color: "#4caf50" // 在线状态指示
                                                        }

                                                        Text {
                                                            Layout.alignment: Qt.AlignVCenter
                                                            color: "#cccccc"
                                                            text: modelData
                                                            font.family: "Consolas"
                                                        }

                                                        Item {
                                                            Layout.fillWidth: true
                                                        }

                                                        ToolButton {
                                                            id: arrowButton
                                                            Layout.preferredWidth: 20
                                                            Layout.preferredHeight: 20
                                                            text: "→"
                                                            font.pixelSize: 12
                                                            background: Rectangle {
                                                                color: arrowMouseArea.pressed ? "#4a4a4a" : "transparent"
                                                                radius: 2
                                                            }
                                                            contentItem: Text {
                                                                text: parent.text
                                                                color: "#0d6efd"
                                                                horizontalAlignment: Text.AlignHCenter
                                                                verticalAlignment: Text.AlignVCenter
                                                            }

                                                            MouseArea {
                                                                id: arrowMouseArea
                                                                anchors.fill: parent
                                                                objectName: "arrowMouseArea"
                                                            }
                                                        }
                                                    }

                                                    MouseArea {
                                                        id: deviceListItemMouseArea
                                                        anchors.fill: parent
                                                        anchors.rightMargin: 20  // 为右侧箭头按钮留出空间
                                                        hoverEnabled: true
                                                        acceptedButtons: Qt.LeftButton
                                                        objectName: "deviceListItemMouseArea"
                                                        onEntered: if (!ListView.isCurrentItem)
                                                            parent.color = "#2a2d2e"
                                                        onExited: if (!ListView.isCurrentItem)
                                                            parent.color = "transparent"
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    // 分割线
                                    Rectangle {
                                        Layout.preferredWidth: 1
                                        Layout.fillHeight: true
                                        color: "#333333"
                                    }

                                    // 右侧 - 发包工具
                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        color: "#252526"

                                        ColumnLayout {
                                            anchors.fill: parent
                                            spacing: 0
                                            objectName: "packetSenderLayout"

                                            // 发包工具标题
                                            Rectangle {
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: 30
                                                color: "#2b2b2b"

                                                RowLayout {
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 10
                                                    anchors.rightMargin: 10
                                                    spacing: 5

                                                    Text {
                                                        Layout.alignment: Qt.AlignVCenter
                                                        color: "#cccccc"
                                                        text: "发包工具"
                                                        font.bold: true
                                                    }

                                                    Item {
                                                        Layout.fillWidth: true
                                                    }
                                                }
                                            }

                                            // 发包工具内容
                                            PacketSender {
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                Layout.margins: 2
                                                designerPreviewNarrow: true
                                                objectName: "packetSender"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                // 分割线
                Rectangle {
                    Layout.preferredWidth: 1
                    Layout.fillHeight: true
                    color: "#333333"
                    visible: true // 确保分割线可见
                }

                // 右侧面板 - 确保它有固定宽度且始终可见
                Rectangle {
                    id: rightPanel
                    Layout.preferredWidth: 250
                    Layout.fillHeight: true
                    color: "#1e1e1e"
                    visible: true
                    objectName: "rightPanel"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        // 诊断结果部分
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.5
                            color: "#1e1e1e"

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 0

                                // 诊断结果标题
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 30
                                    color: "#252526"

                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: 10
                                        anchors.rightMargin: 10
                                        spacing: 5

                                        Text {
                                            Layout.alignment: Qt.AlignVCenter
                                            color: "#cccccc"
                                            text: "诊断结果"
                                            font.bold: true
                                        }

                                        Item {
                                            Layout.fillWidth: true
                                        }

                                        ToolButton {
                                            Layout.preferredWidth: 20
                                            Layout.preferredHeight: 20
                                            text: "↻"
                                            font.pixelSize: 14
                                            background: Rectangle {
                                                color: parent.pressed ? "#4a4a4a" : "transparent"
                                            }
                                            contentItem: Text {
                                                text: parent.text
                                                color: "#cccccc"
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                            }
                                            objectName: "refreshDiagnosticsButton"
                                        }
                                    }
                                }

                                // 诊断内容区域
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    color: "#1e1e1e"

                                    ScrollView {
                                        anchors.fill: parent
                                        anchors.margins: 5
                                        clip: true

                                        ColumnLayout {
                                            width: parent.width
                                            spacing: 10

                                            // 诊断代码部分
                                            ColumnLayout {
                                                Layout.fillWidth: true
                                                spacing: 5

                                                Text {
                                                    text: "Code:"
                                                    color: "#0d6efd"
                                                    font.bold: true
                                                    font.pixelSize: 14
                                                }

                                                Rectangle {
                                                    Layout.fillWidth: true
                                                    Layout.preferredHeight: codeText.contentHeight + 10
                                                    color: "#252526"
                                                    radius: 3

                                                    TextEdit {
                                                        id: codeText
                                                        anchors.fill: parent
                                                        anchors.margins: 5
                                                        readOnly: true
                                                        selectByMouse: true
                                                        color: "#cccccc"
                                                        font.family: "Consolas"
                                                        font.pixelSize: 12
                                                        wrapMode: TextEdit.Wrap
                                                        text: "DIAG-001" // 默认值，可通过API更新
                                                        objectName: "diagnosticCodeText"
                                                    }
                                                }
                                            }

                                            // 诊断动作部分
                                            ColumnLayout {
                                                Layout.fillWidth: true
                                                spacing: 5

                                                Text {
                                                    text: "Action:"
                                                    color: "#0d6efd"
                                                    font.bold: true
                                                    font.pixelSize: 14
                                                }

                                                Rectangle {
                                                    Layout.fillWidth: true
                                                    Layout.preferredHeight: actionText.contentHeight + 10
                                                    color: "#252526"
                                                    radius: 3

                                                    TextEdit {
                                                        id: actionText
                                                        anchors.fill: parent
                                                        anchors.margins: 5
                                                        readOnly: true
                                                        selectByMouse: true
                                                        color: "#cccccc"
                                                        font.family: "Consolas"
                                                        font.pixelSize: 12
                                                        wrapMode: TextEdit.Wrap
                                                        text: "检查端口配置并重启服务" // 默认值，可通过API更新
                                                        objectName: "diagnosticActionText"
                                                    }
                                                }
                                            }

                                            Item {
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        // 分割线
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 1
                            color: "#333333"
                        }

                        // 内存详情部分
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#1e1e1e"

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 0

                                // 内存详情标题
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 30
                                    color: "#252526"

                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: 10
                                        anchors.rightMargin: 10
                                        spacing: 5

                                        Text {
                                            Layout.alignment: Qt.AlignVCenter
                                            color: "#cccccc"
                                            text: "内存详情"
                                            font.bold: true
                                        }

                                        Item {
                                            Layout.fillWidth: true
                                        }

                                        ToolButton {
                                            Layout.preferredWidth: 20
                                            Layout.preferredHeight: 20
                                            text: "↻"
                                            font.pixelSize: 14
                                            background: Rectangle {
                                                color: parent.pressed ? "#4a4a4a" : "transparent"
                                            }
                                            contentItem: Text {
                                                text: parent.text
                                                color: "#cccccc"
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                            }
                                            objectName: "refreshMemoryButton"
                                        }
                                    }
                                }

                                // 内存详情内容区域
                                ScrollView {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Layout.margins: 5
                                    clip: true

                                    ColumnLayout {
                                        width: parent.width
                                        spacing: 10

                                        // 表名
                                        ColumnLayout {
                                            Layout.fillWidth: true
                                            spacing: 2

                                            Text {
                                                text: "表名:"
                                                color: "#0d6efd"
                                                font.bold: true
                                                font.pixelSize: 14
                                            }

                                            Rectangle {
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: tableNameText.contentHeight + 6
                                                color: "#252526"
                                                radius: 3

                                                TextEdit {
                                                    id: tableNameText
                                                    anchors.fill: parent
                                                    anchors.margins: 3
                                                    readOnly: true
                                                    selectByMouse: true
                                                    color: "#cccccc"
                                                    font.family: "Consolas"
                                                    font.pixelSize: 12
                                                    text: "ACL_TABLE" // 默认值，可通过API更新
                                                    objectName: "tableNameText"
                                                }
                                            }
                                        }

                                        // 表描述
                                        ColumnLayout {
                                            Layout.fillWidth: true
                                            spacing: 2

                                            Text {
                                                text: "表描述:"
                                                color: "#0d6efd"
                                                font.bold: true
                                                font.pixelSize: 14
                                            }

                                            Rectangle {
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: tableDescText.contentHeight + 10
                                                color: "#252526"
                                                radius: 3

                                                TextEdit {
                                                    id: tableDescText
                                                    anchors.fill: parent
                                                    anchors.margins: 5
                                                    readOnly: true
                                                    selectByMouse: true
                                                    color: "#cccccc"
                                                    font.family: "Consolas"
                                                    font.pixelSize: 12
                                                    wrapMode: TextEdit.Wrap
                                                    text: "访问控制列表表，用于存储ACL规则" // 默认值，可通过API更新
                                                    objectName: "tableDescText"
                                                }
                                            }
                                        }

                                        // 字段列表标题
                                        Text {
                                            text: "字段列表:"
                                            color: "#0d6efd"
                                            font.bold: true
                                            font.pixelSize: 14
                                        }

                                        // 字段列表
                                        ListView {
                                            id: fieldListView
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: 250
                                            clip: true
                                            spacing: 5
                                            objectName: "fieldListView"

                                            // 示例数据，实际应通过API更新
                                            model: ListModel {
                                                id: fieldListModel
                                                objectName: "fieldListModel"

                                                ListElement {
                                                    fieldName: "acl_id"
                                                    fieldDesc: "ACL规则ID"
                                                    fieldValue: "0x0001"
                                                }

                                                ListElement {
                                                    fieldName: "priority"
                                                    fieldDesc: "优先级"
                                                    fieldValue: "10"
                                                }

                                                ListElement {
                                                    fieldName: "src_ip"
                                                    fieldDesc: "源IP地址"
                                                    fieldValue: "192.168.1.1"
                                                }

                                                ListElement {
                                                    fieldName: "dst_ip"
                                                    fieldDesc: "目标IP地址"
                                                    fieldValue: "10.0.0.1"
                                                }

                                                ListElement {
                                                    fieldName: "action"
                                                    fieldDesc: "动作"
                                                    fieldValue: "FORWARD"
                                                }
                                            }

                                            delegate: Rectangle {
                                                width: parent.width
                                                height: fieldLayout.height + 10
                                                color: "#252526"
                                                radius: 3

                                                ColumnLayout {
                                                    id: fieldLayout
                                                    anchors.fill: parent
                                                    anchors.margins: 5
                                                    spacing: 2

                                                    // 字段名和值
                                                    RowLayout {
                                                        Layout.fillWidth: true

                                                        Text {
                                                            text: fieldName + ":"
                                                            color: "#7cbb5e"
                                                            font.bold: true
                                                            font.family: "Consolas"
                                                            font.pixelSize: 12
                                                            Layout.preferredWidth: 80
                                                        }

                                                        Text {
                                                            text: fieldValue
                                                            color: "#cccccc"
                                                            font.family: "Consolas"
                                                            font.pixelSize: 12
                                                            Layout.fillWidth: true
                                                            wrapMode: Text.Wrap
                                                        }
                                                    }

                                                    // 字段描述
                                                    Text {
                                                        text: "描述: " + fieldDesc
                                                        color: "#888888"
                                                        font.italic: true
                                                        font.pixelSize: 11
                                                        Layout.fillWidth: true
                                                        wrapMode: Text.Wrap
                                                    }
                                                }

                                                // 鼠标悬停效果
                                                MouseArea {
                                                    anchors.fill: parent
                                                    hoverEnabled: true
                                                    onEntered: parent.color = "#2a2d2e"
                                                    onExited: parent.color = "#252526"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // 分割线
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#333333"
        }

        // 底部控制台
        Rectangle {
            id: consoleArea
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            color: "#1e1e1e"
            objectName: "consoleArea"

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                // 控制台标题栏
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    color: "#333333"

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        spacing: 5

                        // 选项卡栏
                        TabBar {
                            id: consoleTabBar
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 30
                            objectName: "consoleTabBar"
                            background: Rectangle {
                                color: "transparent"
                            }

                            // 输出选项卡
                            TabButton {
                                id: outputTab
                                text: "输出"
                                width: 100
                                height: 30
                                background: Rectangle {
                                    color: parent.checked ? "#4a4a4a" : "transparent"
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#cccccc"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 12
                                }
                            }

                            // 终端选项卡
                            TabButton {
                                id: terminalTab
                                text: "终端"
                                width: 100
                                height: 30
                                background: Rectangle {
                                    color: parent.checked ? "#4a4a4a" : "transparent"
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#cccccc"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 12
                                }
                            }
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        // 清除按钮
                        ToolButton {
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: 20
                            text: "🗑️"
                            font.pixelSize: 12
                            background: Rectangle {
                                color: parent.pressed ? "#4a4a4a" : "transparent"
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "#cccccc"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            ToolTip.visible: hovered
                            ToolTip.text: "清除"
                            objectName: "consoleClearButton"
                        }

                        // 折叠按钮
                        ToolButton {
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: 20
                            text: "×"
                            font.pixelSize: 14
                            background: Rectangle {
                                color: parent.pressed ? "#4a4a4a" : "transparent"
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "#cccccc"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            ToolTip.visible: hovered
                            ToolTip.text: "关闭面板"
                            objectName: "consoleCloseButton"
                        }
                    }
                }

                // 控制台内容区域
                StackLayout {
                    id: consoleStackLayout
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    currentIndex: consoleTabBar.currentIndex

                    clip: true

                    // 输出面板
                    Rectangle {
                        color: "#1e1e1e"

                        ScrollView {
                            anchors.fill: parent
                            anchors.margins: 5
                            clip: true

                            TextArea {
                                id: outputTextArea
                                readOnly: true
                                color: "#cccccc"
                                font.family: "Consolas"
                                font.pixelSize: 12
                                wrapMode: TextEdit.WrapAnywhere
                                background: Rectangle {
                                    color: "transparent"
                                }
                                text: "[10:45:32] 程序已启动\n[10:45:33] 加载模块: core.module\n[10:45:34] 初始化完成\n[10:45:36] 警告: 设备未连接\n[10:45:40] 信息: 等待用户操作"
                                objectName: "outputTextArea"
                            }
                        }
                    }

                    // 终端面板
                    Rectangle {
                        color: "#1e1e1e"

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 5
                            spacing: 0

                            ScrollView {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                clip: true

                                TextArea {
                                    id: terminalTextArea
                                    readOnly: true
                                    color: "#cccccc"
                                    font.family: "Consolas"
                                    font.pixelSize: 12
                                    wrapMode: TextEdit.NoWrap
                                    background: Rectangle {
                                        color: "transparent"
                                    }
                                    text: "$ python main.py\n初始化环境...\n加载配置文件...\n启动服务...\n服务已启动，监听端口 8080\n"
                                    objectName: "terminalTextArea"
                                }
                            }

                            // 命令输入区域
                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 24
                                color: "#252526"

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 5
                                    spacing: 5

                                    Text {
                                        text: "$"
                                        color: "#cccccc"
                                        font.family: "Consolas"
                                        font.pixelSize: 12
                                    }

                                    TextField {
                                        id: commandInput
                                        Layout.fillWidth: true
                                        height: 24
                                        color: "#ffffff"
                                        font.family: "Consolas"
                                        font.pixelSize: 12
                                        placeholderText: "输入命令..."
                                        background: Rectangle {
                                            color: "transparent"
                                        }
                                        objectName: "commandInput"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // 状态栏
        Rectangle {
            id: statusBar
            Layout.fillWidth: true
            Layout.preferredHeight: 20
            color: "#2b2b2b"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                spacing: 10

                Text {
                    Layout.alignment: Qt.AlignVCenter
                    color: "#cccccc"
                    text: "就绪"
                }

                Item {
                    Layout.fillWidth: true
                }

                // 在线/离线状态和工具尺寸指示器
                Text {
                    Layout.alignment: Qt.AlignVCenter
                    color: "#888888"
                    visible: switchButton.mode === 0 || switchButton.mode === 1
                    text: switchButton.mode === 1 ? (onlineTools.onlineToolsCollapsed ? "发包工具已收起" : "发包工具高度: " + onlineToolsResizeHandle.toolsHeight + "px") : (onlineTools.editorsCollapsed ? "编辑器已收起" : "编辑器高度: " + onlineToolsResizeHandle.toolsHeight + "px")
                }

                Text {
                    Layout.alignment: Qt.AlignVCenter
                    color: "#888888"
                    text: "行: 1, 列: 1"
                }
            }
        }
    }

    // 顶部拖动手柄
    Rectangle {
        id: onlineToolsResizeHandle
        height: 6
        width: parent.width
        anchors.top: parent.top
        color: mouseArea.containsMouse || mouseArea.drag.active ? "#0d6efd" : "transparent"
        objectName: "onlineToolsResizeHandle"

        // 存储发包工具的高度
        property int toolsHeight: 500
        property int minHeight: 200
        property int maxHeight: 800

        // 手柄指示器 - 三个小点
        Row {
            anchors.centerIn: parent
            spacing: 4
            visible: mouseArea.containsMouse || mouseArea.drag.active

            Repeater {
                model: 3

                Rectangle {
                    width: 8
                    height: 2
                    radius: 1
                    color: "#ffffff"
                }
            }
        }

        // 鼠标区域用于处理拖动
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            anchors.margins: -3 // 增加可点击区域
            hoverEnabled: true
            cursorShape: Qt.SizeVerCursor
            objectName: "mouseArea"

            // 拖动范围
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: -onlineToolsResizeHandle.minHeight
            drag.maximumY: -onlineToolsResizeHandle.maxHeight

            // 使用属性绑定替代JavaScript块
            property bool isDragging: pressed
            property int newHeight: isDragging ? Math.max(onlineToolsResizeHandle.minHeight, Math.min(onlineToolsResizeHandle.maxHeight, -onlineToolsResizeHandle.y)) : onlineToolsResizeHandle.toolsHeight
        }
    }

    // 添加设备连接窗口 - 显示在屏幕中央
    Rectangle {
        id: connectionDialog
        width: 320
        height: 240
        anchors.centerIn: parent
        visible: false
        color: "#252526"
        border.color: "#3c3c3c"
        border.width: 1
        radius: 5
        z: 100
        objectName: "connectionDialog"

        // 用于存储当前连接的设备名称
        property string deviceName: ""

        // 添加阴影效果
        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: "#80000000"
            shadowBlur: 12
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 10
            anchors.margins: 15

            // 标题
            Text {
                Layout.fillWidth: true
                text: "连接设备"
                color: "#ffffff"
                font.bold: true
                font.pixelSize: 16
            }

            // 设备名称
            Text {
                Layout.fillWidth: true
                text: "设备: " + connectionDialog.deviceName
                color: "#cccccc"
                font.pixelSize: 14
                elide: Text.ElideRight
            }

            // 分隔符
            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: "#3c3c3c"
                Layout.topMargin: 5
                Layout.bottomMargin: 5
            }

            // 用户名
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 5

                Text {
                    text: "用户名"
                    color: "#cccccc"
                    font.pixelSize: 12
                }

                TextField {
                    id: usernameField
                    Layout.fillWidth: true
                    height: 30
                    placeholderText: "请输入用户名"
                    color: "#ffffff"
                    objectName: "usernameField"
                    background: Rectangle {
                        color: "#1e1e1e"
                        radius: 3
                        border.width: 1
                        border.color: "#3c3c3c"
                    }
                }
            }

            // 密码
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 5

                Text {
                    text: "密码"
                    color: "#cccccc"
                    font.pixelSize: 12
                }

                TextField {
                    id: passwordField
                    Layout.fillWidth: true
                    height: 30
                    placeholderText: "请输入密码"
                    color: "#ffffff"
                    echoMode: TextInput.Password
                    objectName: "passwordField"
                    background: Rectangle {
                        color: "#1e1e1e"
                        radius: 3
                        border.width: 1
                        border.color: "#3c3c3c"
                    }
                }
            }

            // 按钮区域
            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: 10
                spacing: 10

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    id: cancelButton
                    text: "取消"
                    implicitWidth: 80
                    implicitHeight: 30
                    background: Rectangle {
                        color: parent.pressed ? "#333333" : "#252526"
                        radius: 3
                        border.width: 1
                        border.color: "#3c3c3c"
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    objectName: "cancelButton"
                }

                Button {
                    id: connectButton
                    text: "连接"
                    implicitWidth: 80
                    implicitHeight: 30
                    background: Rectangle {
                        color: parent.pressed ? "#0d6efd" : "#0078d7"
                        radius: 3
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#ffffff"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    objectName: "connectButton"
                }
            }
        }
    }
}
