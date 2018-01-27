import QtQuick 2.9
import QtGraphicalEffects 1.0
import "../../Scale.js" as Sc
import "../object"
LevelBase {
    id: level

    width: sceneWidth
    height: sceneHeight

    Item {
        id: walls

        anchors.fill: parent;

        Perimeter{
            id: perimeter;
        }

        Wall {
            id: wall1
            width: 10
            height: sceneHeight / 2
            x: parent.x + sceneWidth / 2 - 250;
            y: (sceneHeight - height) / 2;
        }

        Wall {
            id: wall2
            width: 10
            height: sceneHeight / 2
            x: parent.x + sceneWidth / 2 + 240;
            y: (sceneHeight - height) / 2;
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
    Enemy {
        id: enemy1
        x: 200
        y: 300
    }

    Enemy {
        id: enemy2
        x: 600
        y: 100
        force: 1.5
    }

    Enemy {
        id: enemy3
        x: 250
        y: 300
    }

    Enemy {
        id: enemy4
        x: 400
        y: 100
        force: 1.5
    }

    Timer {
        id: moveTimer
        interval: 200; running: true; repeat: true
        onTriggered: {
            var ix = Math.random() * 100 - 50;
            var iy = Math.random() * 100 - 50;
            var e = Math.random() * 10;
            level.ball.health = 100;
            level.ball.push(ix, iy, e);
        }
    }

    Timer {
        id: actionTimer
        interval: 5000; running: true; repeat: true
        onTriggered: {
            level.ball.doBlast()
            interval = Math.random() * 4000 + 1000;
        }
    }

    Component.onCompleted: {
        ball.x = 100
        ball.y = level.height / 3 - ball.height / 2

        enemy1.setBall(ball)
        enemy2.setBall(ball)
        enemy3.setBall(ball)
        enemy4.setBall(ball)
    }

    function pause() {
        moveTimer.stop();
        actionTimer.stop();
        setActive(false);
    }

    function resume() {
        moveTimer.start();
        actionTimer.start();
        setActive(true);
    }

    function setActive(isActive) {
        baseSetActive(isActive);
        perimeter.setActive(isActive);
        wall1.body.active = isActive;
        wall2.body.active = isActive;

        enemy1.body.active = isActive;
        enemy2.body.active = isActive;
        enemy3.body.active = isActive;
        enemy4.body.active = isActive;
    }

}
