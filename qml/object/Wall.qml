import QtQuick 2.5

import Box2D 2.0
Rectangle{
    id: rect
    color: "#009688"
    radius: 3
    property Body body: wallBody

    Body{
        id: wallBody

        target: rect


        Box{
            id: box

            width: rect.width
            height: rect.height

            density: 5
            friction: 10
            restitution: 0.5
        }
    }
}
