import QtQuick
import QtQuick.Controls  // 替代方案
import Pkjviz

// App.qml 不再直接使用 Screen01，而是使用 main.qml
ApplicationWindow {
    id: appWindow
    width: 1280
    height: 720
    visible: true
    title: "Pkjviz"
    
    // 加载主 QML 文件，其中包含所有逻辑代码
    Loader {
        anchors.fill: parent
        source: "main.qml"
    }
}
