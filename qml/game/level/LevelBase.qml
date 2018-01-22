import QtQuick 2.9
import Box2D 2.0

import "../object"
import "../../sensor"
import "../../global"
Rectangle {
    id: levelBase

    color: StyleColor.floreColor

    property int sceneWidth
    property int sceneHeight

    property Wall topWall: top
    property Wall bottomWall: bottom
    property Wall leftWall: left
    property Wall rightWall: right

    property Ball ball: ball

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

    Wall {
        id: bottom
        height: 10
        anchors {
            bottom: levelBase.bottom
            left: levelBase.left
            right: levelBase.right
        }
    }

    Wall {
        id: top
        height: 10
        anchors {
            top: levelBase.top
            left: levelBase.left
            right: levelBase.right
        }
    }

    Wall {
        id: left
        width: 10
        anchors {
            top: levelBase.top
            left: levelBase.left
            bottom: levelBase.bottom
        }
    }

    Wall {
        id: right
        width: 10
        anchors {
            top: levelBase.top
            bottom: levelBase.bottom
            right: levelBase.right
        }
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
        top.body.active = isActive;
        left.body.active = isActive;
        right.body.active = isActive;
        bottom.body.active = isActive;
        ball.body.active = isActive;
    }
}

