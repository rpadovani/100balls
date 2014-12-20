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

import QtQuick 2.2
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.1
import Bacon2D 1.0
import "../js/game.js" as Game
import "../js/setup.js" as Setup

Scene {
    ColumnLayout {
        width: parent.width

        AboutText {
            text: "100Balls"
            font.pixelSize: units.gu(10)
        }
        AboutText {
            text: version
            font.pixelSize: units.gu(2)
        }

        Spacer {}

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Arcade")

            color: UbuntuColors.orange

            onClicked: {
                game.gameType = 'arcade';
                Setup.newGame();
                Game.launchGlass();
            }
        }

        Spacer {}

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Perfection")

            color: UbuntuColors.orange

            onClicked: {
                game.gameType = 'perfection';
                Setup.newGame();
                Game.launchGlass();
            }
        }

        Spacer {}

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Time challenge")

            color: UbuntuColors.orange

            onClicked: {
                game.gameType = 'time';
                Setup.newGame();
                Game.launchGlass();
            }
        }
    }
}
