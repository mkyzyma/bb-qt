import QtQuick 2.9
import Box2D 2.0
import QtGraphicalEffects 1.0
import "../global"
import "../Scale.js" as Sc
Rectangle {
    id: ball
    radius: 24
    color: StyleColor.ballColor
    property alias body: ballBody

    property int kickForce: 5 // Сила удара

    property real blastForce: 30 // Сила расталкивания
    property real blastRadius: 100 // Радиус расталкивания

    property real tiltForce: 1.3 // Сила качения
    property int score: 0 // Очки
    property int breakForce: 1000 // Сила торможения
    property int health: 100 // Здоровье
    property bool rip: false // Умер

    property FrictionJoint fJoint

    property alias density: ballShape.density
    property alias friction: ballShape.friction
    property alias restitution: ballShape.restitution

    signal eat(int score)
    signal damage(int power)
    signal die()
    signal move()
    signal blast()

    width: radius * 2
    height: width

    Body {
        id: ballBody
        target: ball

        bodyType: Body.Dynamic

        Circle {
            id: ballShape
            radius: ball.radius

            density: 10
            friction: 0
            restitution: 0.25

            property bool isBall: true

            onBeginContact: {
                if(other.isFood) {
                    var food = other;
                    food.eat();
                    ball.eat(food.score);
                    ball.score += food.score;
                }
                if (other.isEnemy) {
                    doDamage(other.damage);
                }
            }
        }        

        onPositionChanged: {
            move()
        }

    }

    ColorAnimation on color {
        id: damageAnim
        from: StyleColor.enemyColor
        to: StyleColor.ballColor
        duration: 200
    }

    Rectangle {
        id: blastShape
        anchors.centerIn: parent
        width: blastRadius * 2
        height: width
        radius: width / 2
        opacity: 0

        RadialGradient {
            anchors.fill: parent

            gradient: Gradient {
                GradientStop { position: 0.0; color: StyleColor.ballColor }
                GradientStop { position: 0.5; color: StyleColor.floreColor }
            }
        }


        NumberAnimation {
            id: blastStartAnim
            target: blastShape
            property: "opacity"
            duration: 100
            easing.type: Easing.InQuad
            from: 0
            to: 0.5
            onStopped: {
                blastEndAnim.start();
            }
        }

        NumberAnimation {
            id: blastEndAnim
            target: blastShape
            property: "opacity"
            duration: 100
            easing.type: Easing.InQuad
            from: 0.5
            to: 0
        }
    }

    function push(x, y, f) {
        if (!rip) {
            var p = Qt.point(x*f, y*f);
            ballBody.applyLinearImpulse(p, ballBody.getWorldCenter());
        }
    }

    function tilt(xRot, yRot) {
        push(xRot, -yRot, tiltForce);
    }

    function kick(x, y) {
        var ballCenter = ballBody.getWorldCenter();

        var ix = x - ballCenter.x;
        var iy = y - ballCenter.y;

        push(ix, iy, kickForce);
    }

    function breakStart() {
        ballBody.fixedRotation = true;
        fJoint.maxForce = breakForce;
    }

    function breakEnd() {
        ballBody.fixedRotation = false;
        fJoint.maxForce = 0;
    }

    function doDamage(power) {

        if (health > 0)
        {
            damage(power);
            ball.health -= power;

            if(ball.health <= 0) {
                doDie();
            }
            else {
                damageAnim.start();
            }
        }
    }

    function doDie () {
        die();
        ball.rip = true;
        ball.color = StyleColor.enemyColor;
    }

    function doBlast () {
        blastStartAnim.start();
        blast();
    }
}
