import QtQuick 2.9
import "../../global"
Item {
    id: logo
    width: 330
    height: 330

    property int itemWidth: 250
    property int fontSize: 100

    Rectangle {
        id: box
        width: itemWidth
        height: width
        radius: width / 15

        anchors.top: logo.top
        anchors.right: logo.right

        color: StyleColor.enemyColor       
    }

    Rectangle {
        id: ball
        width: itemWidth;
        height: width
        radius: width / 2

        anchors.bottom: logo.bottom
        anchors.left: logo.left

        color: StyleColor.ballColor        
    }
}
