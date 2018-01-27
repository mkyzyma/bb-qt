import QtQuick 2.9
import QtGraphicalEffects 1.0
import "../object"

LevelBase {
    id: level

    width: sceneWidth
    height: sceneHeight * 2

    Item {
        id: walls

        anchors.fill: parent;

        Perimeter{
            id: perimeter;
        }

        Wall {
            height: 20
            x: parent.x
            y: parent.y + sceneHeight - height / 2
            width: sceneWidth - 100
        }

        Wall {
            width: 10
            x: parent.x + sceneWidth / 2
            y: parent.y
            height: sceneHeight - 100
        }

        Wall {
            height: 10
            x: parent.x + 100
            y: parent.y + sceneHeight + sceneHeight / 2
            width: sceneWidth - 100
        }

        Wall {
            width: 10
            x: parent.x + sceneWidth / 3
            y: parent.y + sceneHeight
            height: sceneHeight / 3
        }

        Wall {
            width: 10
            x: parent.x + sceneWidth / 3 * 2
            y: parent.y + sceneHeight + sceneHeight / 3 - 30
            height: sceneHeight / 2
        }

        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 2
            horizontalOffset: 2
            color: "#80000000"
            radius: 2
            samples: 3
        }
    }

    Food {
        x: 200
        y: 200
    }

    Food {
        x: 200
        y: 250
    }

    Food {
        x: 500
        y: 230
    }

    Food {
        x: 80
        y: 60
    }

    Food {
        x: 700
        y: 330
    }

    Food {
        x: 700
        y: 600
    }

    Food {
        x: 400
        y: 500
    }

    Food {
        x: 480
        y: 590
    }

    Food {
        x: 700
        y: 900
    }

    Food {
        x: 200
        y: 600
    }

    Food {
        x: 250
        y: 800
    }

    Enemy {
        id: enemy1
        x: 200
        y: 300
    }
    Enemy {
        id: enemy3
        x: 600
        y: 100
        force: 1.5
    }
    Enemy {
        id: enemy2
        x: 200
        y: 500
        force: 2
    }



    Component.onCompleted: {
        ball.x = 100
        ball.y = level.height / 3 - ball.height / 2

        enemy1.setBall(ball)
        enemy2.setBall(ball)
        enemy3.setBall(ball)
    }
}


