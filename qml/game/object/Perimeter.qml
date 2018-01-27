import QtQuick 2.0

Item {
    id: perimeter
    anchors.fill: parent;

    Wall {
        id: bottom
        height: 10
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }

    Wall {
        id: top
        height: 10
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Wall {
        id: left
        width: 10
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
        }
    }

    Wall {
        id: right
        width: 10
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }
    }

    function setActive(isActive) {
        top.body.active = isActive;
        left.body.active = isActive;
        right.body.active = isActive;
        bottom.body.active = isActive;
    }
}
