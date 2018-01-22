import QtQuick 2.9
import QtGraphicalEffects 1.0
import "icon"
import "../global"
Row {

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.margins: 20
    spacing: 10

    Logo {
        width: 70
        height: 70
        itemWidth: 50
        fontSize: 20
    }

    Text {
        text: "Ball"
        font.pixelSize: 50
        font.bold: true
        color: StyleColor.ballColor

    }
    Text {
        text: "&"
        font.pixelSize: 50
        font.bold: true
        color: StyleColor.wallColor
    }
    Text {
        text: "Boxes"
        font.pixelSize: 50
        font.bold: true
        color: StyleColor.enemyColor
    }

    layer.enabled: true
    layer.effect: DropShadow {
        verticalOffset: 2
        horizontalOffset: 2
        color: "#80000000"
        radius: 2
        samples: 3
    }
}
