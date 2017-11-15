import QtQuick 2.9
import "ui"
import "Scale.js" as Sc
import "object"
Item {
    id: ui

    property Ball ball

    signal breakPressed
    signal breakReleased

    StatePanel {
        id: statePanel
        anchors.top: ui.top
        anchors.right: ui.right
        ball: ball
    }

    ActionPanel {
        anchors.right: ui.right
        anchors.rightMargin: 20
        anchors.verticalCenter: ui.verticalCenter
        onBreakPressed: ui.breakPressed()
        onBreakReleased: ui.breakReleased()
    }

    Component.onCompleted: {
        statePanel.ball = ball
    }
}
