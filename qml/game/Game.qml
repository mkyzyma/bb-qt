import QtQuick 2.9
import QtSensors 5.9

import "../Scale.js" as Sc


Item {
    id: game
    property TiltSensor tilt
    property int levelNumber
    Scene {
        id: scene
        screen: screen
    }

    GameUi {
        id: ui
        onBreakPressed: scene.ball.breakStart()
        onBreakReleased: scene.ball.breakEnd()
        onBlastPressed: scene.ball.doBlast()
    }    

    Component.onCompleted: {
        ui.height = win.height / Sc.scaleFactor;
        ui.width = win.width / Sc.scaleFactor;        
        tilt.onReadingChanged.connect(onTilt);
    }    

    function onTilt() {
        scene.ball.tilt(tilt.reading.xRotation, tilt.reading.yRotation)
    }

    function pause() {
        console.debug("pause");
        scene.pause();
    }

    function resume() {
        console.debug("resume");
        scene.resume();
    }

    function setBall(ball) {
        console.debug("Game.setBall");
        ui.setBall(ball);
    }
}
