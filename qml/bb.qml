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

    width: 800
    height: 600
    title: qsTr("Balls & Boxes")

    color: "DimGray"
    property string state: "start"

    onClosing: {
        if (state != "start") {
            close.accepted = false;
            switch (state) {
            case "game":
                pause.show();
                loader.item.pause();
                state = "pause";
                break;
            case "pause":
                pause.hide();
                loader.item.resume();
                state = "game";
            }
        }
    }

    Rectangle {
        id: screen

        width:  win.width
        height: win.height

        color: "#ECEFF1"


        transform: Scale {
            id: tr
        }
        Loader {
            id: loader


            onLoaded: {
                tr.xScale = Sc.scaleFactor;
                tr.yScale = Sc.scaleFactor;

                startRect.height = win.height / Sc.scaleFactor;
                startRect.width = win.width / Sc.scaleFactor;

                startAnim.start();
            }

            function loadStart() {
                loader.setSource("module/Start.qml", { winHeight: win.height, winWidth: win.width });
                win.state = "start";
            }

            function loadGame() {
                tiltSensor.calibrate();
                loader.setSource("module/Game.qml", { tilt: tiltSensor});
                win.state = "game";
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
            id: tiltSensor
            active: true
            Component.onCompleted: tiltSensor.calibrate()
        }

        Component.onCompleted: {            
            Sc.config(screen);
            loader.loadStart();
        }

        Pause {
            id: pause;
            onExit: loader.loadStart();
        }
    }
}
