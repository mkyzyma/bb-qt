import QtQuick 2.9
import ".."
BaseModule {
    Flow {
        spacing: 20
        anchors.centerIn: parent;
        width: 460
        EpisodeButton {
            text: "Level 1"
            onClicked: loader.loadGame(1);

        }
        EpisodeButton {
            text: "Level 2"
        }
        EpisodeButton {
            text: "Level 3"
        }
        EpisodeButton {
            text: "Level 4"
        }
        EpisodeButton {
            text: "Level 5"
        }
        EpisodeButton {
            text: "Level 6"
        }
    }
}
