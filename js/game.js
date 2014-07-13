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

function launchGlass() {
    var newGlass = glass.createObject(scene.world);
    newGlass.x = width;
    newGlass.y = scene.height - units.gu(20);
}

function endGame() {
    scene.running = false;
    pause = false;
    game.popScene();

    if (score > settings.highScore) {
        settings.highScore = score;
        settings.highLevel = level;
    }

    isDoorOpen = false;
    numberOfBalls = 100;
    score = 0;
    level = 1;
    velocity = 2.0;
    glassScore = 1;

    if (page) {
        page.destroy(100);
    }

    var component = Qt.createComponent(Qt.resolvedUrl("../components/StartPage.qml"));
    var page = component.createObject(mainview, {highScore: settings.highScore, anotherGame: true});
    pagestack.push(page);
}
