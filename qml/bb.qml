import QtQuick 2.9
import QtQuick.Window 2.3
import Box2D 2.0
import QtSensors 5.9

import "ui"
import "Scale.js" as Sc
import "global"
import "module"
Window {
    id: win
    visible: true

    width: 640
    height: 480
    title: qsTr("B&B")

    Rectangle {
        id: screen

        width:  win.width
        height: win.height

        color: "#ECEFF1"

        Loader {
            id: loader

            transform: Scale {
                id: tr
            }

            onLoaded: {
                tr.xScale = Sc.scaleFactor;
                tr.yScale = Sc.scaleFactor;
            }

            function loadStart() {
                loader.setSource("module/Start.qml", { winHeight: win.height, winWidth: win.width });
            }

            function loadGame() {
               tilt.calibrate();
               loader.setSource("module/Game.qml", { tilt: tilt});
            }
        }

        /*Component {
            id: game
            Game {}
        }

        Component {
            id: start

            Start{
                winHeight: win.height
                winWidth: win.width
            }
        }*/

        TiltSensor{
            id: tilt
            active: true
            Component.onCompleted: {
                console.debug("CALIBRATE");
                tilt.calibrate();
            }

        }

        Component.onCompleted: {            
            Sc.config(screen);
            loader.loadStart();
        }
    }
}
