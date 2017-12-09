import QtQuick 2.9

import "../Scale.js" as Sc
import "object"
Item {
    id: ui

    property Ball ball

    signal breakPressed
    signal breakReleased
    signal blastPressed

    StatePanel {
        id: statePanel
        anchors.top: ui.top
        anchors.right: ui.right

    }

    ActionPanel {
        anchors.right: ui.right
        anchors.rightMargin: 20
        anchors.verticalCenter: ui.verticalCenter
        onBreakPressed: ui.breakPressed()
        onBreakReleased: ui.breakReleased()
        onBlastPressed: ui.blastPressed()
    }

   function setBall(ball) {
       console.debug("GameUi.setBall");
       statePanel.setBall(ball);
   }
}
