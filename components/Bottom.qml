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

Entity {
    height: units.gu(10)
    width: units.gu(200)

    anchors.horizontalCenter: parent.horizontalCenter

    fixtures: [
        Edge {
            vertices: [
                Qt.point(0, parent.height),
                Qt.point(parent.width, parent.height)
            ]

            sensor: true

            onBeginContact: {
                if (other.parent.glassContact === true) {
                    other.parent.x = scene.width / 2;
                    other.parent.y = 0;
                    other.parent.glassContact = false;
                    score += other.parent.ballLevel;
                }
                else {
                    other.parent.doDestroy();
                }
            }
        }
    ]
}
