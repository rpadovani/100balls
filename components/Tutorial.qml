import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    id: root
    height: units.gu(75)
    width: units.gu(50)

    Column {
        anchors.fill: parent

        Text {
            width: units.gu(25)
            text: "The game is very easy :-) \n\nTouch the screen in any point to open the door and let the balls fall. \nTry to put more balls possible in every glass. \nYou start with 100 balls, any ball which falls off the glass is lost. \n\nEvery 50 balls you put in glasses you'll advance of one level. \nEvery 5 levels there is a little chance to have a glass of another color.\nEvery glass color has a different score.\n\nTry to do your best :-) "

        }

        Button {
            text: "I'm ready"
            onClicked: pagestack.pop()
        }
    }
}
