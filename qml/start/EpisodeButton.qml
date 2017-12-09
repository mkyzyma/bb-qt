import QtQuick 2.0

Rectangle {
    id: button
    color: "lightBlue"

    anchors.margins: 20

    radius: 15
    width: 140
    height: 140

    border.width: 3
    border.color: Qt.darker(color, 1.2)

    property alias text: buttonText.text

    Text {
        id: buttonText
        font.bold: true
        color: "DarkOrange"
        anchors.centerIn: parent
        text: "E1"
        font.pixelSize: 18
    }

    MouseArea {
        anchors.fill: button
        onClicked: loader.loadGame(1)
    }
}
