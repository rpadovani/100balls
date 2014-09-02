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
            columnLayout.y = root.height / 3;
        }

        Image {
            anchors.fill: parent
            source: Qt.resolvedUrl("../img/back.svg")
        }
    }

    ColumnLayout {
        id: columnLayout
        width: parent.width
        y: root.height / 3

        SequentialAnimation on y {
            id: sequentialAnimation
            loops: Animation.Infinite
            running: root.running

            PropertyAnimation {
                to: root.height / 3 - parent.height;
                duration: 10000
            }
            PropertyAnimation {
                to: root.height / 4;
                duration: 10000
            }
        }

        AboutText {
            text: "100Balls"
            font.pixelSize: units.gu(10)
        }
        AboutText {
            text: version
            font.pixelSize: units.gu(2)
        }
        Spacer {}
        AboutText {
            text: i18n.tr("Developed by:")
            font.pixelSize: units.gu(2)
        }
        AboutText {
            text: "Riccardo Padovani"
            font.pixelSize: units.gu(3)
        }
        Spacer {}
        AboutText {
            text: i18n.tr("A big thanks to:")
            font.pixelSize: units.gu(2)
        }
        AboutText {
            text: "Alan Pope"
            font.pixelSize: units.gu(3)
        }
        AboutText {
            text: "Ken VanDine"
            font.pixelSize: units.gu(3)
        }
        AboutText {
            text: "Nekhelesh Ramananthan"
            font.pixelSize: units.gu(3)
        }
        AboutText {
            text: "Stefano Verzegnassi"
            font.pixelSize: units.gu(3)
        }
        Spacer {}
        AboutText {
            text: i18n.tr("Based on:")
            font.pixelSize: units.gu(2)
        }
        AboutText {
            text: "Bacon2D"
            font.pixelSize: units.gu(3)
        }
        Spacer {}
        Image {
            source: Qt.resolvedUrl("../img/pig-128.png")
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
