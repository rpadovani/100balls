import QtQuick 2.0
import Ubuntu.Components 0.1
import Bacon2D 1.0
import "components"
import "js/setup.js" as Setup
import "js/game.js" as Game

MainView {
    id: mainview
    objectName: "mainView"
    applicationName: "com.ubuntu.developer.rpadovani.100balls"

    width: units.gu(50)
    height: units.gu(75)

    useDeprecatedToolbar: false

    property bool isDoorOpen: false
    property int numberOfBalls: 100
    property int score: 0

    onNumberOfBallsChanged: {
        if (numberOfBalls === 0) {
            Game.endGame();
        }
    }

    PageStack {
        id: pagestack

        Component.onCompleted: {
            var component = Qt.createComponent(Qt.resolvedUrl("components/StartPage.qml"));
            var page = component.createObject(mainview, {highScore: settings.highScore});
            pagestack.push(page);
        }

        Game {
            id: game
            width: units.gu(50)
            height: units.gu(75)

            gameName: "100Balls"

            Settings {
                id: settings
                property int highScore: 0;
            }

            Scene {
                id: scene
                anchors.fill: parent

                physics: true
                running: false


                BallComponent {
                    id: ballComponent
                }

                Glass {
                    id: glass
                }

                Bowl {
                    id: bowl
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: ballCounter
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 0

                    font.pixelSize: 13
                    horizontalAlignment: Text.AlignCenter

                    text: numberOfBalls
                }

                Text {
                    id: scoreText
                    anchors.centerIn: parent

                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignCenter

                    text: score
                }

                Entity {
                    id: door
                    height: units.gu(1)
                    width: units.gu(6.25)
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: bowl.bottom

                    fixtures: Box {
                        anchors.fill: parent
                        sensor: isDoorOpen
                        Edge {
                            vertices: [
                                Qt.point(0, 0),
                                Qt.point(width, 0)
                            ]
                        }
                    }

                    Canvas {
                        id: canvas
                        visible: !isDoorOpen

                        anchors.fill: parent

                        onPaint: {
                            var context = canvas.getContext("2d");
                            context.beginPath();

                            context.moveTo(0, 0);
                            context.lineTo(width, 0);

                            context.strokeStyle = "black";
                            context.stroke();
                        }
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: isDoorOpen = true;
                    onReleased: isDoorOpen = false;
                }
            }
        }
    }
}
