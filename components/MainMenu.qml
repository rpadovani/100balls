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

Scene {
    property int highScore

    Text {
        id: title
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        font.pixelSize: units.gu(10)
        text: "100Balls"
        color: "white"
    }

    Text {
        anchors.top: title.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        color: "white"
        font.pixelSize: units.gu(2)
        text: version
    }

    Column {
        id: column
        anchors.centerIn: parent
        spacing: units.gu(5)

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Start game!")

            gradient: UbuntuColors.orangeGradient

            onClicked: {
                game.currentScene = chooseGame;
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Tutorial")

            gradient: UbuntuColors.orangeGradient

            onClicked: {
                game.currentScene = tutorial;
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("About")

            gradient: UbuntuColors.orangeGradient

            onClicked: {
                game.currentScene = about;
                about.running = true;
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: units.gu(3)

            text: i18n.tr("High score: " + highScore)
            color: "white"
        }
    }
}
