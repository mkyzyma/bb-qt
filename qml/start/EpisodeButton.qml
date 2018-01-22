import QtQuick 2.9

Rectangle {
    id: button
    color: "lightBlue"
    opacity: 0.7

    anchors.margins: 20

    radius: 15
    width: 140
    height: 140

    border.width: 3
    border.color: Qt.darker(color, 1.2)

    property alias text: buttonText.text

    signal clicked

    Text {
        id: buttonText
        font.bold: true
        color: "Black"
        anchors.centerIn: parent
        text: "E1"
        font.pixelSize: 18
    }

    MouseArea {
        anchors.fill: button
        onClicked: button.clicked();
    }
}
