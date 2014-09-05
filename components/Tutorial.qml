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
    id: root

    AbstractButton {
        height: units.gu(4)
        width: units.gu(4)

        anchors {
            left: parent.left;
            bottom: parent.bottom;
            margins: units.gu(0.2);
        }

        onClicked: {
            game.currentScene = mainMenu;
        }

        Image {
            anchors.fill: parent
            source: Qt.resolvedUrl("../img/back.svg")
        }
    }

    ColumnLayout {
        id: columnLayout
        width: parent.width

        AboutText {
            text: i18n.tr("Touch the screen in any point to open the door and let the balls fall. \nTry to put more balls possible in every glass. \nYou start with 100 balls, any ball which falls off the glass is lost. \n\nEvery 50 balls you put in glasses you'll advance of one level. \nEvery 5 levels there is a little chance to have a glass of another color.\nEvery glass color has a different score.")
            font.pixelSize: units.gu(2)
            wrapMode: Text.WordWrap
        }
        Spacer {}
        AboutText {
            text: i18n.tr("Arcade mode:")
            font.pixelSize: units.gu(2.5)
        }
        AboutText {
            text: i18n.tr("The arcade mode is the classic mode: you have 100 balls, every time a ball falls is lost, do your best!")
            font.pixelSize: units.gu(2)
            wrapMode: Text.WordWrap
        }
        AboutText {
            text: i18n.tr("Perfection mode:")
            font.pixelSize: units.gu(2.5)
        }
        AboutText {
            text: i18n.tr("In perfection mode you have 100 balls, but you can lost only 10 balls before the game ends")
            font.pixelSize: units.gu(2)
            wrapMode: Text.WordWrap
        }
        AboutText {
            text: i18n.tr("Time challenge:")
            font.pixelSize: units.gu(2.5)
        }
        AboutText {
            text: i18n.tr("100 balls. 100 seconds. Hurry up!")
            font.pixelSize: units.gu(2)
        }
    }
}
