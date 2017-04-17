import QtQuick 2.0
import "ui"
import "Scale.js" as Sc
Item {
    id: ui


    signal breakPressed
    signal breakReleased

    ActionPanel{
        anchors.right: ui.right
        anchors.rightMargin: 20
        anchors.verticalCenter: ui.verticalCenter
        onBreakPressed: ui.breakPressed()
        onBreakReleased: ui.breakReleased()
    }

    transform: Scale{
        id: scale
    }

    Component.onCompleted: {
        scale.xScale = Sc.scaleFactor;
        scale.yScale = Sc.scaleFactor;
    }
}
