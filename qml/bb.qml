import QtQuick 2.9
import QtQuick.Window 2.3
import Box2D 2.0
import QtSensors 5.9

import "Scale.js" as Sc

import "ui"
import "global"
import "module"

Window {
    id: win
    visible: true

    width: 900
    height: 480
    title: qsTr("Balls & Boxes")

    color: "DimGray"

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
                startRect.height = win.height;
                startRect.width = win.width;

                startAnim.start();

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

        Rectangle {
            id: startRect
            color: "DimGray"

            NumberAnimation {
                id: startAnim
                target: startRect
                property: "opacity"
                duration: 600
                easing.type: Easing.InOutQuad
                from: 1
                to: 0
            }
        }

        TiltSensor {
            id: tilt
            active: true
            Component.onCompleted: tilt.calibrate()
        }

        Component.onCompleted: {
            Sc.config(screen);
            loader.loadStart();
        }
    }
}
