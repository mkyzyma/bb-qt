import QtQuick 2.9
import "../Scale.js" as Sc

import ".."

BaseModule {
    id: pause

    height: 0

    y: -5000

    signal exit()
    signal resume()

    Rectangle {
        id: rect
        anchors.fill: parent;
        color: "black"
        opacity: 0.5
    }

    Rectangle {
        id: exitButton        
        width: 150
        height: 50

        Text {
            font.bold: true
            color: "DarkOrange"
            anchors.centerIn: exitButton
            text: "Выход"
            font.pixelSize: 18
        }

        MouseArea {
            anchors.fill: exitButton
            onClicked: {
                collapce();
                exit();
            }
        }
    }

    NumberAnimation {
        id: showAnim
        target: pause
        property: "opacity"
        duration: 300
        easing.type: Easing.InOutQuad
        from: 0
        to: 1
    }
    NumberAnimation {
        id: hideAnim
        target: pause
        property: "opacity"
        duration: 300
        easing.type: Easing.InOutQuad
        from: 0.5
        to: 0

        onStopped: {
            collapce();
        }
    }
    function collapce() {
        y = -5000;
    }

    function hide() {
        hideAnim.start();
    }

    function show() {
        y = 0;
        height = win.height / Sc.scaleFactor;
        width = win.width / Sc.scaleFactor;
        showAnim.start();

    }
}

