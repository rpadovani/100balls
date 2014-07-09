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
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        text: "100balls!"
    }

    Column {
        id: column
        anchors.centerIn: parent
        spacing: units.gu(5)

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Start game!"

            onClicked: {
                pagestack.pop();
                Setup.newGame();
                Game.launchGlass();
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Tutorial"
            visible: !anotherGame
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "About"
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter

            text: "High score: " + highScore
        }
    }
}
