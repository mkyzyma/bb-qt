import QtQuick 2.9
import Box2D 2.0


import "../object"
import "../../sensor"
import "../../global"
Item {
    id: levelBase

    property int sceneWidth
    property int sceneHeight

    property Ball ball: ball
    Rectangle {
        id: flor
        color: StyleColor.floreColor
        anchors.fill: parent;
    }

    Ball {
        id: ball
        radius: 10
        fJoint: ballAirFriction
        x: scene.width / 2 - width / 2
        y: 100

        onEat: showScore(score);
        onDamage: showDamage(power);
        onDie: levelBase.die();
    }

    MouseArea {
        anchors.fill: parent
        onClicked: ball.kick(mouseX, mouseY)
    }

    FrictionJoint {
        id: ballAirFriction

        bodyA: ball.body
        bodyB: sceneAnchor

        maxForce: 0
        maxTorque: 0
    }


    transform: Translate {
        id: levelMove
        x: levelBase.x
        y: levelBase.y
    }

    NumberAnimation {
        id: moveAnim
        target: levelMove;
        duration: 400;
        easing {type: Easing.OutCubic}
    }



    Text {
        id: msgText

        color: "green"
        font.bold: true
        font.family: "Arial"
    }

    ParallelAnimation {
        id: msgShow

        NumberAnimation {
            target: msgText
            duration: 200
            easing {type: Easing.InCubic}
            property: "opacity"
            from: 0.5
            to: 1

        }

        NumberAnimation {
            target: msgText
            duration: 200
            easing {type: Easing.InCubic}
            property: "font.pointSize"
            from: 24
            to: 56
        }
        onStopped: {
            msgFade.running = true
        }
    }

    ParallelAnimation {
        id: msgFade
        NumberAnimation {
            target: msgText
            duration: 400
            easing {type: Easing.OutCubic}
            property: "opacity"
            to: 0
        }
    }

    function showScore(score) {
        showMessage("+" + score, StyleColor.foodColor);
    }

    function showDamage(power) {
        showMessage("-" + power, StyleColor.enemyColor);
    }

    function die() {
        showMessage("RIP", StyleColor.enemyColor);
    }

    function showMessage(text, color) {
        msgText.opacity = 0
        msgShow.running = true
        msgText.text = text
        msgText.color = color
        msgText.x = ball.x
        msgText.y = ball.y
    }

    function moveY(shift) {
        moveAnim.property = "y";
        moveAnim.to = levelMove.y - shift;
        moveAnim.running = true;
        edgeSensor.y = edgeSensor.y + shift;
    }

    function moveX(shift) {
        moveAnim.property = "x";
        moveAnim.to = levelMove.x - shift;
        moveAnim.running = true;
        edgeSensor.x = edgeSensor.x + shift;
    }

    function basePause() {
        baseSetActive(false);
    }

    function baseResume() {
        baseSetActive(true);
    }

    function baseSetActive(isActive) {
        ball.body.active = isActive;
    }
}

