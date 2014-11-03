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
    height: units.gu(30) 
    width: units.gu(25)

    fixtures: [
        // Left border
        Edge {
            vertices: [
                Qt.point(0, 0),
                Qt.point(0, target.height * 2/5)
            ]
        }, 
        Edge {
            vertices: [
                Qt.point(0, target.height * 2/5),
                Qt.point(target.width * 3/8, target.height * 3/5)
            ]
        }, 
        Edge {
            vertices: [
                Qt.point(target.width * 3/8, target.height * 3/5),
                Qt.point(target.width * 3/8, target.height)
            ]
        },

        // Right border
        Edge {
            vertices: [
                Qt.point(target.width, 0),
                Qt.point(target.width, target.height * 2/5)
            ]
        }, 
        Edge {
            vertices: [
                Qt.point(target.width, target.height * 2/5),
                Qt.point(target.width * 5/8, target.height * 3/5)
            ]
        }, 
        Edge {
            vertices: [
                Qt.point(target.width * 5/8, target.height * 3/5),
                Qt.point(target.width * 5/8, target.height)
            ]
        },

        // Top pyramid
        Edge {
            vertices: [
                Qt.point(target.width / 4, target.height / 4),
                Qt.point(target.width / 2, target.height / 8),
            ]
        },
        Edge {
            vertices: [
                Qt.point(target.width / 2, target.height / 8),
                Qt.point(target.width * 3/4, target.height / 4)
            ]
        }
    ]

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var context = canvas.getContext("2d")
            context.beginPath();
            context.lineWidth = units.gu(0.5);

            // Left border
            context.moveTo(0, 0);
            context.lineTo(0, height * 2/5);
            context.lineTo(width * 3/8, height * 3/5);
            context.lineTo(width * 3/8, height);

            // Right border
            context.moveTo(width, 0);
            context.lineTo(width, height * 2/5);
            context.lineTo(width * 5/8, height * 3/5);
            context.lineTo(width * 5/8, height);
            
            // Pyramid
            context.moveTo(width / 4, parent.height / 4);
            context.lineTo(width / 2, parent.height / 8);
            context.lineTo(width * 3/4, parent.height / 4);

            context.strokeStyle = "white";
            context.stroke();
        }
    }
}
