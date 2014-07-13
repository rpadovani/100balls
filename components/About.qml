import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    id: root
    height: units.gu(75)
    width: units.gu(50)

    Text {
        id: title
        font.pixelSize: units.gu(10)
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        width: parent.width

        text: "100Balls"
    }

    Text {
        id: version
        font.pixelSize: units.gu(2)
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        width: parent.width
        anchors.top: title.bottom
        text: "Alpha"
    }

    Text {
        id: dev
        font.pixelSize: units.gu(2)
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        width: parent.width
        anchors.top: version.bottom
        anchors.topMargin: units.gu(5)
        text: "Developed by:"
    }

    Text {
        id: name
        font.pixelSize: units.gu(3)
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        width: parent.width
        anchors.top: dev.bottom
        text: "Riccardo Padovani"
    }

    /*Text {
        id: url 
        font.pixelSize: units.gu(2)
        horizontalAlignment: Text.AlignHCenter
        linkColor: "#DD4814"
        width: parent.width
        anchors.top: name.bottom
        textFormat: Text.StyledText
        text: "<a href='http://www.rpadovani.com'>www.rpadovani.com</a>"
    }*/

    Text {
        id: baconText 
        font.pixelSize: units.gu(2)
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        width: parent.width
        anchors.top: name.bottom
        anchors.topMargin: units.gu(5)
        text: "Based on:"
    }

    Text {
        id: bacon
        font.pixelSize: units.gu(3)
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        width: parent.width
        anchors.top: baconText.bottom
        text: "Bacon 2D"
    }

    Image {
        id: image 
        source: Qt.resolvedUrl("../img/pig-128.png")
        anchors.top: bacon.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        text: "Close"
        anchors.top: image.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: pagestack.pop()
        anchors.topMargin: units.gu(5)
    }


}
