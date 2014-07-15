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
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import Bacon2D 1.0
import "components"
import "js/setup.js" as Setup
import "js/game.js" as Game

MainView {
    id: mainview
    objectName: "mainView"
    applicationName: "com.ubuntu.developer.rpadovani.100balls"

    height: units.gu(68)
    width: units.gu(44)

    useDeprecatedToolbar: false

    // Becomes true when the user press anywhere (but pause) and leaves the
    // balls fall
    property bool isDoorOpen: false
    // Becomes true when the game is in pause. Needs because when scene.running
    // is false all objects are destroyed, not if this is true
    property bool pause: false
    // Total number of balls in game
    property int numberOfBalls: 100
    // Score of this game
    property int score: 0
    // Actual level
    property int level: 1
    // How many points a ball does when falls in a glass
    property int glassScore: 1
    // Speed of glasses
    property real velocity: units.gu(0.3) 
    property alias running: scene.running

    onNumberOfBallsChanged: {
        if (numberOfBalls === 0) {
            Game.endGame();
        }
    }

    onScoreChanged: {
        // Every 50 points the level goes up
        level = score / 50 + 1;
    }

    onLevelChanged: {
        // At evey level the speed of glass goes up
        velocity += 0.3;
    }

    PageStack {
        id: pagestack

        Component.onCompleted: {
            // The first page is StartPage.qml
            var component = Qt.createComponent(Qt.resolvedUrl("components/StartPage.qml"));
            var page = component.createObject(mainview, {highScore: settings.highScore});
            pagestack.push(page);
        }

        Game {
            id: game
            height: units.gu(68)
            width: units.gu(44)

            gameName: "100Balls"

            Settings {
                id: settings
                property int highScore: 0;
            }
            
            Image {
                // Background of all app
                source: Qt.resolvedUrl("img/background.png")
                anchors.fill: parent
                fillMode: Image.Tile
            }

            Scene {
                id: scene
                anchors.fill: parent

                physics: true
                running: false
                //TODO: implement an argument to turn on the debug mode on
                //startup
                //debug: true

                Ball {
                    id: ball
                }

                Glass {
                    id: glass
                }

                Bowl {
                    // This is the bowl which contains all balls at the top of
                    // the scene
                    id: bowl
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Bottom {
                    // This element manages balls and take care of the score
                    anchors.bottom: parent.bottom
                }

                Text {
                    // Top element that indicate how many ball are in game
                    id: ballCounter
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 0

                    text: numberOfBalls

                    color: "white"
                    font.pixelSize: units.gu(3)
                    horizontalAlignment: Text.AlignHCenter
                }

                Text {
                    // User score
                    id: scoreText
                    anchors.centerIn: parent

                    text: "level " + level + "\n " + score + " points"

                    color: "white"
                    font.pixelSize: units.gu(2.5) 
                    horizontalAlignment: Text.AlignHCenter
                }

                Entity {
                    // When user clicks on the screen this become a sensor, and
                    // balls can fall
                    id: door
                    height: units.gu(1)
                    width: units.gu(6.25)       // This is the width of the bottleneck of the bowl
                    anchors.top: bowl.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                    fixtures: Box {
                        anchors.fill: parent
                        sensor: isDoorOpen      // <- All game is here :-)
                        Edge {
                            vertices: [
                                Qt.point(0, 0),
                                Qt.point(width, 0)
                            ]
                        }
                    }

                    Canvas {
                        id: canvas
                        visible: !isDoorOpen    // When the user clicks, hide this

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
                    // When the user press on the screen door opens and balls
                    // fall
                    anchors.fill: parent
                    onPressed: isDoorOpen = true;
                    onReleased: isDoorOpen = false;
                }

                MouseArea {
                    height: units.gu(10)
                    width: units.gu(10)

                    anchors.bottom: parent.bottom

                    onClicked: {
                        // Don't change this order!
                        // The pause is set before scene is stopped, because
                        // otherwise all objects are destructed
                        pause = true
                        scene.running = false
                        PopupUtils.open(pauseDialog)
                    }

                    Image {
                        anchors.fill: parent
                        source: Qt.resolvedUrl("img/pause.png")
                    }
                }

                Component {
                    id: pauseDialog
                    Dialog {
                        id: dialog
                        title: "Pause"
                        text: "If you quit the highscore will be saved anyway"
                        
                        Button {
                            text: "Continue game"
                            onClicked: {
                                // Don't change this order, see below!
                                PopupUtils.close(dialog)
                                scene.running = true;
                                pause = false;
                            }
                        }

                        Button {
                            text: "Exit game"
                            onClicked: {
                                PopupUtils.close(dialog)
                                // We need to restart the game, so functions
                                // can destroy all objects when the game ends
                                pause = false;
                                scene.running = true
                                Game.endGame();
                            }
                        }
                    }
                } // End component
            } // End scene
        } // End game
    } // End pagestack
} // End mainview
