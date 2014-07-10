import QtQuick 2.0
import Bacon2D 1.0

Component {
    Entity {
        id: ballEntity
        width: units.gu(1.3)
        height: units.gu(1.3)

        bodyType: Entity.Dynamic
        sleepingAllowed: false

        property color ballColor: Qt.rgba(0.86, 0.28, 0.07, 1)
        property int ballLevel: 1
        property bool glassContact: false

        fixtures: Circle {
            radius: parent.width / 2
            anchors.centerIn: parent
            density: 2
            friction: 0.5
            restitution: 0.2
        }

        Rectangle {
            radius: parent.width / 2
            color: parent.ballColor
            width: parent.width
            height: parent.height
        }

        function doDestroy() {
            numberOfBalls--;
            destroy();
        }

        behavior: ScriptBehavior {
            script: {
                if (entity.y > scene.height) {
                    if (entity.glassContact === true) {
                        entity.x = scene.width / 2;
                        entity.y = 0;
                        entity.glassContact = false;
                        score += ballLevel;
                    }
                    else {
                        ballEntity.doDestroy();
                    }
                }
            }
        }
    }
}
