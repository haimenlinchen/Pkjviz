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

            Row {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.topMargin: 5
                spacing: 5

                ToolButton {
                    width: 30
                    height: 25
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
                    width: 30
                    height: 25
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
                    width: 30
                    height: 25
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
                    width: 1
                    height: 20
                    color: "#4a4a4a"
                    y: 2
                }

                ToolButton {
                    width: 30
                    height: 25
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
                    width: 30
                    height: 25
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
                    width: 1
                    height: 20
                    color: "#4a4a4a"
                    y: 2
                }

                // 模式切换开关
                Rectangle {
                    id: modeSelector
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 30
                    color: "#252526"
                    radius: 3

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10

                        Text {
                            text: "模式选择:"
                            color: "#cccccc"
                            font.pixelSize: 12
                        }

                        ComboBox {
                            id: moduleSelector
                            Layout.fillWidth: true
                            model: ["Lightning", "Cosim", "NB_SDK"]
                            currentIndex: 0

                            background: Rectangle {
                                color: "#333333"
                                radius: 2
                            }

                            contentItem: Text {
                                text: moduleSelector.displayText
                                color: "#cccccc"
                                font.pixelSize: 12
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                leftPadding: 5
                            }

                            delegate: ItemDelegate {
                                width: moduleSelector.width
                                contentItem: Text {
                                    text: modelData
                                    color: "#cccccc"
                                    font.pixelSize: 12
                                    verticalAlignment: Text.AlignVCenter
                                }
                                highlighted: moduleSelector.highlightedIndex === index
                                background: Rectangle {
                                    color: highlighted ? "#454545" : "#333333"
                                }
                            }

                            indicator: Item {
                                id: indicatorItem
                                x: moduleSelector.width - width - 5
                                y: moduleSelector.height / 2 - 3
                                width: 10
                                height: 6
                                
                                Rectangle {
                                    width: 8
                                    height: 8
                                    radius: 1
                                    rotation: 45
                                    color: "#cccccc"
                                    anchors.centerIn: parent
                                    anchors.verticalCenterOffset: -2
                                }
                            }

                            popup: Popup {
                                y: moduleSelector.height
                                width: moduleSelector.width
                                implicitHeight: contentItem.implicitHeight
                                padding: 1

                                contentItem: ListView {
                                    clip: true
                                    implicitHeight: contentHeight
                                    model: moduleSelector.popup.visible ? moduleSelector.delegateModel : null

                                    ScrollIndicator.vertical: ScrollIndicator {}
                                }

                                background: Rectangle {
                                    color: "#333333"
                                    border.color: "#444444"
                                    radius: 2
                                }
                            }

                            // 在Qt设计工作室中，不使用onActivated
                            // 使用属性变更通知来完成相同的任务
                            property int lastIndex: 0
                            Component.onCompleted: {
                                lastIndex = currentIndex;
                            }
                        }
                    }
                }

                // 二级选择
                Rectangle {
                    id: secondSelector
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 30
                    color: "#252526"
                    radius: 3
                    visible: true

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10

                        Text {
                            text: "运行类型:"
                            color: "#cccccc"
                            font.pixelSize: 12
                        }

                        ComboBox {
                            id: secondSelectionBox
                            Layout.fillWidth: true
                            model: ["demo", "offline", "dut"]
                            currentIndex: 0

                            background: Rectangle {
                                color: "#333333"
                                radius: 2
                            }

                            contentItem: Text {
                                text: secondSelectionBox.displayText
                                color: "#cccccc"
                                font.pixelSize: 12
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                leftPadding: 5
                            }

                            delegate: ItemDelegate {
                                width: secondSelectionBox.width
                                contentItem: Text {
                                    text: modelData
                                    color: "#cccccc"
                                    font.pixelSize: 12
                                    verticalAlignment: Text.AlignVCenter
                                }
                                highlighted: secondSelectionBox.highlightedIndex === index
                                background: Rectangle {
                                    color: highlighted ? "#454545" : "#333333"
                                }
                            }

                            indicator: Item {
                                x: secondSelectionBox.width - width - 5
                                y: secondSelectionBox.height / 2 - 3
                                width: 10
                                height: 6
                                
                                Rectangle {
                                    width: 8
                                    height: 8
                                    radius: 1
                                    rotation: 45
                                    color: "#cccccc"
                                    anchors.centerIn: parent
                                    anchors.verticalCenterOffset: -2
                                }
                            }

                            popup: Popup {
                                y: secondSelectionBox.height
                                width: secondSelectionBox.width
                                implicitHeight: contentItem.implicitHeight
                                padding: 1

                                contentItem: ListView {
                                    clip: true
                                    implicitHeight: contentHeight
                                    model: secondSelectionBox.popup.visible ? secondSelectionBox.delegateModel : null

                                    ScrollIndicator.vertical: ScrollIndicator {}
                                }

                                background: Rectangle {
                                    color: "#333333"
                                    border.color: "#444444"
                                    radius: 2
                                }
                            }

                            // 在Qt设计工作室中，不使用onActivated
                            // 使用属性绑定和属性变更来代替
                            property int lastIndex: 0
                            property bool isDemo: currentText === "demo"
                            property bool isOffline: currentText === "offline"
                            property bool isDut: currentText === "dut"
                            
                            Component.onCompleted: {
                                lastIndex = currentIndex;
                                protocolSelector.visible = isDemo;
                                confirmButton.visible = isDemo;
                                offlineContainer.visible = isOffline;
                                dutContainer.visible = isDut;
                            }
                        }
                    }
                }

                // 协议选择
                Rectangle {
                    id: protocolSelector
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 30
                    color: "#252526"
                    radius: 3
                    visible: secondSelectionBox.currentText === "demo"

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10

                        Text {
                            text: "协议选择:"
                            color: "#cccccc"
                            font.pixelSize: 12
                        }

                        ComboBox {
                            id: protocolBox
                            Layout.fillWidth: true
                            model: ["IPv4", "IPv6", "UDP", "TCP", "ICMP"]
                            currentIndex: 0

                            background: Rectangle {
                                color: "#333333"
                                radius: 2
                            }

                            contentItem: Text {
                                text: protocolBox.displayText
                                color: "#cccccc"
                                font.pixelSize: 12
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                leftPadding: 5
                            }

                            delegate: ItemDelegate {
                                width: protocolBox.width
                                contentItem: Text {
                                    text: modelData
                                    color: "#cccccc"
                                    font.pixelSize: 12
                                    verticalAlignment: Text.AlignVCenter
                                }
                                highlighted: protocolBox.highlightedIndex === index
                                background: Rectangle {
                                    color: highlighted ? "#454545" : "#333333"
                                }
                            }

                            indicator: Item {
                                x: protocolBox.width - width - 5
                                y: protocolBox.height / 2 - 3
                                width: 10
                                height: 6
                                
                                Rectangle {
                                    width: 8
                                    height: 8
                                    radius: 1
                                    rotation: 45
                                    color: "#cccccc"
                                    anchors.centerIn: parent
                                    anchors.verticalCenterOffset: -2
                                }
                            }

                            popup: Popup {
                                y: protocolBox.height
                                width: protocolBox.width
                                implicitHeight: contentItem.implicitHeight
                                padding: 1

                                contentItem: ListView {
                                    clip: true
                                    implicitHeight: contentHeight
                                    model: protocolBox.popup.visible ? protocolBox.delegateModel : null

                                    ScrollIndicator.vertical: ScrollIndicator {}
                                }

                                background: Rectangle {
                                    color: "#333333"
                                    border.color: "#444444"
                                    radius: 2
                                }
                            }

                            // 在Qt设计工作室中，不使用onActivated
                            property int lastIndex: 0
                            Component.onCompleted: {
                                lastIndex = currentIndex;
                            }
                        }
                    }
                }

                // 添加确认按钮
                Button {
                    id: confirmButton
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 30
                    text: "确认"
                    visible: secondSelectionBox.currentText === "demo"

                    background: Rectangle {
                        color: parent.pressed ? "#008000" : "#00b38a"
                        radius: 3
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#ffffff"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    // 使用MouseArea代替onClicked
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.pressed = true
                        onReleased: parent.pressed = false
                        onClicked: {
                            // 这里的代码会在设计工作室之外执行
                        }
                    }
                }

                Rectangle {
                    width: 1
                    height: 20
                    color: "#4a4a4a"
                    y: 2
                }

                // 搜索框
                Rectangle {
                    width: 200
                    height: 25
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
                            Layout.fillHeight: true
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
                            property bool shouldAdjustHeight: focus && onlineToolsResizeHandle.toolsHeight > editorArea.height - 200
                            onShouldAdjustHeightChanged: if (shouldAdjustHeight)
                                onlineToolsResizeHandle.toolsHeight = Math.max(onlineToolsResizeHandle.minHeight, editorArea.height - 200)
                        }

                        // 在线模式下的设备列表和发包工具
                        Rectangle {
                            id: onlineTools
                            Layout.fillWidth: true
                            Layout.preferredHeight: secondSelectionBox.isDut ? (onlineToolsResizeHandle.toolsHeight) : 0
                            color: "#1e1e1e"
                            visible: secondSelectionBox.isDut

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
                    visible: secondSelectionBox.isDut
                    text: "发包工具高度: " + onlineToolsResizeHandle.toolsHeight + "px"
                }

                Text {
                    Layout.alignment: Qt.AlignVCenter
                    color: "#888888"
                    text: "行: 1, 列: 1"
                }
            }
        }

        // 离线模式组件
        Rectangle {
            id: offlineContainer
            Layout.preferredWidth: 300
            Layout.preferredHeight: 150
            color: "#252526"
            radius: 3
            visible: secondSelectionBox.currentText === "offline"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                // 文件上传区域 - 模拟上传按钮
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 70
                    color: "#333333"
                    radius: 2

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 5

                        Text {
                            text: "上传文件区域"
                            color: "#cccccc"
                            font.pixelSize: 12
                        }

                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            Button {
                                text: "上传原始数据"
                                Layout.preferredWidth: 120
                                Layout.preferredHeight: 25

                                background: Rectangle {
                                    color: parent.pressed ? "#2a2d2e" : "#1e1e1e"
                                    radius: 2
                                    border.color: "#444444"
                                    border.width: 1
                                }

                                contentItem: Text {
                                    text: parent.text
                                    color: "#cccccc"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 12
                                }

                                // 使用MouseArea代替onClicked
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: parent.pressed = true
                                    onReleased: parent.pressed = false
                                    onClicked: {
                                        // 这里的代码会在设计工作室之外执行
                                    }
                                }
                            }

                            Text {
                                id: rawDataFileName
                                text: "未选择文件"
                                color: "#999999"
                                font.pixelSize: 12
                                Layout.fillWidth: true
                            }
                        }

                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            Button {
                                text: "上传寄存器数据"
                                Layout.preferredWidth: 120
                                Layout.preferredHeight: 25

                                background: Rectangle {
                                    color: parent.pressed ? "#2a2d2e" : "#1e1e1e"
                                    radius: 2
                                    border.color: "#444444"
                                    border.width: 1
                                }

                                contentItem: Text {
                                    text: parent.text
                                    color: "#cccccc"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 12
                                }

                                // 使用MouseArea代替onClicked
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: parent.pressed = true
                                    onReleased: parent.pressed = false
                                    onClicked: {
                                        // 这里的代码会在设计工作室之外执行
                                    }
                                }
                            }

                            Text {
                                id: regDataFileName
                                text: "未选择文件"
                                color: "#999999"
                                font.pixelSize: 12
                                Layout.fillWidth: true
                            }
                        }
                    }
                }

                // 确认按钮
                Button {
                    text: "确认提交"
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 30
                    Layout.alignment: Qt.AlignRight

                    background: Rectangle {
                        color: parent.pressed ? "#008000" : "#00b38a"
                        radius: 3
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#ffffff"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    // 使用MouseArea代替onClicked
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.pressed = true
                        onReleased: parent.pressed = false
                        onClicked: {
                            // 这里的代码会在设计工作室之外执行
                        }
                    }
                }
            }
        }

        // DUT模式组件
        Rectangle {
            id: dutContainer
            Layout.preferredWidth: 300
            Layout.preferredHeight: 180
            color: "#252526"
            radius: 3
            visible: secondSelectionBox.currentText === "dut"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                // IP输入
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Text {
                        text: "IP地址:"
                        color: "#cccccc"
                        font.pixelSize: 12
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 25
                        color: "#333333"
                        radius: 2

                        TextInput {
                            id: ipInput
                            anchors.fill: parent
                            anchors.leftMargin: 8
                            anchors.rightMargin: 8
                            verticalAlignment: TextInput.AlignVCenter
                            color: "#cccccc"
                            font.pixelSize: 12
                            clip: true

                            onTextChanged: {
                                console.log("IP地址: " + text);
                            }
                        }
                    }
                }

                // 端口输入
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Text {
                        text: "端口:"
                        color: "#cccccc"
                        font.pixelSize: 12
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 25
                        color: "#333333"
                        radius: 2

                        TextInput {
                            id: portInput
                            anchors.fill: parent
                            anchors.leftMargin: 8
                            anchors.rightMargin: 8
                            verticalAlignment: TextInput.AlignVCenter
                            color: "#cccccc"
                            font.pixelSize: 12
                            text: "8080"
                            clip: true

                            onTextChanged: {
                                console.log("端口: " + text);
                            }
                        }
                    }
                }

                // 用户名输入
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Text {
                        text: "用户名:"
                        color: "#cccccc"
                        font.pixelSize: 12
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 25
                        color: "#333333"
                        radius: 2

                        TextInput {
                            id: usernameInput
                            anchors.fill: parent
                            anchors.leftMargin: 8
                            anchors.rightMargin: 8
                            verticalAlignment: TextInput.AlignVCenter
                            color: "#cccccc"
                            font.pixelSize: 12
                            clip: true

                            onTextChanged: {
                                console.log("用户名: " + text);
                            }
                        }
                    }
                }

                // 密码输入
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Text {
                        text: "密码:"
                        color: "#cccccc"
                        font.pixelSize: 12
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 25
                        color: "#333333"
                        radius: 2

                        TextInput {
                            id: passwordInput
                            anchors.fill: parent
                            anchors.leftMargin: 8
                            anchors.rightMargin: 8
                            verticalAlignment: TextInput.AlignVCenter
                            color: "#cccccc"
                            font.pixelSize: 12
                            clip: true
                            echoMode: TextInput.Password

                            onTextChanged: {
                                console.log("密码已更新");
                            }
                        }
                    }
                }

                // 确认按钮
                Button {
                    text: "连接"
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 30
                    Layout.alignment: Qt.AlignRight

                    background: Rectangle {
                        color: parent.pressed ? "#008000" : "#00b38a"
                        radius: 3
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#ffffff"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    // 使用MouseArea代替onClicked
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.pressed = true
                        onReleased: parent.pressed = false
                        onClicked: {
                            // 这里的代码会在设计工作室之外执行
                        }
                    }
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
