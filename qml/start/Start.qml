import QtQuick 2.9

import "../Scale.js" as Sc
import "../global"
import ".."

BaseModule{
    id: startPanel

    Flow {
        spacing: 20       
        anchors.centerIn: parent;
        width: 460
        EpisodeButton {
            text: "Episode 1"
            onClicked: loader.loadLevelSelect(1);
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
