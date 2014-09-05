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
            text: i18n.tr("Start game!")

            color: UbuntuColors.orange

            onClicked: {
                game.currentScene = chooseGame;
            }
        }

        Spacer {}

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Tutorial")

            color: UbuntuColors.orange

            onClicked: {
                game.currentScene = tutorial;
            }
        }

        Spacer {}

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("About")

            color: UbuntuColors.orange

            onClicked: {
                game.currentScene = about;
                about.running = true;
            }
        }

        Spacer {}

        AboutText {
            text: i18n.tr("Arcade score: " + settings.highScore)
            font.pixelSize: units.gu(2)
            visible: settings.highScore != 0
        }
        AboutText {
            text: i18n.tr("Perfection score: " + settings.perfectionScore)
            font.pixelSize: units.gu(2)
            visible: settings.perfectionScore != 0
        }
        AboutText {
            text: i18n.tr("Time score: " + settings.timeScore)
            font.pixelSize: units.gu(2)
            visible: settings.timeScore != 0
        }
    }
}
