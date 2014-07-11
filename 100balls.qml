/*
 * Copyright 2014 Riccardo Padovani <riccardo@rpadovani.com>
 *
 * This file is part of 100balls.
 *
 * 100balls is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by 
 * the Free Software Foundation; version 3.
 *
 * 100balls is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

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
    property int level: 1
    property var velocity: 2.0 
    property int glassScore: 1

    onNumberOfBallsChanged: {
        if (numberOfBalls === 0) {
            Game.endGame();
        }
    }

    onScoreChanged: {
        level = score / 50 + 1;
    }

    onLevelChanged: {
        velocity += 0.3;
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
                property int highLevel: 0;
            }
            
            Image {
                source: Qt.resolvedUrl("img/background.png")
                anchors.fill: parent
                fillMode: Image.Tile
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

                Bottom {
                    anchors.bottom: parent.bottom
                }

                Text {
                    id: ballCounter
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 0

                    font.pixelSize: units.gu(3)
                    color: "white"
                    horizontalAlignment: Text.AlignCenter

                    text: numberOfBalls
                }

                Text {
                    id: scoreText
                    anchors.centerIn: parent

                    font.pixelSize: units.gu(2.5) 
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter

                    text: "level " + level + "\n " + score + " points"
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
                            context.lineWidth = units.gu(0.5);

                            context.moveTo(0, 0);
                            context.lineTo(width, 0);

                            context.strokeStyle = "white";
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
