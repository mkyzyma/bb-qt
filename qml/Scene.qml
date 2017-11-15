import QtQuick 2.9
import Box2D 2.0
import QtSensors 5.9
import "Scale.js" as Scl
import "level"
import "object"
import "sensor"
import "global"
Rectangle {
    id: scene

    width: Scl.defWidth
    height: Scl.defHeight

    property Ball ball: level.ball
    property Rectangle screen   

    World {
        id: bbWorld
        gravity.y: 0
        gravity.x: 0
        pixelsPerMeter: 10
    }

    Level1{
        id: level

        sceneWidth: scene.width
        sceneHeight: scene.height
    }

    Body{
        id: sceneAnchor

        Box{
            id: anchorBox
            width: scene.width
            height: scene.height
        }
    }

    EdgeSensor {
        id: edgeSensor

        width: scene.width
        height: scene.height


        onBottomEdge: {
            console.debug("bottom");
            level.moveY(scene.height)
        }
        onTopEdge: {
            console.debug("top")
            level.moveY(-scene.height)
        }
        onRightEdge: {
            console.debug("right")
            level.moveX(scene.width)
        }
        onLeftEdge: {
            console.debug("left")
            level.moveX(-scene.width)
        }

    }
}
