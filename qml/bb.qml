import QtQuick 2.6
import QtQuick.Window 2.2
import Box2D 2.0
import "ui"
import "Scale.js" as Sc
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

        Scene {
            id: scene
            screen: screen
        }        

        Ui{
            id: ui;
            onBreakPressed: scene.ball.breakStart()
            onBreakReleased: scene.ball.breakEnd()
        }

        Component.onCompleted: {
            Sc.config(screen);
            ui.height = win.height / Sc.scaleFactor;
            ui.width = win.width / Sc.scaleFactor;
        }
    }
}
