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
    var newGlass = glass.createObject(gameScene);
    newGlass.x = gameScene.width;
    newGlass.y = gameScene.height - units.gu(20);
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

    numberOfBalls = 100;
    score = 0;
    level = 1;
    velocity = units.gu(0.3);
    glassScore = 1;
    remTime = 100;
}
