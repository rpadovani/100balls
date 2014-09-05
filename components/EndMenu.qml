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

Scene {
    property int score

    ColumnLayout {
        width: parent.width

        AboutText {
            text: i18n.tr("Game over!")
            font.pixelSize: units.gu(8)
        }

        Spacer {}

        AboutText {
            text: i18n.tr("Your score: ") + score
            font.pixelSize: units.gu(3)
        }

        Spacer {}

        AboutText {
            text: i18n.tr("Congrats! You did a new personal record!")
            font.pixelSize: units.gu(3)
            visible: (score === settings.highScore && gameType === 'arcade') ||
                     (score === settings.perfectionScore && gameType === 'perfection') ||
                     (score === settings.timeScore && gameType === 'time')
            wrapMode: Text.WordWrap
        }

        Spacer {}

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Go to main menu")

            color: UbuntuColors.orange

            onClicked: {
                game.currentScene = mainMenu;
            }
        }
    }
}
