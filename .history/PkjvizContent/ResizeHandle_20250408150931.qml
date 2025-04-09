import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    property int minSize: 100
    property int maxSize: 800
    property int currentSize: 200
    property bool isVertical: true
    property bool isHorizontal: false
    
    signal sizeChanged(int newSize)
    
    height: isVertical ? 6 : parent.height
    width: isHorizontal ? 6 : parent.width
    color: mouseArea.containsMouse || mouseArea.drag.active ? "#0d6efd" : "transparent"
    
    // 手柄指示器 - 三个小点
    Row {
        anchors.centerIn: parent
        spacing: 4
        visible: mouseArea.containsMouse || mouseArea.drag.active
        rotation: isVertical ? 0 : 90
        
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
        cursorShape: isVertical ? Qt.SizeVerCursor : Qt.SizeHorCursor
        
        // 拖动范围
        drag.target: parent
        drag.axis: isVertical ? Drag.YAxis : Drag.XAxis
        drag.minimumX: isHorizontal ? -maxSize : 0
        drag.maximumX: isHorizontal ? -minSize : 0
        drag.minimumY: isVertical ? -maxSize : 0
        drag.maximumY: isVertical ? -minSize : 0
        
        // 使用属性绑定替代JavaScript块
        property bool isDragging: pressed
        property int newSize: isDragging ? 
            Math.max(minSize, Math.min(maxSize, 
                isVertical ? -root.y : -root.x)) : 
            currentSize
        
        // 单行处理程序
        onNewSizeChanged: if (isDragging) {
            currentSize = newSize
            sizeChanged(newSize)
        }
        onPressedChanged: if (!pressed) {
            root.x = 0
            root.y = 0
        }
    }
} 