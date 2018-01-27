import QtQuick 2.9

import "ui"
import "Scale.js" as Sc


Item {
    id: baseModule
    property int winHeight
    property int winWidth

    Header{
        z: 100
    }



    Component.onCompleted: {
        baseModule.height = winHeight / Sc.scaleFactor;
        baseModule.width = winWidth / Sc.scaleFactor;
    }
}
