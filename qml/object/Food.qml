import QtQuick 2.0
import Box2D 2.0
import "../global"
import ".."
Rectangle {
    id: food
    color: StyleColor.foodColor
    radius : 7
    width: radius * 2
    height: width

    property int score: 1

    Text{
        id: scoreText
        text: "+" + score
        color: "green"
        font.bold: true
        font.family: "Comic"
        opacity: 0
    }



    NumberAnimation {
        id: eatAnim
        target: food
        duration: 800
        easing {type: Easing.OutCubic}
        property: "width"
        to: 0
    }

    ParallelAnimation{
        id: scoreShow
        NumberAnimation {
            target: scoreText
            duration: 600
            easing {type: Easing.OutCubic}
            property: "y"
            to: -50
        }
        NumberAnimation {
            target: scoreText
            duration: 600
            easing {type: Easing.OutCubic}
            property: "opacity"
            to: 1

        }

        NumberAnimation {
            target: scoreText
            duration: 600
            easing {type: Easing.InCubic}
            property: "font.pointSize"
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
        /*NumberAnimation {
            target: scoreText
            duration: 600
            easing {type: Easing.InCubic}
            property: "font.pointSize"
            to: 12
        }*/
    }
    Body{
        id: foodBody
        target: food

        bodyType: Body.Dynamic

        Circle {
            id: foodShape
            radius: food.radius

            density: 0
            friction: 0
            restitution: 0

            onBeginContact: {
                if(other.isBall) {
                    foodBody.active = false
                    foodShape.radius = 0
                    eatAnim.running = true

                    scoreShow.running = true
                    scoreText.color = "darkorange"
                }
            }
        }

    }

    FrictionJoint {
        id: foodAirFriction

        bodyA: foodBody
        bodyB: sceneAnchor

        maxForce: 0
        maxTorque: 0
    }

    Component.onCompleted: {
        /*if (footBody) {
            x = foodBody.x
            y = foodBody.y
        }*/
    }
}
