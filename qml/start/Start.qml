import QtQuick 2.9
import "../Scale.js" as Sc
import "../global"
import "../ui/icon"

import ".."

BaseModule{
    id: startPanel
    color: "lightGray"

    Rectangle {
        id: rightPanel
        height: startPanel.height
        width: logo.width + 45

        color: "Gray"
    }

    Logo{
        id: logo
        anchors.top: startPanel.top
        anchors.left: startPanel.left
        anchors.margins: 20
    }

    Rectangle {
        anchors.left: rightPanel.left
        anchors.right: rightPanel.right
        anchors.bottom: rightPanel.bottom
        color: Qt.darker(rightPanel.color, 1.3)
        height: 100
    }

    Flow {
        padding: 20
        spacing: 20
        anchors.left: rightPanel.right
        anchors.right: startPanel.right
        anchors.top: startPanel.top
        anchors.bottom: startPanel.bottom

        EpisodeButton {
            text: "Episode 1"
        }

        EpisodeButton {
            text: "Episode 2"
        }
        EpisodeButton {
            text: "Episode 3"
        }

        EpisodeButton {
            text: "Episode 4"
        }
        EpisodeButton {
            text: "Episode 5"
        }

        EpisodeButton {
            text: "Episode 6"
        }

    }
}
