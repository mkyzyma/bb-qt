import QtQuick 2.0
import "../object"
Item{
    id: panel
    width: 150
    height: 40
    anchors.margins: 5

    property Ball ball

    Rectangle {
        id: rect
        anchors.fill: parent
        color: "black"
        opacity: 0.2

        radius: 5
    }
    Text {
        id: scoreCaption
        anchors.verticalCenter: rect.verticalCenter
        anchors.left: rect.left
        anchors.leftMargin: 10
        text: "$"
        font.pixelSize: 20
        color: "green"
        opacity: 0.6
        font.bold: true

    }
    Text {
        id: scoreValue
        anchors.verticalCenter: rect.verticalCenter
        anchors.left: scoreCaption.right
        anchors.leftMargin: 5
        text: "0"
        font.pixelSize: 20
        color: "green"
        font.bold: true

    }

    Text {
        id: healthCaption
        anchors.verticalCenter: rect.verticalCenter
        anchors.left: scoreValue.left
        anchors.leftMargin: 50
        text: "+"
        font.pixelSize: 25
        color: "brown"
        font.bold: true
        opacity: 0.6
    }
    Text {
        id: healthValue
        anchors.verticalCenter: rect.verticalCenter
        anchors.left: healthCaption.right
        anchors.leftMargin: 5
        text: "100"
        font.pixelSize: 20
        color: "brown"
        font.bold: true
    }

    function setScore() {
        scoreValue.text = ball.score.toString();
    }

    onBallChanged: {
        ball.onScoreChanged.connect(setScore);
    }
}
