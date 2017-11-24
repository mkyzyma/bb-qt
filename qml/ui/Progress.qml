import QtQuick 2.0
import QtQuick.Controls 2.2

ProgressBar {
    id: control
    padding: 2

    property color backColor: "lightgray"
    property color color: "#17a81a"

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 18
        color: backColor
        radius: 3
    }

    contentItem: Item {
        implicitWidth: 200
        implicitHeight: 16

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 2
            color: control.color
        }
    }
}
