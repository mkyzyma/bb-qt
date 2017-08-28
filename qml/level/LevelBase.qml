import QtQuick 2.5
import Box2D 2.0
import "../object"
import "../sensor"
import "../global"
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

    Ball{
        id: ball
        radius: 10
        fJoint: ballAirFriction
        x: scene.width / 2 - width / 2
        y: 100

        onEat: {
            addScore(score)
        }
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

    Wall{
        id: bottom
        height: 10
        anchors{
            bottom: levelBase.bottom
            left: levelBase.left
            right: levelBase.right
        }
    }

    Wall{
        id: top
        height: 10
        anchors{
            top: levelBase.top
            left: levelBase.left
            right: levelBase.right
        }
    }

    Wall{
        id: left
        width: 10
        anchors{
            top: levelBase.top
            left: levelBase.left
            bottom: levelBase.bottom
        }
    }

    Wall{
        id: right
        width: 10
        anchors{
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
        duration: 800;
        easing {type: Easing.OutCubic}
    }

    EdgeSensor{
        id: edgeSensor

        width: sceneWidth
        height: sceneHeight


        onBottomEdge: {
            console.debug("bottom");
            moveY(sceneHeight)
        }
        onTopEdge: {
            console.debug("top")
            moveY(-sceneHeight)
        }
        onRightEdge: {
            console.debug("right")
            moveX(sceneWidth)
        }
        onLeftEdge: {
            console.debug("left")
            moveX(-sceneWidth)
        }

    }

    Text{
        id: scoreText

        color: "green"
        font.bold: true
        font.family: "Arial"
    }

    ParallelAnimation{
        id: scoreShow

        NumberAnimation {
            target: scoreText
            duration: 600
            easing {type: Easing.InCubic}
            property: "opacity"
            from: 0
            to: 1

        }

        NumberAnimation {
            target: scoreText
            duration: 600
            easing {type: Easing.InCubic}
            property: "font.pointSize"
            from: 12
            to: 48
        }
        onStopped: {
            scoreFade.running = true
        }
    }

    ParallelAnimation{
        id: scoreFade
        NumberAnimation {
            target: scoreText
            duration: 400
            easing {type: Easing.OutCubic}
            property: "opacity"
            to: 0
        }
    }

    function addScore(score){
        scoreText.opacity = 0
        scoreShow.running = true
        scoreText.text = "+" + score
        scoreText.color = "darkorange"
        scoreText.x = ball.x
        scoreText.y = ball.y
    }

    function moveY(shift){
        moveAnim.property = "y";        
        moveAnim.to = levelMove.y - shift;
        moveAnim.running = true;
        edgeSensor.y = edgeSensor.y + shift;
    }

    function moveX(shift){
        moveAnim.property = "x";        
        moveAnim.to = levelMove.x - shift;
        moveAnim.running = true;
        edgeSensor.x = edgeSensor.x + shift;
    }
}

