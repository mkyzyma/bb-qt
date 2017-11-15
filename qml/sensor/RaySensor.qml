import QtQuick 2.9
import Box2D 2.0

Body {
    id: sensor
    signal contact(Fixture other)

    property alias vertices: edge.vertices

    Edge {
        id: edge
        sensor: true
        onEndContact: {
            contact(other);
        }
    }
}

