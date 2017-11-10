import QtQuick 2.6
import QtQuick.Window 2.2
import Box2D 2.0
import "ui"
import "Scale.js" as Sc
import "global"
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
        }

        /*Scene {

        }*/


        Component {
            id: game

            Item {
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
                }


            }

        }

        Component {
            id: start

            Rectangle{
                id: startPanel
                color: "DimGray"

                Rectangle {
                    anchors.centerIn: startPanel
                    id: startButton
                    color: "WhiteSmoke"
                    radius: 10
                    width: 100
                    height: width

                    Text {
                        font.bold: true
                        color: "DarkOrange"
                        anchors.centerIn: startButton
                        text: "Пехали!"
                        font.pixelSize: 18
                    }

                    MouseArea {
                        anchors.fill: startButton

                        onClicked: {
                            loader.sourceComponent = game;
                        }
                    }
                }

                Component.onCompleted: {
                    startPanel.height = win.height / Sc.scaleFactor;
                    startPanel.width = win.width / Sc.scaleFactor;
                }
            }

        }

        Component.onCompleted: {            
            Sc.config(screen);
            loader.sourceComponent = start;
        }
    }
}
