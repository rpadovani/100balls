import QtQuick 2.0
import Bacon2D 1.0
import "../js/game.js" as Game

Component {
    Entity {
        id: glass
        bodyType: Entity.Kinematic

        height: units.gu(8)
        width: units.gu(8)

        updateInterval: 1

        sleepingAllowed: true

        property var lineColor: "#DD4814"
        property var backgroundColor: Qt.rgba(1, 0.49, 0.31, 0.5) 
        property bool launchedOther: false

        function doDestroy() {
            destroy();
        }

        Component.onCompleted: {
            var color = Math.floor(Math.random()*level);

            if (color >= 5 && color < 10) {
                glassScore = 2;
            }
            if (color >= 10 && color < 15) {
                glassScore = 3;
            }
            if (color >= 15 && color < 20) {
                glassScore = 4;
            }
            if (color >= 20 && color < 25) {
                glassScore = 5;
            }
            if (color >= 25 && color < 30) {
                glassScore = 6;
            }
            if (color >= 30 && color < 35) {
                glassScore = 7;
            }
            if (color >= 35 && color < 40) {
                glassScore = 8;
            }
        }

        fixtures: [ 
            Edge {
                vertices: [
                    Qt.point(0, 0),
                    Qt.point(parent.width / 4, parent.height)
                ]
            },
            Edge {
                vertices: [
                    Qt.point(parent.width, 0),
                    Qt.point(parent.width * 3/4, parent.height)
                ]
            },
            Edge {
                vertices: [
                    Qt.point(parent.width / 4, parent.height),
                    Qt.point(parent.width * 3/4 , parent.height)
                ]
                sensor: true
                onBeginContact: {
                    other.parent.glassContact = true;
                }
            }
        ]

        Canvas {
            id: glassCanvas
            anchors.fill: parent

            onPaint: {
                var context = glassCanvas.getContext("2d");
                context.beginPath();
                context.strokeStyle = lineColor;
                context.moveTo(0, 0);
                context.lineTo(width / 4, height);
                context.lineTo(width * 3/4, height);
                context.lineTo(width, 0);
                context.stroke();
                context.fillStyle = backgroundColor;
                context.fill();
            }
        }

        behavior: ScriptBehavior {
            script: {
                var newPos = entity.x - velocity;
                if (newPos < scene.width / 3 && !entity.launchedOther){
                    Game.launchGlass();
                    entity.launchedOther = true;
                }

                if (newPos < -2 * entity.width) {
                    glass.doDestroy();
                }
                else {
                    entityAnimation.from = entity.x;
                    entityAnimation.to = newPos;
                    entityAnimation.running = true;
                }
            }
        }

        NumberAnimation {id: entityAnimation; target: glass; property: "x"; duration: 100}
    }
}
