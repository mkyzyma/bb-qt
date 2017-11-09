import QtQuick 2.6
import Box2D 2.0
import QtSensors 5.3
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

    TiltSensor{
        id: tilt
        active: true
        Component.onCompleted: calibrate()
        onReadingChanged: ball.tilt(reading.xRotation, reading.yRotation);
    }

    transform: Scale {
        id: tr
    }

    Component.onCompleted: {
        tr.xScale = Scl.scaleFactor;
        tr.yScale = Scl.scaleFactor;

        scene.y = screen.height / 2 - (scene.height * Scl.scaleFactor) / 2


    }


}
