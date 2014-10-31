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

PhysicsEntity {
    height: units.gu(10)
    width: units.gu(200)

    fixtures: Edge {
        vertices: [
            Qt.point(0, target.height),
            Qt.point(target.width, target.height)
        ]
        sensor: true
        onBeginContact: {
            var body = other.getBody();
            if (body.target.glassContact === true) {
                // If the ball went throught a glass, reset it and put it
                // at the top of the scene
                body.target.x = gameScene.width / 2;
                body.target.y = 0;
                body.target.glassContact = false;
                score += body.target.ballLevel;
            }
            else {
                body.target.doDestroy();
            }
        }
    }
}
