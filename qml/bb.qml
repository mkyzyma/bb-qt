import QtQuick 2.6
import QtQuick.Window 2.2
import Box2D 2.0
import "ui"
import "Scale.js" as Sc
import "global"
Window {
    id: win
    visible: true

    width: 800
    height: 600
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
            ball: scene.ball
        }

        Component.onCompleted: {            
            Sc.config(screen);
            ui.height = win.height / Sc.scaleFactor;
            ui.width = win.width / Sc.scaleFactor;
            ui.ball = scene.ball
        }
    }
}
