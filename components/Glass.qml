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
import QtQml 2.2
import Bacon2D 1.0
import "../js/game.js" as Game

Component {
    PhysicsEntity {
        id: glass
        bodyType: Body.Kinematic

        height: units.gu(8)
        width: units.gu(8)

        updateInterval: 1

        sleepingAllowed: true

        linearVelocity: Qt.point(-velocity,0)

        property color lineColor
        property color backgroundColor
        property bool launchedOther: false

        function doDestroy() {
            destroy();
        }

        Component.onCompleted: {
            var levelColor = Math.floor(Math.random()*level) + 1;

            if (levelColor < 5) {
                glassScore = 1;
                lineColor = Qt.rgba(0.86, 0.28, 0.07, 1);        // #DD4814 - Ubuntu Orange
                backgroundColor = Qt.rgba(0.86, 0.28, 0.07, 0.5);
            }
            if (levelColor >= 5 && levelColor < 10) {
                glassScore = 2;
                lineColor = Qt.rgba(0.47, 0.13, 0.43, 1);        // #72216F - Light Aubergine
                backgroundColor = Qt.rgba(0.47, 0.13, 0.43, 0.5);
            }
            if (levelColor >= 10 && levelColor < 15) {
                glassScore = 3;
                lineColor = Qt.rgba(0, 0, 1, 1);                 // #OOFFFF - Aqua
                backgroundColor = Qt.rgba(0, 0, 1, 0.5);
            }
            if (levelColor >= 15 && levelColor < 20) {
                glassScore = 4;
                lineColor = Qt.rgba(1, 1, 0, 1);                 // #FF0000 - Yellow
                backgroundColor = Qt.rgba(1, 1, 0, 0.5);
            }
            if (levelColor >= 20 && levelColor < 25) {
                glassScore = 5;
                lineColor = Qt.rgba(0.5, 0, 0.5, 1);             // #800080 - Purple
                backgroundColor = Qt.rgba(0.5, 0, 0.5, 0.5);
            }
            if (levelColor >= 25 && levelColor < 30) {
                glassScore = 6;
                lineColor = Qt.rgba(0, 0.5, 0, 1);               // #008000 - Green
                backgroundColor = Qt.rgba(0, 0.5, 0, 0.5);
            }
            if (levelColor >= 30 && levelColor < 35) {
                glassScore = 7;
                lineColor = Qt.rgba(1, 0, 0, 1);                // #FF0000 - Red
                backgroundColor = Qt.rgba(1, 0, 0, 0.5);
            }
            if (levelColor >= 35 && levelColor < 40) {
                glassScore = 8;
                lineColor = Qt.rgba(0.66, 0.66, 0.66, 1)        // #A9A9A9 - darkgray
                backgroundColor = Qt.rgba(0.66, 0.66, 0.66, 0.5)
            }
            glassCanvas.createGlass()
        }

        fixtures: [
            Edge {
                vertices: [
                    Qt.point(0, 0),
                    Qt.point(target.width / 4, target.height)
                ]
            },
            Edge {
                vertices: [
                    Qt.point(target.width, 0),
                    Qt.point(target.width * 3/4, target.height)
                ]
            },
            Edge {
                vertices: [
                    Qt.point(target.width / 4, target.height),
                    Qt.point(target.width * 3/4 , target.height)
                ]
                sensor: true
                onBeginContact: {
                    var body = other.getBody();
                    body.target.glassContact = true;
                    body.target.ballColor = lineColor;
                    body.target.ballLevel = glassScore;
                }
            }
        ]

        Canvas {
            id: glassCanvas
            anchors.fill: parent

            function createGlass() {
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
                var newPos = target.x - velocity;
                if (newPos < gameScene.width / 3 && !target.launchedOther){
                    Game.launchGlass();
                    target.launchedOther = true;
                }

                if (newPos < -2 * target.width) {
                    glass.doDestroy();
                }
            }
        }

        Connections {
            target: gameScene
            onRunningChanged: {
                if (!pause) {
                    glass.doDestroy();
                }
            }
        }
    }
}
