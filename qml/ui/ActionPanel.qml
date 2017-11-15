import QtQuick 2.9
import "../Scale.js" as Scl
VPanel {
    id: panel

    signal breakPressed
    signal breakReleased

    PlayButton {
        id: breakButton

        onPressed: breakPressed()
        onReleased: breakReleased()
    }
}
