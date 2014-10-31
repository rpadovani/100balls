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

import QtQuick 2.2
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import Bacon2D 1.0
import "../js/game.js" as Game

Scene {
    gravity: Qt.point(0, 15)
    physics: true
    running: false
    clip: true
    // Becomes true when the user press anywhere (but pause) and leaves the
    // balls fall
    property bool isDoorOpen: doorControl.pressed

    Timer {
        id: timeChallengeTimer
        // For time challenge version only
        interval: 1000

        onTriggered: remTime--;
        running: gameType === 'time' && gameScene.running
        repeat: true
    }

    Rectangle {
        anchors {
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
            bottomMargin: units.gu(16)
        }
        width: parent.width
        height: 1
        color: "white"
        opacity: 0.1
        z: -10
    }

    Bowl {
        // This is the bowl which contains all balls at the top of
        // the scene
        id: bowl
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Bottom {
        // This element manages balls and take care of the score
        anchors {
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
        }
    }

    Label {
        // Top element that indicate how many ball are in game
        id: ballCounter
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0

        fontSize: "large"
        text: numberOfBalls

        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    Label {
        // How many seconds user has before the end of the game.
        // For timeChallenge mode only
        visible: gameType === 'time'

        anchors.horizontalCenter: parent.horizontalCenter
        y: ballCounter.height + units.gu(3)

        fontSize: "large"
        text: remTime;

        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    Column {
        anchors.centerIn: parent
        width: parent.width

        Label {
            id: levelText

            fontSize: "large"
            color: "white"
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.Bold

            text: "level " + level
        }

        Label {
            id: scoreText

            fontSize: "large"
            color: "white"
            width: parent.width
            horizontalAlignment: Text.AlignHCenter

            text: score + " points"
        }
    }

    PhysicsEntity {
        // When user clicks on the screen this become a sensor, and
        // balls can fall
        id: door
        height: units.gu(0.5)
        width: units.gu(6.25)       // This is the width of the bottleneck of the bowl
        anchors.top: bowl.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        fixtures: Edge {
            sensor: isDoorOpen      // <- All game is here :-)
            vertices: [
                Qt.point(0, 0),
                Qt.point(door.width, 0)
            ]
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
        id: doorControl
        // When the user press on the screen door opens and balls
        // fall
        anchors.fill: parent
    }

    AbstractButton {
        width: units.gu(4)
        height: units.gu(4)

        anchors { left: parent.left; bottom: parent.bottom; margins: units.gu(2) }

        onClicked: {
            // Don't change this order!
            // The pause is set before scene is stopped, because
            // otherwise all objects are destructed
            pause = true
            gameScene.running = false
            PopupUtils.open(pauseDialog)
        }

        Image {
            anchors.fill: parent
            source: Qt.resolvedUrl("../img/pause.png")
        }
    }

    Component {
        id: pauseDialog
        Dialog {
            id: dialog
            z: 10
            title: i18n.tr("Pause")
            text: i18n.tr("If you quit the game the highscore will be saved anyway")

            Button {
                text: i18n.tr("Continue game")
                onClicked: {
                    // Don't change this order, see below!
                    PopupUtils.close(dialog)
                    gameScene.running = true;
                    pause = false;
                }
                color: UbuntuColors.orange
            }

            Button {
                text: i18n.tr("Exit game")
                onClicked: {
                    PopupUtils.close(dialog)
                    // We need to restart the game, so functions
                    // can destroy all objects when the game ends
                    pause = false;
                    gameScene.running = true
                    Game.endGame();
                }
            }
        }
    }
}
