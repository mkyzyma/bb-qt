import QtQuick 2.0


Rectangle {
    id: btn
    radius: 50
    width: radius * 2
    height: width

    color: "transparent"

    border.color: "gray"
    border.width: 3

    signal pressed
    signal released

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        onPressed: btn.pressed()
        onReleased: btn.released()
    }

}

