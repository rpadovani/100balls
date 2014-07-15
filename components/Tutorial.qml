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
import Ubuntu.Components 0.1

Page {
    id: root
    height: units.gu(68)
    width: units.gu(44)

    Column {
        anchors.fill: parent
        spacing: units.gu(5)

        Text {
            width: parent.width
            color: "white"
            font.pixelSize: units.gu(2.5)
            text: i18n.tr("The game is very easy :-) \n\nTouch the screen in any point to open the door and let the balls fall. \nTry to put more balls possible in every glass. \nYou start with 100 balls, any ball which falls off the glass is lost. \n\nEvery 50 balls you put in glasses you'll advance of one level. \nEvery 5 levels there is a little chance to have a glass of another color.\nEvery glass color has a different score.\n\nTry to do your best :-) ")

            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            text: i18n.tr("I'm ready")
            onClicked: pagestack.pop()
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
