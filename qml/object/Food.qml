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

    property int score: 150


    Body{
        id: foodBody
        target: food

        bodyType: Body.Static

        Circle {
            id: foodShape
            radius: food.radius

            density: 0
            friction: 0
            restitution: 0
            sensor: true
            property bool isFood: true
            property int score: food.score

            function eat() {
                foodBody.active = false
                foodShape.radius = 0
                eatAnim.running = true
            }
        }

    }


    NumberAnimation {
        id: eatAnim
        target: food
        duration: 800
        easing {type: Easing.OutCubic}
        property: "width"
        to: 0
    }



    FrictionJoint {
        id: foodAirFriction

        bodyA: foodBody
        bodyB: sceneAnchor

        maxForce: 0
        maxTorque: 0
    }

}
