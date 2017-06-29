import QtQuick 2.0
import "../object"

LevelBase{
    id: level

    width: sceneWidth
    height: sceneHeight * 2

    Wall{
        height: 20
        x: parent.x
        y: parent.y + sceneHeight - height / 2
        width: sceneWidth - 100
    }

    Wall{
        width: 10
        x: parent.x + sceneWidth / 2
        y: parent.y
        height: sceneHeight - 100
    }

    Wall{
        height: 10
        x: parent.x + 100
        y: parent.y + sceneHeight + sceneHeight / 2
        width: sceneWidth - 100
    }

    Wall{
        width: 10
        x: parent.x + sceneWidth / 3
        y: parent.y + sceneHeight
        height: sceneHeight / 3
    }

    Wall{
        width: 10
        x: parent.x + sceneWidth / 3 * 2
        y: parent.y + sceneHeight + sceneHeight / 3 - 30
        height: sceneHeight / 2
    }

    Food{
        id: food1
        x: 200
        y: 200
    }

    Component.onCompleted: {
        ball.x = 100
        ball.y = level.height / 3 - ball.height / 2
    }
}


