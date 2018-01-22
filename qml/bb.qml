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
                backScene.worldPause();
                state = "pause";
                break;
            case "pause":
                pause.hide();
                loader.item.resume();
                backScene.worldResume();
                state = "game";
                break;
            case "levelSelect":
                loader.loadStart();
                backScene.worldResume();
                state = "start";

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
                backScene.worldResume();
                backScene.resume();
                loader.setSource("start/Start.qml", { winHeight: win.height, winWidth: win.width });
                win.state = "start";

            }

            function loadGame(levelNum) {
                backScene.pause();
                tiltSensor.calibrate();
                loader.setSource("game/Game.qml", { tilt: tiltSensor, levelNumber: levelNum});
                win.state = "game";
            }

            function loadLevelSelect(levelNum){
                backScene.worldResume();
                backScene.resume();
                loader.setSource("start/LevelSelect.qml", { winHeight: win.height, winWidth: win.width });
                win.state = "levelSelect";
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

            backScene.width = screen.width / Sc.scaleFactor;
            backScene.height = screen.height / Sc.scaleFactor;
        }

        Pause {
            id: pause;
            onExit: loader.loadLevelSelect(1);
        }
    }
}
