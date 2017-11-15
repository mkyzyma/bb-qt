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

    /*Rectangle {
        color: "black"

        x: bottomSensor.x
        y: bottomSensor.y

        width: bottomSensor.width

        height: 10
    }

    Rectangle {
        color: "blue"

        x: topSensor.x
        y: topSensor.y

        width: topSensor.width

        height: 10
    }*/

    /*Body {
        id: topSensor

        fixtures: Box {
            x: edge.x
            y: edge.y
            width: edge.width
            height: 1
            sensor: true
            onEndContact: {
                if(other.isBall) topEdge();
            }
        }
    }*/

    /*Body{
        id: leftSensor

        fixtures: Box {
            x: edge.x
            y: edge.y
            height: edge.height
            width: 1
            sensor: true
            onEndContact: {
                if(!other.isBall) leftEdge();
            }
        }
    }

    Body{
        id: rightSensor

        fixtures: Box {
            x: edge.x + edge.width
            y: edge.y
            height: edge.height
            width: 1
            sensor: true
            onEndContact: {
                if(!other.isBall) rightEdge();
            }
        }
    }*/
    /*RayCast {
        id: bottomSensor

        property point p1: Qt.point(edge.x, edge.y + edge.height)
        property point p2: Qt.point(edge.x + edge.width, edge.y + edge.height)

        onFixtureReported: {
            if (fixture.isBall) {
               var p = fixture.getBody().getWorldCenter()
                console.debug(p.y + " " + p1.y)
               if (p.y === p1.y)
                    bottomEdge()
            }
        }

    }

    RayCast {
        id: topSensor

        property point p1: Qt.point(edge.x, edge.y)
        property point p2: Qt.point(edge.x + edge.width, edge.y)

        onFixtureReported: {
            if (fixture.isBall) {
                topEdge()
            }
        }
    }

    RayCast {
        id: leftSensor

        property point p1: Qt.point(edge.x, edge.y)
        property point p2: Qt.point(edge.x, edge.y + edge.height)

        onFixtureReported: {
            if (fixture.isBall) {
                leftEdge()
            }
        }
    }

    RayCast {
        id: rightSensor

        property point p1: Qt.point(edge.x + edge.width, edge.y)
        property point p2: Qt.point(edge.x + edge.width, edge.y + edge.height)

        onFixtureReported: {
            if (fixture.isBall) {
                rightEdge()
            }
        }
    }*/
}
