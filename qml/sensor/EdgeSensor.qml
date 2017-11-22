import QtQuick 2.9
import Box2D 2.0
Item {
    id: edge

    signal topEdge
    signal bottomEdge
    signal rightEdge
    signal leftEdge

    HSensor {
        id: bottomSensor

        x: edge.x
        y: edge.y + edge.height - 1
        width: edge.width

        onContact: {
            if(other.isBall) bottomEdge();
        }
    }

    HSensor {
        id: topSensor

        x: edge.x
        y: edge.y
        width: edge.width

        onContact: {
            if(other.isBall) topEdge();
        }
    }

    VSensor {
        id: leftSensor

        x: edge.x
        y: edge.y
        height: edge.height

        onContact: {
            if(other.isBall) leftEdge();
        }
    }

    VSensor {
        id: rightSensor

        x: edge.x + edge.width
        y: edge.y
        height: edge.height

        onContact: {
            if(other.isBall) rightEdge();
        }
    }
}
