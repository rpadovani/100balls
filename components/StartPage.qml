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
import "../js/setup.js" as Setup
import "../js/game.js" as Game

Page {
    id: root
    height: units.gu(75)
    width: units.gu(50)

    property int highScore: 0
    property bool anotherGame: false

    Text {
        id: title
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        font.pixelSize: units.gu(10)
        text: "100Balls"
        color: "white"
    }

    Text {
        id: version
        anchors.top: title.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        color: "white"
        font.pixelSize: units.gu(2)
        text: "Alpha"
    }

    Column {
        id: column
        anchors.centerIn: parent
        spacing: units.gu(5)

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Start game!"

            onClicked: {
                Setup.newGame();
                pagestack.pop();
                Game.launchGlass();
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Tutorial"
            visible: !anotherGame

            onClicked: {
                var component = Qt.createComponent(Qt.resolvedUrl("Tutorial.qml"));
                var page = component.createObject(mainview, {highScore: settings.highScore});
                pagestack.push(page);
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "About"

            onClicked: {
                var component = Qt.createComponent(Qt.resolvedUrl("About.qml"));
                var page = component.createObject(mainview);
                pagestack.push(page);
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter

            text: "High score: " + highScore
            color: "white"
        }
    }
}
