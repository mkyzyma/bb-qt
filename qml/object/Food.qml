import QtQuick 2.0
import Box2D 2.0
import "../global"
import ".."
Rectangle {
    id: food
    color: StyleColor.foodColor
    radius : 5
    width: radius * 2
    height: width

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
        }

    }

    FrictionJoint {
        id: foodAirFriction

        bodyA: foodBody
        bodyB: sceneAnchor

        maxForce: 0
        maxTorque: 0
    }
}
