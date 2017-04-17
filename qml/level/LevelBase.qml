import QtQuick 2.5
import Box2D 2.0
import "../object"

Item {
    id: levelBase


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


}

