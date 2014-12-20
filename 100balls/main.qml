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
import Ubuntu.Components 1.1
import Bacon2D 1.0
import "components"
import "js/setup.js" as Setup
import "js/game.js" as Game

Game {
    id: game
    anchors.centerIn: parent

    height: units.gu(68)
    width: units.gu(44)

    gameName: "com.ubuntu.developer.rpadovani.100balls"

    // Version of the game
    property var version: "0.3.2"
    // Becomes true when the user press anywhere (but pause) and leaves the
    // balls fall
    property bool isDoorOpen: false
    // Becomes true when the game is in pause. Needs because when scene.running
    // is false all objects are destroyed, not if this is true
    property bool pause: false
    // Total number of balls in game
    property int numberOfBalls: 100
    // Score of this game
    property int score: 0
    // Actual level
    property int level: 1
    // How many points a ball does when falls in a glass
    property int glassScore: 1
    // Speed of glasses
    property real velocity: units.gu(0.3)
    property alias running: gameScene.running
    // Type of game we want to play
    property var gameType
    // Time before the end of the game in time challenge mode
    property int remTime: 100

    onNumberOfBallsChanged: {
        if ((gameType === 'perfection' && numberOfBalls === 90)
            || numberOfBalls === 0) {
            Game.endGame();
        }
    }

    onRemTimeChanged: {
        if (remTime === 0) {
            Game.endGame();
        }
    }

    onScoreChanged: {
        // Every 50 points the level goes up
        level = score / 50 + 1;
    }

    onLevelChanged: {
        // At evey level the speed of glass goes up
        velocity += 0.3;
    }

    currentScene: mainMenu

    Settings {
        id: settings
        property int highScore: 0; // Arcade score
        property int perfectionScore: 0;
        property int timeScore: 0;
    }

    MainMenu {
        id: mainMenu
        anchors.fill: parent
    }

    About {
        id: about
        anchors.fill: parent
    }

    GameScene {
        id: gameScene
        anchors.fill: parent

        running: false

        Ball { id: ball }
        Glass { id: glass }
    }

    ChooseGame {
        id: chooseGame
        anchors.fill: parent
    }

    EndMenu {
        id: endMenu
        anchors.fill: parent
    }

    Tutorial {
        id: tutorial
        anchors.fill: parent
    }

    Image {
        z: -10
        source: Qt.resolvedUrl("img/background.png")
        anchors.fill: parent
        fillMode: Image.Tile
    }
}

