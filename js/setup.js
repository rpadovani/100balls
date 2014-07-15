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

function newGame() {
    for (var i = 0; i < 10; i++) {
        for (var j = 0; j < 10; j++) {
            var newBox = ball.createObject(scene.world);
            newBox.x = width / 3 + units.gu(1.5*j);
            newBox.y = units.gu(1.5*i);
        }
    }
    game.pushScene(scene);
    scene.running = true;
}
