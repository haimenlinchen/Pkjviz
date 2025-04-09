/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Pkjviz
import "."  // 导入当前目录，以便能找到PacketSender.qml

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    visible: true
    color: "#1e1e1e"

    ColumnLayout {
        id: mainColumn
        anchors.fill: parent
        spacing: 0

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
                        color: "transparent"
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
                                onClicked: switchButton.mode = 0
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
                                onClicked: switchButton.mode = 1
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
                                onClicked: switchButton.mode = 2
                            }
                        }
                    }

                    // 用于跟踪状态的属性
                    property int mode: 0  // 0:离线, 1:在线, 2:演示
                    property bool checked: mode === 1 || mode === 2  // 兼容现有逻辑
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
                            Layout.fillWidth: true
                            Layout.fillHeight: switchButton.mode !== 2 ? true : true / 2
                            model: ["📁 src", "  📄 main.py", "  📄 utils.py", "📁 tests", "  📄 test_main.py", "📁 docs", "  📄 README.md"]
                            delegate: Rectangle {
                                width: parent.width
                                height: 25
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
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.color = "#2a2d2e"
                                    onExited: parent.color = "transparent"
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
                                    model: ["演示1: 基本功能介绍", "演示2: 网络通信", "演示3: 数据可视化", "演示4: 实时监控", "演示5: 高级调试"]
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
                                            }
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onEntered: parent.color = "#2a2d2e"
                                            onExited: parent.color = "transparent"
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

                // 编辑区域
                Rectangle {
                    id: editorArea
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#1e1e1e"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        // 标签页
                        TabBar {
                            id: tabBar
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            background: Rectangle {
                                color: "#333333"
                            }

                            TabButton {
                                text: "文件1.py"
                                width: 120
                                height: 30
                                background: Rectangle {
                                    color: parent.checked ? "#4a4a4a" : "transparent"
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#cccccc"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            TabButton {
                                text: "文件2.py"
                                width: 120
                                height: 30
                                background: Rectangle {
                                    color: parent.checked ? "#4a4a4a" : "transparent"
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#cccccc"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            TabButton {
                                text: "文件3.py"
                                width: 120
                                height: 30
                                background: Rectangle {
                                    color: parent.checked ? "#4a4a4a" : "transparent"
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#cccccc"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }

                        // 编辑器
                        TextArea {
                            id: editorTextArea
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.minimumHeight: 150 // 确保编辑器区域有合理的最小高度
                            clip: true
                            color: "#cccccc"
                            background: Rectangle {
                                color: "transparent"
                            }
                            placeholderText: "在此输入代码..."
                            font.family: "Consolas"
                            font.pixelSize: 14

                            // 当编辑器获得焦点时，确保有足够的空间显示文本
                            focus: true
                            // 使用属性绑定而不是JavaScript块
                            property bool shouldAdjustHeight: focus && switchButton.checked && onlineToolsResizeHandle.toolsHeight > editorArea.height - 200
                            onShouldAdjustHeightChanged: if (shouldAdjustHeight)
                                onlineToolsResizeHandle.toolsHeight = Math.max(onlineToolsResizeHandle.minHeight, editorArea.height - 200)
                        }

                        // 在线模式下的设备列表和发包工具
                        Rectangle {
                            id: onlineTools
                            Layout.fillWidth: true
                            Layout.preferredHeight: switchButton.checked ? (onlineToolsResizeHandle.toolsHeight) : 0
                            color: "#1e1e1e"
                            visible: switchButton.checked

                            // 添加属性来存储和记忆发包工具的高度
                            property alias resizeHandle: onlineToolsResizeHandle

                            RowLayout {
                                anchors.fill: parent
                                spacing: 0

                                // 设备列表
                                Rectangle {
                                    Layout.preferredWidth: 180
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
                                                }
                                            }
                                        }

                                        // 设备列表
                                        ListView {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            model: ["设备1 (192.168.1.1)", "设备2 (192.168.1.2)", "设备3 (192.168.1.3)"]
                                            delegate: Rectangle {
                                                width: parent.width
                                                height: 25
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
                                                }

                                                MouseArea {
                                                    anchors.fill: parent
                                                    hoverEnabled: true
                                                    onEntered: parent.color = "#2a2d2e"
                                                    onExited: parent.color = "transparent"
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

                                // 发包工具
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    color: "#252526"

                                    ColumnLayout {
                                        anchors.fill: parent
                                        spacing: 0

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

                                                ToolButton {
                                                    Layout.preferredWidth: 20
                                                    Layout.preferredHeight: 20
                                                    text: "▶"
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

                                        // 发包工具内容 - 使用我们的PacketSender组件
                                        PacketSender {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            Layout.margins: 2
                                            designerPreviewNarrow: true
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

                // 右侧面板
                Rectangle {
                    id: rightPanel
                    Layout.preferredWidth: 250
                    Layout.fillHeight: true
                    color: "#1e1e1e"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        // 寄存器/内存查看器标题
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
                                    text: "寄存器/内存"
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
                                }
                            }
                        }

                        // 寄存器列表
                        ListView {
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height / 2
                            model: ["EAX: 0x00000000", "EBX: 0x00000000", "ECX: 0x00000000", "EDX: 0x00000000", "ESI: 0x00000000", "EDI: 0x00000000", "EBP: 0x00000000", "ESP: 0x00000000", "EIP: 0x00000000", "EFLAGS: 0x00000000"]
                            delegate: Rectangle {
                                width: parent.width
                                height: 25
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
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.color = "#2a2d2e"
                                    onExited: parent.color = "transparent"
                                }
                            }
                        }

                        // 内存查看器标题
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
                                    text: "内存"
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
                                }
                            }
                        }

                        // 内存列表
                        ListView {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            model: ["0x00000000: 00 00 00 00 00 00 00 00", "0x00000008: 00 00 00 00 00 00 00 00", "0x00000010: 00 00 00 00 00 00 00 00", "0x00000018: 00 00 00 00 00 00 00 00", "0x00000020: 00 00 00 00 00 00 00 00"]
                            delegate: Rectangle {
                                width: parent.width
                                height: 25
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
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.color = "#2a2d2e"
                                    onExited: parent.color = "transparent"
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

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                // 控制台标题
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    color: "#333333"

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        spacing: 5

                        Text {
                            Layout.alignment: Qt.AlignVCenter
                            color: "#cccccc"
                            text: "控制台"
                            font.bold: true
                        }

                        Item {
                            Layout.fillWidth: true
                        }

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
                        }
                    }
                }

                // 控制台输出
                TextArea {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#cccccc"
                    background: Rectangle {
                        color: "transparent"
                    }
                    placeholderText: "控制台输出..."
                    font.family: "Consolas"
                    font.pixelSize: 14
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

                // 在线状态和发包工具尺寸指示器
                Text {
                    Layout.alignment: Qt.AlignVCenter
                    color: "#888888"
                    visible: switchButton.checked
                    text: "发包工具高度: " + onlineToolsResizeHandle.toolsHeight + "px"
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

            // 拖动范围
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: -onlineToolsResizeHandle.minHeight
            drag.maximumY: -onlineToolsResizeHandle.maxHeight

            // 使用属性绑定替代JavaScript块
            property bool isDragging: pressed
            property int newHeight: isDragging ? Math.max(onlineToolsResizeHandle.minHeight, Math.min(onlineToolsResizeHandle.maxHeight, -onlineToolsResizeHandle.y)) : onlineToolsResizeHandle.toolsHeight

            // 单行处理程序
            onNewHeightChanged: if (isDragging)
                onlineToolsResizeHandle.toolsHeight = newHeight
            onPressedChanged: if (!pressed)
                onlineToolsResizeHandle.y = 0
        }
    }
}
