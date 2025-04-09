import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Pkjviz

Rectangle {
    id: root
    color: "#252526"
    
    property alias logText: logTextArea.text
    signal saveLog(string logContent)

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

                ToolButton {
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 20
                    text: "保存"
                    font.pixelSize: 12
                    background: Rectangle {
                        color: parent.pressed ? "#4a4a4a" : "transparent"
                        radius: 2
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "#cccccc"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: saveLog(logTextArea.text)
                }
            }
        }

        // Log编辑区域
        TextArea {
            id: logTextArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            color: "#cccccc"
            background: Rectangle {
                color: "#1e1e1e"
            }
            placeholderText: "在此输入日志数据...\n可用于模拟系统日志输出"
            font.family: "Consolas"
            font.pixelSize: 14
        }
    }
} 