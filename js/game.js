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
    var newGlass = glass.createObject(gameScene.world);
    newGlass.x = gameScene.width;
    newGlass.y = gameScene.height - units.gu(20);
}

function restartGame() {
    gameScene.running = false;
    pause = false;

    isDoorOpen = false;
    numberOfBalls = 100;
    score = 0;
    level = 1;
    velocity = units.gu(0.3);
    glassScore = 1;
    remTime = 100;

    score = 0;
    for (var i = 0; i < 10; i++) {
        for (var j = 0; j < 10; j++) {
            var newBox = ball.createObject(gameScene.world);
            newBox.x = gameScene.width / 2 - units.gu(10)+ units.gu(1.5*j);
            newBox.y = units.gu(1.5*i) - units.gu(1);
        }
    }

    gameScene.running = true;
    launchGlass();
}

function endGame() {
    gameScene.running = false;
    pause = false;
    game.currentScene = endMenu;
    endMenu.score = score;


    if (score > settings.highScore && gameType === 'arcade') {
        settings.highScore = score;
    }
    if (score > settings.perfectionScore && gameType === 'perfection') {
        settings.perfectionScore = score;
    }
    if (score > settings.timeScore && gameType === 'time') {
        settings.timeScore = score;
    }

    isDoorOpen = false;
    numberOfBalls = 100;
    score = 0;
    level = 1;
    velocity = units.gu(0.3);
    glassScore = 1;
    remTime = 100;
}
