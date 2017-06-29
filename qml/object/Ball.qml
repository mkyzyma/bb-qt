import QtQuick 2.5
import Box2D 2.0
import "../global"

Rectangle {
    id: ball
    radius: 24
    color: StyleColor.ballColor
    property alias body: ballBody

    property int kickForce: 5
    property int tiltForce: 1
    property int score: 0
    property int breakForce: 1000

    property FrictionJoint fJoint

    property alias density: ballShape.density
    property alias friction: ballShape.friction
    property alias restitution: ballShape.restitution

    width: radius * 2
    height: width

    Body{
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
        }

    }

    function push(x, y, f){
        var p = Qt.point(x*f, y*f)
        ballBody.applyLinearImpulse(p, ballBody.getWorldCenter());
    }

    function tilt(xRot, yRot){
        push(xRot, -yRot, tiltForce);
    }

    function kick(x, y){
        var ballCenter = ballBody.getWorldCenter();

        var ix = x - ballCenter.x;
        var iy = y - ballCenter.y;

        push(ix, iy, kickForce)
    }

    function breakStart(){
        ballBody.fixedRotation = true
        fJoint.maxForce = breakForce
    }

    function breakEnd(){
        ballBody.fixedRotation = false
        fJoint.maxForce = 0
    }
}
