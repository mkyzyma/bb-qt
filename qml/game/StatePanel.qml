import QtQuick 2.9

import "object"
import "../global"
import "../ui"
Item{
    id: panel
    width: 300
    height: 40
    anchors.margins: 10

    property Ball ball

    Rectangle {
        id: healthCaption

        radius: 10
        width: radius * 2
        height: width
        anchors.verticalCenter: panel.verticalCenter
        anchors.left: panel.left
        anchors.leftMargin: 10

        color: StyleColor.ballColor
    }


    Progress {
        id: healthValue
        anchors.verticalCenter: panel.verticalCenter
        anchors.left: healthCaption.right
        anchors.leftMargin: 5
        width: 50
        to: 100
        value: 100
        color: "green"
    }

    Rectangle {
        id: energyCaption

        radius: 10
        width: radius * 2
        height: width


        anchors.verticalCenter: panel.verticalCenter
        anchors.left: healthValue.right
        anchors.leftMargin: 10

        color: "blue"
    }


    Progress {
        id: energyValue
        anchors.verticalCenter: panel.verticalCenter
        anchors.left: energyCaption.right
        anchors.leftMargin: 5
        width: 50
        /*to: ball.maxEnergy
        value: ball.energy*/
        color: "blue"
    }

    Text {
        id: scoreCaption
        anchors.verticalCenter: panel.verticalCenter
        anchors.left: energyValue.right
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

    function setState() {
        scoreValue.text = ball.score.toString();
        healthValue.value = ball.health;
        energyValue.value = ball.energy;
    }

    function setBall(ball) {
        panel.ball = ball;
        ball.onScoreChanged.connect(setState);
        ball.onHealthChanged.connect(setState);
        ball.onEnergyChanged.connect(setState);
        energyValue.to = ball.maxEnergy;
        energyValue.value = ball.energy;
        console.debug("StatPanel.setBall");
        setState();
    }
}
