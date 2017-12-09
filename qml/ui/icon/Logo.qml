import QtQuick 2.9
import "../../global"
Item {
    id: logo
    width: 330
    height: 330


    property int itemWidth: 250
    property int fontSize: 100

    /*Rectangle {
        id: border
        anchors.fill: logo
        color: "lightGreen"
        border.width: 1
        border.color: "lightGray"
    }*/

    Rectangle {
        id: box
        width: itemWidth
        height: width
        radius: width / 15

        anchors.top: logo.top
        anchors.right: logo.right

        color: StyleColor.enemyColor

        /*border.color: Qt.darker(color, 1.1)
        border.width: 5*/
    }

    Rectangle {
        id: ball
        width: itemWidth;
        height: width
        radius: width / 2

        anchors.bottom: logo.bottom
        anchors.left: logo.left

        color: StyleColor.ballColor

        /*border.color: Qt.darker(color, 1.1)
        border.width: 5*/
        /*Rectangle {
            width: 20
            height: width
            radius: width / 2

            y: 100
            x: 70

            color: "black"
        }

        Rectangle {
            width: 20
            height: width
            radius: width / 2

            y: 100
            x: 150

            color: "black"
        }*/
    }

    Text {
        color: StyleColor.ballColor
        text: "Ball"
        y: -20
        anchors.left: logo.left
        font.pixelSize: fontSize
        font.bold: true
        opacity: 0.8
    }

    Text {
        color: StyleColor.enemyColor
        text: "Box"
        anchors.bottom: logo.bottom
        anchors.right: logo.right
        font.pixelSize: fontSize
        font.bold: true
        opacity: 0.8
    }

    /*Text {
        color: "DimGray"
        text: "&"
        anchors.centerIn: logo
        font.pixelSize: fontSize
        font.bold: true
        opacity: 0.8
    }*/


}
