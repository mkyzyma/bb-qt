import QtQuick 2.5
import Box2D 2.0
import "../global"
Rectangle{
    id: rect
    color: StyleColor.wallColor
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
