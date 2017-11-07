import QtQuick 2.5
import Box2D 2.0
import ".."
import "../level"
Rectangle{
    id: enemy
    width: 20
    height: width
    radius: 3
    color: "red"

    property alias body: enemyBody

    property alias density: enemyShape.density
    property alias friction: enemyShape.friction
    property alias restitution: enemyShape.restitution
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
            restitution: 0.3

            property bool isEnemy: true


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

        p.x = p.x / (l*3);
        p.y = p.y / (l*3);

        enemyBody.applyLinearImpulse(p, e);

        //enemyBody.applyForceToCenter(p);
    }

    function setBall(_ball) {
        ball = _ball;
        ball.move.connect(follow);
    }
}
