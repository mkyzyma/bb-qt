import QtQuick 2.9
import "../Scale.js" as Scl
VPanel {
    id: panel

    signal breakPressed
    signal breakReleased

    signal blastPressed
    signal blastReleased

    PlayButton {
        id: breakButton

        onPressed: breakPressed()
        onReleased: breakReleased()
    }

    PlayButton {
        id: blastButton

        onPressed: blastPressed()
        onReleased: blastReleased()
    }
}
