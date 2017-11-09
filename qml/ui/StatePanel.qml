import QtQuick 2.0
import "../object"
import "../global"
Item{
    id: panel
    width: 160
    height: 40
    anchors.margins: 10

    property Ball ball

//    Rectangle {
//        id: rect
//        anchors.fill: parent
//        color: "black"
//        opacity: 0.2

//        radius: 5
//    }
    Text {
        id: scoreCaption
        anchors.verticalCenter: panel.verticalCenter
        anchors.left: panel.left
        anchors.leftMargin: 10
        text: "$"
        font.pixelSize: 26
        color: "green"

        font.bold: true

    }
    Text {
        id: scoreValue
        anchors.verticalCenter: panel.verticalCenter
        anchors.left: scoreCaption.right
        anchors.leftMargin: 5
        text: "0"
        font.pixelSize: 20
        color: "green"
        font.bold: true

    }

    Rectangle {
        id: healthCaption

        radius: 10
        width: radius * 2
        height: width
        anchors.leftMargin: 60

        anchors.verticalCenter: panel.verticalCenter
        anchors.left: scoreValue.left

        color: StyleColor.ballColor
    }

    /*Text {
        id: healthCaption
        anchors.verticalCenter: rect.verticalCenter
        anchors.left: scoreValue.left
        anchors.leftMargin: 50
        text: "+"
        font.pixelSize: 25
        color: "brown"
        font.bold: true
        opacity: 0.6
    }*/
    Text {
        id: healthValue
        anchors.verticalCenter: panel.verticalCenter
        anchors.left: healthCaption.right
        anchors.leftMargin: 5
        text: "100"
        font.pixelSize: 20
        color: "brown"
        font.bold: true
    }

    function setState() {
        scoreValue.text = ball.score.toString();
        healthValue.text = ball.health.toString();
    }

    onBallChanged: {
        ball.onScoreChanged.connect(setState);
        ball.onHealthChanged.connect(setState);
    }
}
