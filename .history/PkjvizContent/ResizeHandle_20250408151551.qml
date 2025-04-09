import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    property int minSize: 100
    property int maxSize: 800
    property int currentSize: 200
    property bool isVertical: true
    property bool isHorizontal: false
    property bool isCorner: false  // 是否是角落调整手柄

    signal sizeChanged(int newSize)

    // 调整手柄尺寸
    height: isVertical ? 4 : parent.height
    width: isHorizontal ? 4 : parent.width
    color: "transparent"  // 默认透明

    // 鼠标悬停或拖动时显示蓝色指示条
    Rectangle {
        anchors.fill: parent
        color: mouseArea.containsMouse || mouseArea.drag.active ? "#0d6efd" : "transparent"
        opacity: 0.5
    }

    // 鼠标区域用于处理拖动
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        
        // 根据位置设置鼠标样式
        cursorShape: {
            if (isCorner) {
                if (root.anchors.right && root.anchors.bottom) return Qt.SizeFDiagCursor
                if (root.anchors.left && root.anchors.bottom) return Qt.SizeBDiagCursor
            }
            return isVertical ? Qt.SizeVerCursor : Qt.SizeHorCursor
        }
        
        // 拖动范围
        drag.target: parent
        drag.axis: {
            if (isCorner) return Drag.XAndYAxis
            return isVertical ? Drag.YAxis : Drag.XAxis
        }
        
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
