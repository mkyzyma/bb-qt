import QtQuick 2.9
import "../Scale.js" as Sc

Rectangle{
    id: startPanel
    color: "DimGray"

    property int winHeight
    property int winWidth

    Text {
        text: "Ball & Boxes"
        font.pixelSize: 32
        anchors.horizontalCenter: startPanel.horizontalCenter
        anchors.top: startPanel.top
        anchors.topMargin: 20
    }

    Rectangle {
        anchors.centerIn: startPanel
        id: startButton
        color: "WhiteSmoke"
        radius: 20
        width: 150
        height: 200

        Text {
            font.bold: true
            color: "DarkOrange"
            anchors.centerIn: startButton
            text: "Поехали!"
            font.pixelSize: 18
        }

        MouseArea {
            anchors.fill: startButton
            onClicked: loader.loadGame()
        }
    }

    Component.onCompleted: {
        startPanel.height = winHeight / Sc.scaleFactor;
        startPanel.width = winWidth / Sc.scaleFactor;
    }
}
