import QtQuick 2.0
import Box2D 2.0

import "../Scale.js" as Scl
import "../sensor"
import "../game/level"

Rectangle {
    id: backScene

    width: Scl.defWidth
    height: Scl.defHeight

    property Rectangle screen

    Text{
        anchors.centerIn: parent
        text: "BackScene"
    }

    Body{
        id: sceneAnchor

        Box{
            id: anchorBox
            width: backScene.width
            height: backScene.height
        }
    }

    World {
        id: backWorld
        gravity.y: 0
        gravity.x: 0
        pixelsPerMeter: 10
    }

    Level1 {
        id: level
        sceneWidth: backScene.width
        sceneHeight: backScene.height
    }

    Rectangle{
        anchors.fill: level

        color: "black"
        opacity: 0.7
    }

    Timer {
        interval: 5000; running: true; repeat: true
        onTriggered: {
            var s = 1000;
            var ix = Math.random(s);
            var iy = Math.random(s);

            level.ball.kick(ix,iy);
        }
    }

    /*EdgeSensor {
        id: edgeSensor

        width: backScene.width
        height: backScene.height


        onBottomEdge: {
            console.debug("bottom");
            level.moveY(backScene.height)
        }
        onTopEdge: {
            console.debug("top")
            level.moveY(-backScene.height)
        }
        onRightEdge: {
            console.debug("right")
            level.moveX(backScene.width)
        }
        onLeftEdge: {
            console.debug("left")
            level.moveX(-backScene.width)
        }

    }*/


    Component.onCompleted: {
        level.ball.kick(10,10);
    }

    function pause() {
        backWorld.running = false;
    }

    function resume() {
        backWorld.running = true;
    }
}
