import QtQuick 2.9
import QtQuick.Window 2.3
import Box2D 2.0
import QtSensors 5.9

import "Scale.js" as Sc

import "ui"
import "global"
import "pause"

Window {
    id: win
    visible: true

    width: 480
    height: 320
    title: qsTr("Balls & Boxes")

    color: "DimGray"

    // Текущее состояние
    property string state: "start"

    // Кноака назад
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

    Item {
        id: screen

        width:  win.width
        height: win.height

        //Масштабирование
        transform: Scale {
            id: tr
        }

        BackScene{
            id: backScene
        }

        //Загрузчик модулей
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
                //backScene.resume();
                loader.setSource("start/Start.qml", { winHeight: win.height, winWidth: win.width });
                win.state = "start";

            }

            function loadGame(levelNum) {
                //backScene.pause();
                tiltSensor.calibrate();
                loader.setSource("game/Game.qml", { tilt: tiltSensor, levelNumber: levelNum});
                win.state = "game";
            }
        }

        //Плавное переключение модулей
        Rectangle {
            id: startRect
            color: "Black"

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
