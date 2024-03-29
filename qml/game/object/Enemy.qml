import QtQuick 2.9
import Box2D 2.0

import "../../global"
Rectangle{
    id: enemy
    width: 20
    height: width
    radius: 3
    color: StyleColor.enemyColor

    property alias body: enemyBody

    property alias density: enemyShape.density
    property alias friction: enemyShape.friction
    property alias restitution: enemyShape.restitution

    property real force: 1 //Сила притяжения
    property int damage: 5 //Сила удара
    property real distance: 9999

    property Ball ball: levelBase.ball

    Body {
        id: enemyBody
        target: enemy

        bodyType: Body.Dynamic

        Box {
            id: enemyShape
            width: enemy.width
            height: enemy.height

            density: 0
            friction: 0
            restitution: 0.5

            property bool isEnemy: true
            property alias damage: enemy.damage

        }
    }

    FrictionJoint {
        id: enemyAirFriction

        bodyA: enemyBody
        bodyB: sceneAnchor

        maxForce: 0
        maxTorque: 0
    }

    function follow() {
        var b = ball.body.getWorldCenter();
        var e = enemy.body.getWorldCenter();

        var ix = b.x - e.x;
        var iy = b.y - e.y;

        var p = Qt.point(ix, iy);
        var l = Math.sqrt(p.x*p.x + p.y*p.y)

        p.x = (p.x / (l*5)) * force;
        p.y = (p.y / (l*5)) * force;

        enemyBody.applyLinearImpulse(p, e);
    }

    function setBall(_ball) {
        ball = _ball;
        ball.move.connect(follow);
        ball.blast.connect(blast);
    }

    function blast() {

        var b = ball.body.getWorldCenter();
        var e = enemy.body.getWorldCenter();

        var ix = e.x - b.x;
        var iy = e.y - b.y;

        var p = Qt.point(ix, iy);
        var l = Math.sqrt(p.x*p.x + p.y*p.y)

        if (l <= ball.blastRadius) {

            p.x = (p.x * 100 / (l * l)) * ball.usedEnergy;
            p.y = (p.y * 100 / (l * l)) * ball.usedEnergy;

            enemyBody.applyLinearImpulse(p, e);
        }
    }
}
