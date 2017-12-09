import QtQuick 2.9
import "Scale.js" as Sc
Rectangle {
    id: baseModule
    property int winHeight
    property int winWidth

    Component.onCompleted: {
        baseModule.height = winHeight / Sc.scaleFactor;
        baseModule.width = winWidth / Sc.scaleFactor;
    }
}
