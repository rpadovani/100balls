import QtQuick 2.0
import Ubuntu.Components 0.1
import "../js/setup.js" as Setup
import "../js/game.js" as Game

Page {
    height: units.gu(50)
    width: units.gu(75)

    property int highScore: 0

    Button {
        id: button
        anchors.centerIn: parent
        text: "Start game!"

        onClicked: {
            pagestack.pop();
            Setup.newGame();
            Game.launchGlass();
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.top: button.bottom
        text: "High score: " + highScore
    }
}
