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
    }
}
