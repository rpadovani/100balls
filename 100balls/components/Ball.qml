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
import QtQml 2.2
import QtQuick 2.0
import Bacon2D 1.0

Component {
    PhysicsEntity {
        id: ballEntity
        height: units.gu(1.3)
        width: units.gu(1.3)

        bodyType: Body.Dynamic
        sleepingAllowed: false // If sleeping is allowed, when the door becomes a sensor, ball doesn't fall

        // Becomes true if goes throught a glass
        property bool glassContact: false
        property color ballColor: Qt.rgba(0.86, 0.28, 0.07, 1)  // #DD4814
        property int ballLevel: 1   // This is the score of the ball. It depends on the color of the glass it goes throught

        fixtures: Circle {
            // This is the physic entity
            radius: target.width / 2

            // How ball goes... I'm not happy yet with these
            density: 1
            friction: 0.5
            restitution: 0.2
        }

        Rectangle {
            // This is the drawn ball
            radius: parent.width / 2

            color: parent.ballColor

            height: parent.height
            width: parent.width
        }

        function doDestroy() {
            numberOfBalls--;
            destroy();
        }

        Connections {
            target: gameScene
            onRunningChanged: {
                if (!pause && !running) {
                    // At the end of the game, destroy all!
                    ballEntity.destroy();
                }
            }
        }
    }
}
