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
            text: i18n.tr("Touch anywhere on the screen to open the door and let the balls fall. \nTry to catch as many balls as possible in each glass. \nYou start with 100 balls, any ball which misses the glass is lost. \n\nEvery 50 balls you catch in the glasses you'll advance one level. \nEvery 5 levels completed you'll have a chance to get a glass of another color.\nEach glass color has a different score.")
            font.pixelSize: units.gu(2)
            wrapMode: Text.WordWrap
        }
        Spacer {}
        AboutText {
            text: i18n.tr("Arcade mode:")
            font.pixelSize: units.gu(2.5)
        }
        AboutText {
            text: i18n.tr("The arcade mode is the classic mode: you start with 100 balls, each ball that misses is lost, do your best!")
            font.pixelSize: units.gu(2)
            wrapMode: Text.WordWrap
        }
        AboutText {
            text: i18n.tr("Perfection mode:")
            font.pixelSize: units.gu(2.5)
        }
        AboutText {
            text: i18n.tr("In perfection mode you start with 100 balls, but you can only lose 10 balls before the game ends.")
            font.pixelSize: units.gu(2)
            wrapMode: Text.WordWrap
        }
        AboutText {
            text: i18n.tr("Time challenge:")
            font.pixelSize: units.gu(2.5)
        }
        AboutText {
            text: i18n.tr("100 balls.  100 seconds.  Hurry up!")
            font.pixelSize: units.gu(2)
        }
    }
}
