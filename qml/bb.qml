import QtQuick 2.6
import QtQuick.Window 2.2
import Box2D 2.0
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
               loader.setSource("module/Game.qml");
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

        Component.onCompleted: {            
            Sc.config(screen);
            loader.loadStart();
        }
    }
}
