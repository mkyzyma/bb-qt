import QtQuick 2.9
import Box2D 2.0

import "../../global"
Rectangle {
    id: wall
    color: StyleColor.wallColor
    radius: 3
    property alias body: wallBody

    Body {
        id: wallBody
        target: wall

        Box{
            property bool isWall: true
            id: wallShape

            width: wall.width
            height: wall.height

            density: 5
            friction: 10
            restitution: 0.5
        }
    }    
}
