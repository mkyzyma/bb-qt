import QtQuick 2.9
import Box2D 2.0

RaySensor {
    property int x
    property int y
    property int height

    vertices: [
        Qt.point(x, y),
        Qt.point(x, y + height)
    ]
}

