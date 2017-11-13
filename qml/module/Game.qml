import QtQuick 2.9
import QtSensors 5.9

import "../Scale.js" as Sc
import ".."

Item {
    property TiltSensor tilt
    Scene {
        id: scene
        screen: screen
    }

    GameUi{
        id: ui
        onBreakPressed: scene.ball.breakStart()
        onBreakReleased: scene.ball.breakEnd()
    }

    Rectangle {
        id: startRect
        color: "DimGray"
    }


    NumberAnimation {
        id: startAnim
        target: startRect
        property: "opacity"
        duration: 400
        easing.type: Easing.InOutQuad
        from: 1
        to: 0
    }

    Component.onCompleted: {
        ui.height = win.height / Sc.scaleFactor;
        ui.width = win.width / Sc.scaleFactor;

        startRect.height = ui.height;
        startRect.width = ui.width;

        startAnim.start();

        ui.ball = scene.ball;

        tilt.onReadingChanged.connect(onTilt);
    }

    function onTilt() {
        scene.ball.tilt(tilt.reading.xRotation, tilt.reading.yRotation)
    }

}
