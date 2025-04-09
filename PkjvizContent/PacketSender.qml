import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: packetSenderRoot
    color: "#1e1e1e"
    border.color: "#333333"
    border.width: 1
    radius: 3

    // 设计时帮助提示 - 仅在Qt Designer中可见
    Rectangle {
        anchors.fill: parent
        color: "#80000000"
        visible: Qt.application.name === "Qt Design Studio" || Qt.application.name === "Designer"
        z: 1000

        Column {
            anchors.centerIn: parent
            spacing: 10

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "PacketSender 设计时预览"
                color: "#ffffff"
                font.bold: true
                font.pixelSize: 16
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "在实际运行时，此组件将根据宽度自动调整布局"
                color: "#ffffff"
                font.pixelSize: 12
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                Button {
                    text: "标准模式"
                    onClicked: {
                        packetSenderRoot.designerPreviewNarrow = false;
                        packetSenderRoot.designerPreviewCompact = false;
                        packetSenderRoot.narrowMode = false;
                        packetSenderRoot.compactMode = false;
                    }
                }

                Button {
                    text: "紧凑模式"
                    onClicked: {
                        packetSenderRoot.designerPreviewNarrow = false;
                        packetSenderRoot.designerPreviewCompact = true;
                        packetSenderRoot.narrowMode = false;
                        packetSenderRoot.compactMode = true;
                    }
                }

                Button {
                    text: "窄屏模式"
                    onClicked: {
                        packetSenderRoot.designerPreviewNarrow = true;
                        packetSenderRoot.designerPreviewCompact = true;
                        packetSenderRoot.narrowMode = true;
                        packetSenderRoot.compactMode = true;
                    }
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "点击此处关闭帮助"
                onClicked: parent.parent.visible = false
            }
        }
    }

    property bool expandAll: true
    // 添加属性来控制自适应行为，并提供默认值使其在设计时可见
    property bool compactMode: false // 在实际应用中使用 width < 600
    property bool narrowMode: false // 在实际应用中使用 width < 400

    // 提供一个设计时开关用于在Qt Designer中预览不同模式
    property bool designerPreviewNarrow: false // 设置为true可在设计器中查看窄屏模式
    property bool designerPreviewCompact: false // 设置为true可在设计器中查看紧凑模式

    // 在组件初始化后设置预览模式
    Component.onCompleted: {
        if (Qt.application.name === "Qt Design Studio" || Qt.application.name === "Designer") {
            // 在设计时使用预览模式
            if (designerPreviewNarrow) {
                narrowMode = true;
                compactMode = true;
            } else if (designerPreviewCompact) {
                narrowMode = false;
                compactMode = true;
            } else {
                narrowMode = false;
                compactMode = false;
            }
        } else {
            // 在实际运行时监听宽度变化
            updateLayoutMode();
        }
    }

    // 监听宽度变化
    onWidthChanged: {
        if (Qt.application.name !== "Qt Design Studio" && Qt.application.name !== "Designer") {
            updateLayoutMode();
        }
    }

    // 根据宽度更新布局模式
    function updateLayoutMode() {
        narrowMode = width < 400;
        compactMode = width < 600;
    }

    // 使用简单的阴影效果替代DropShadow
    Rectangle {
        id: shadow
        anchors.fill: parent
        anchors.margins: -2
        color: "transparent"
        border.color: "#80000000"
        border.width: 2
        radius: 5
        z: -1
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: narrowMode ? 5 : 10
        spacing: narrowMode ? 5 : 10

        // 顶部工具栏 - 改进设计，增强自适应性
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: narrowMode ? 35 : 40
            color: "#252526"
            radius: 3

            RowLayout {
                anchors.fill: parent
                anchors.margins: narrowMode ? 3 : 5
                spacing: narrowMode ? 5 : 8

                // 添加协议按钮 - 自适应大小
                Button {
                    Layout.preferredWidth: narrowMode ? 80 : (compactMode ? 90 : 100)
                    Layout.preferredHeight: narrowMode ? 25 : 30
                    text: narrowMode ? "➕ 协议" : "➕ 添加协议"
                    font.pixelSize: narrowMode ? 10 : 12
                    background: Rectangle {
                        color: parent.pressed ? "#3a3d3e" : (parent.hovered ? "#2a2d2e" : "#252526")
                        radius: 3
                        border.color: "#333333"
                        border.width: 1
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }

                // 打开按钮 - 设计时始终显示
                Button {
                    // 在设计时显示，在运行时根据宽度显示
                    opacity: !narrowMode ? 1.0 : 0.5
                    Layout.preferredWidth: compactMode ? 70 : 80
                    Layout.preferredHeight: narrowMode ? 25 : 30
                    text: "📂 打开"
                    font.pixelSize: narrowMode ? 10 : 12
                    background: Rectangle {
                        color: parent.pressed ? "#3a3d3e" : (parent.hovered ? "#2a2d2e" : "#252526")
                        radius: 3
                        border.color: "#333333"
                        border.width: 1
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                // 展开/折叠按钮
                Button {
                    Layout.preferredWidth: narrowMode ? 60 : (compactMode ? 70 : 80)
                    Layout.preferredHeight: narrowMode ? 25 : 30
                    text: (expandAll ? "🔼 折叠" : "🔽 展开")
                    font.pixelSize: narrowMode ? 10 : 12
                    background: Rectangle {
                        color: parent.pressed ? "#3a3d3e" : (parent.hovered ? "#2a2d2e" : "#252526")
                        radius: 3
                        border.color: "#333333"
                        border.width: 1
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                // 折叠按钮 - 设计时始终显示
                Button {
                    // 在设计时显示，在运行时根据宽度显示
                    opacity: !narrowMode ? 1.0 : 0.5
                    Layout.preferredWidth: compactMode ? 70 : 80
                    Layout.preferredHeight: narrowMode ? 25 : 30
                    text: "🔼 折叠"
                    font.pixelSize: narrowMode ? 10 : 12
                    background: Rectangle {
                        color: parent.pressed ? "#3a3d3e" : (parent.hovered ? "#2a2d2e" : "#252526")
                        radius: 3
                        border.color: "#333333"
                        border.width: 1
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

        // 数据包列表 - 改进设计，增强自适应性
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * (narrowMode ? 0.25 : 0.3)
            color: "#252526"
            border.color: "#333333"
            border.width: 1
            radius: 3

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: narrowMode ? 3 : 5
                spacing: narrowMode ? 3 : 5

                // 标题栏
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: narrowMode ? 25 : 30
                    color: "#2b2b2b"
                    radius: 2

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: narrowMode ? 5 : 10
                        anchors.rightMargin: narrowMode ? 5 : 10
                        spacing: 5

                        Text {
                            text: "📦 数据包"
                            color: "#ffffff"
                            font.bold: true
                            font.pixelSize: narrowMode ? 11 : 12
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        Text {
                            text: "共 1 个数据包"
                            color: "#888888"
                            font.pixelSize: narrowMode ? 10 : 12
                        }
                    }
                }

                // 数据包列表内容 - 自适应内容
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#1e1e1e"
                    radius: 2

                    ListView {
                        id: packetListView
                        anchors.fill: parent
                        anchors.margins: 2
                        model: 1
                        clip: true
                        delegate: Rectangle {
                            width: packetListView.width
                            height: narrowMode ? 25 : 30
                            color: index === packetListView.currentIndex ? "#3a3d3e" : "transparent"
                            radius: 2

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: narrowMode ? 5 : 10
                                anchors.rightMargin: narrowMode ? 5 : 10
                                spacing: narrowMode ? 5 : 10

                                Text {
                                    text: "1"
                                    color: "#cccccc"
                                    Layout.preferredWidth: narrowMode ? 20 : 30
                                    font.family: "Consolas"
                                    font.pixelSize: narrowMode ? 10 : 12
                                }
                                Text {
                                    text: "00:11:22:33:44:55"
                                    color: "#cccccc"
                                    Layout.preferredWidth: compactMode ? 120 : 150
                                    font.family: "Consolas"
                                    font.pixelSize: narrowMode ? 10 : 12
                                    // 在设计时总是显示，只是在窄屏模式下透明度低
                                    opacity: !narrowMode ? 1.0 : 0.3
                                }
                                Text {
                                    text: "ff:ff:ff:ff:ff:ff"
                                    color: "#cccccc"
                                    Layout.preferredWidth: compactMode ? 120 : 150
                                    font.family: "Consolas"
                                    font.pixelSize: narrowMode ? 10 : 12
                                    // 在设计时总是显示，只是在窄屏模式下透明度低
                                    opacity: !narrowMode ? 1.0 : 0.3
                                }
                                Text {
                                    text: "64"
                                    color: "#cccccc"
                                    Layout.preferredWidth: narrowMode ? 30 : 50
                                    font.family: "Consolas"
                                    font.pixelSize: narrowMode ? 10 : 12
                                }
                                Text {
                                    text: "Ethernet"
                                    color: "#cccccc"
                                    Layout.fillWidth: true
                                    font.family: "Consolas"
                                    font.pixelSize: narrowMode ? 10 : 12
                                }
                            }
                        }
                    }
                }
            }
        }

        // 分割线 - 改进设计
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#333333"
            opacity: 0.7
        }

        // 下半部分: 详情和Hex视图 - 改进设计，自适应布局
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            // 在狭窄模式下改为垂直布局
            ColumnLayout {
                anchors.fill: parent
                spacing: narrowMode ? 5 : 10
                // 在设计时总是可见，在运行时根据narrowMode显示
                visible: true // 在实际应用中使用 narrowMode
                opacity: narrowMode ? 1.0 : 0.0 // 用opacity代替visible，这样设计时可以看到
                enabled: narrowMode // 只有在narrowMode时才能交互

                // 左侧详情部分
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.6
                    color: "#252526"
                    border.color: "#333333"
                    border.width: 1
                    radius: 3

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: narrowMode ? 3 : 5
                        spacing: narrowMode ? 3 : 5

                        // 标题栏
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: narrowMode ? 25 : 30
                            color: "#2b2b2b"
                            radius: 2

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: narrowMode ? 5 : 10
                                anchors.rightMargin: narrowMode ? 5 : 10
                                spacing: 5

                                Text {
                                    text: "🔍 详情"
                                    color: "#ffffff"
                                    font.bold: true
                                    font.pixelSize: narrowMode ? 11 : 12
                                }

                                Item {
                                    Layout.fillWidth: true
                                }
                            }
                        }

                        // 详情内容
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#1e1e1e"
                            radius: 2

                            // 使用ScrollView包装ListView来代替TreeView
                            ScrollView {
                                id: detailsScrollViewNarrow
                                anchors.fill: parent
                                anchors.margins: 2
                                clip: true
                                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                                ScrollBar.vertical.policy: ScrollBar.AsNeeded

                                ListView {
                                    id: protocolListViewNarrow
                                    width: parent.width
                                    model: 3
                                    spacing: 2

                                    delegate: Column {
                                        width: protocolListViewNarrow.width
                                        spacing: 2

                                        // 协议标题项 - 自适应尺寸
                                        Rectangle {
                                            width: parent.width
                                            height: narrowMode ? 25 : 30
                                            color: "transparent"
                                            radius: 2

                                            RowLayout {
                                                anchors.fill: parent
                                                anchors.leftMargin: narrowMode ? 5 : 10
                                                spacing: 5

                                                Text {
                                                    text: "▼"
                                                    color: "#cccccc"
                                                    font.pixelSize: narrowMode ? 10 : 12
                                                }

                                                Text {
                                                    text: index === 0 ? "Ethernet" : (index === 1 ? "IPv4" : "UDP")
                                                    color: "#cccccc"
                                                    font.bold: true
                                                    font.pixelSize: narrowMode ? 10 : 12
                                                }
                                            }
                                        }

                                        // 字段项 - 简化版本，自适应尺寸
                                        Column {
                                            width: parent.width
                                            visible: true
                                            spacing: 2

                                            Repeater {
                                                model: index === 0 ? 3 : (index === 1 ? (narrowMode ? 6 : 12) : 4)

                                                Rectangle {
                                                    width: protocolListViewNarrow.width
                                                    height: narrowMode ? 25 : 30
                                                    color: "transparent"
                                                    radius: 2

                                                    RowLayout {
                                                        anchors.fill: parent
                                                        anchors.leftMargin: narrowMode ? 10 : 20
                                                        spacing: narrowMode ? 5 : 10

                                                        Text {
                                                            text: {
                                                                if (index === 0) {
                                                                    return modelData === 0 ? "源MAC地址" : (modelData === 1 ? "目标MAC地址" : "类型");
                                                                } else if (index === 1) {
                                                                    return "字段" + modelData;
                                                                } else {
                                                                    return "字段" + modelData;
                                                                }
                                                            }
                                                            color: "#cccccc"
                                                            Layout.preferredWidth: narrowMode ? 100 : 150
                                                            font.family: "Consolas"
                                                            font.pixelSize: narrowMode ? 10 : 12
                                                            elide: Text.ElideRight
                                                        }

                                                        TextField {
                                                            text: "值" + modelData
                                                            color: "#cccccc"
                                                            Layout.fillWidth: true
                                                            font.family: "Consolas"
                                                            font.pixelSize: narrowMode ? 10 : 12
                                                            background: Rectangle {
                                                                color: "#252526"
                                                                border.color: "#333333"
                                                                border.width: 0
                                                                radius: 2
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
                }

                // 右侧Hex视图
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#252526"
                    border.color: "#333333"
                    border.width: 1
                    radius: 3

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: narrowMode ? 3 : 5
                        spacing: narrowMode ? 3 : 5

                        // 标题栏
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: narrowMode ? 25 : 30
                            color: "#2b2b2b"
                            radius: 2

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: narrowMode ? 5 : 10
                                anchors.rightMargin: narrowMode ? 5 : 10
                                spacing: 5

                                Text {
                                    text: "🔢 Hex视图"
                                    color: "#ffffff"
                                    font.bold: true
                                    font.pixelSize: narrowMode ? 11 : 12
                                }

                                Item {
                                    Layout.fillWidth: true
                                }

                                Button {
                                    Layout.preferredWidth: narrowMode ? 50 : 60
                                    Layout.preferredHeight: narrowMode ? 18 : 20
                                    text: "显示"
                                    font.pixelSize: narrowMode ? 10 : 12
                                    background: Rectangle {
                                        color: parent.pressed ? "#3a3d3e" : (parent.hovered ? "#2a2d2e" : "#252526")
                                        radius: 2
                                        border.color: "#333333"
                                        border.width: 1
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

                        // Hex视图内容
                        Rectangle {
                            id: hexViewContentNarrow
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#1e1e1e"
                            visible: true
                            radius: 2

                            TextArea {
                                id: hexTextAreaNarrow
                                anchors.fill: parent
                                anchors.margins: 5
                                readOnly: true
                                text: "00 11 22 33 44 55 FF FF FF FF FF FF 08 00 45 00\n00 28 00 01 00 00 40 11 7C CD 7F 00 00 01 7F 00\n00 01 04 00 04 00 00 14 00 00 00 00 00 00 00 00"
                                color: "#cccccc"
                                background: Rectangle {
                                    color: "transparent"
                                }
                                font.family: "Courier New"
                                font.pixelSize: narrowMode ? 10 : 12
                            }
                        }
                    }
                }
            }

            // 在正常模式下使用水平布局
            RowLayout {
                anchors.fill: parent
                spacing: 10
                // 在设计时总是可见，在运行时根据narrowMode显示
                visible: true // 在实际应用中使用 !narrowMode
                opacity: narrowMode ? 0.0 : 1.0 // 用opacity代替visible，这样设计时可以看到
                enabled: !narrowMode // 只有在!narrowMode时才能交互

                // 左侧详情部分
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#252526"
                    border.color: "#333333"
                    border.width: 1
                    radius: 3

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 5
                        spacing: 5

                        // 标题栏
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            color: "#2b2b2b"
                            radius: 2

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.rightMargin: 10
                                spacing: 5

                                Text {
                                    text: "🔍 详情"
                                    color: "#ffffff"
                                    font.bold: true
                                }

                                Item {
                                    Layout.fillWidth: true
                                }
                            }
                        }

                        // 详情内容
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#1e1e1e"
                            radius: 2

                            // 使用ScrollView包装ListView来代替TreeView
                            ScrollView {
                                id: detailsScrollView
                                anchors.fill: parent
                                anchors.margins: 2
                                clip: true
                                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                                ScrollBar.vertical.policy: ScrollBar.AsNeeded

                                ListView {
                                    id: protocolListView
                                    width: parent.width
                                    model: 3
                                    spacing: 2

                                    delegate: Column {
                                        width: protocolListView.width
                                        spacing: 2

                                        // 协议标题项
                                        Rectangle {
                                            width: parent.width
                                            height: 30
                                            color: "transparent"
                                            radius: 2

                                            RowLayout {
                                                anchors.fill: parent
                                                anchors.leftMargin: 10
                                                spacing: 5

                                                Text {
                                                    text: "▼"
                                                    color: "#cccccc"
                                                    font.pixelSize: 12
                                                }

                                                Text {
                                                    text: index === 0 ? "Ethernet" : (index === 1 ? "IPv4" : "UDP")
                                                    color: "#cccccc"
                                                    font.bold: true
                                                }
                                            }
                                        }

                                        // 字段项 - 简化版本
                                        Column {
                                            width: parent.width
                                            visible: true
                                            spacing: 2

                                            Repeater {
                                                model: index === 0 ? 3 : (index === 1 ? 12 : 4)

                                                Rectangle {
                                                    width: protocolListView.width
                                                    height: 30
                                                    color: "transparent"
                                                    radius: 2

                                                    RowLayout {
                                                        anchors.fill: parent
                                                        anchors.leftMargin: 20
                                                        spacing: 10

                                                        Text {
                                                            text: {
                                                                if (index === 0) {
                                                                    return modelData === 0 ? "源MAC地址" : (modelData === 1 ? "目标MAC地址" : "类型");
                                                                } else if (index === 1) {
                                                                    return "字段" + modelData;
                                                                } else {
                                                                    return "字段" + modelData;
                                                                }
                                                            }
                                                            color: "#cccccc"
                                                            Layout.preferredWidth: compactMode ? 120 : 150
                                                            font.family: "Consolas"
                                                            elide: Text.ElideRight
                                                        }

                                                        TextField {
                                                            text: "值" + modelData
                                                            color: "#cccccc"
                                                            Layout.fillWidth: true
                                                            font.family: "Consolas"
                                                            background: Rectangle {
                                                                color: "#252526"
                                                                border.color: "#333333"
                                                                border.width: 0
                                                                radius: 2
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
                }

                // 右侧Hex视图
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#252526"
                    border.color: "#333333"
                    border.width: 1
                    radius: 3

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 5
                        spacing: 5

                        // 标题栏
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            color: "#2b2b2b"
                            radius: 2

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.rightMargin: 10
                                spacing: 5

                                Text {
                                    text: "🔢 Hex视图"
                                    color: "#ffffff"
                                    font.bold: true
                                }

                                Item {
                                    Layout.fillWidth: true
                                }

                                Button {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 20
                                    text: "显示"
                                    font.pixelSize: 12
                                    background: Rectangle {
                                        color: parent.pressed ? "#3a3d3e" : (parent.hovered ? "#2a2d2e" : "#252526")
                                        radius: 2
                                        border.color: "#333333"
                                        border.width: 1
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

                        // Hex视图内容
                        Rectangle {
                            id: hexViewContent
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#1e1e1e"
                            visible: true
                            radius: 2

                            TextArea {
                                id: hexTextArea
                                anchors.fill: parent
                                anchors.margins: 5
                                readOnly: true
                                text: "00 11 22 33 44 55 FF FF FF FF FF FF 08 00 45 00\n00 28 00 01 00 00 40 11 7C CD 7F 00 00 01 7F 00\n00 01 04 00 04 00 00 14 00 00 00 00 00 00 00 00\n00 00 00 00 00 00 00 00 00 00 00 00"
                                color: "#cccccc"
                                background: Rectangle {
                                    color: "transparent"
                                }
                                font.family: "Courier New"
                                font.pixelSize: 12
                            }
                        }
                    }
                }
            }
        }

        // 底部按钮 - 改进设计，增强自适应性
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: narrowMode ? 35 : 40
            color: "#252526"
            radius: 3

            RowLayout {
                anchors.fill: parent
                anchors.margins: narrowMode ? 3 : 5
                spacing: narrowMode ? 5 : 10

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    Layout.preferredWidth: narrowMode ? 80 : 100
                    Layout.preferredHeight: narrowMode ? 25 : 30
                    text: narrowMode ? "❌ 取消" : "❌ 取消"
                    font.pixelSize: narrowMode ? 10 : 12
                    background: Rectangle {
                        color: parent.pressed ? "#3a3d3e" : (parent.hovered ? "#2a2d2e" : "#252526")
                        radius: 3
                        border.color: "#333333"
                        border.width: 1
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Button {
                    Layout.preferredWidth: narrowMode ? 80 : 100
                    Layout.preferredHeight: narrowMode ? 25 : 30
                    text: narrowMode ? "▶ 发送" : "▶ 发送"
                    font.pixelSize: narrowMode ? 10 : 12
                    background: Rectangle {
                        color: parent.pressed ? "#0d6efd" : (parent.hovered ? "#0b5ed7" : "#0d6efd")
                        radius: 3
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#ffffff"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}
