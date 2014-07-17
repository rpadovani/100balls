import QtQuick 2.0
import Ubuntu.Components 0.1

Page {
    id: root

    Text {
        // The title of the game, maybe we can create an image for that?
        id: title

        width: parent.width

        color: "white"
        font.pixelSize: units.gu(10)
        horizontalAlignment: Text.AlignHCenter

        text: "100Balls"
    }

    Text {
        // Version of the game, still Alpha :-)
        id: version

        anchors.top: title.bottom
        width: parent.width

        color: "white"
        font.pixelSize: units.gu(2)
        horizontalAlignment: Text.AlignHCenter

        text: "Beta"
    }

    Text {
        // Introductory text for developers
        id: dev

        anchors.top: version.bottom
        anchors.topMargin: units.gu(3)
        width: parent.width

        color: "white"
        font.pixelSize: units.gu(2)
        horizontalAlignment: Text.AlignHCenter

        text: i18n.tr("Developed by:")
    }

    Text {
        // List of all developers
        id: name

        anchors.top: dev.bottom
        width: parent.width

        font.pixelSize: units.gu(3)
        horizontalAlignment: Text.AlignHCenter
        color: "white"

        text: "Riccardo Padovani"
    }

    /*Text {
        // I want to have a mobile ready site before this
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
        // Special thanks to Ken VanDine :-)
        id: kenint

        anchors.top: name.bottom
        anchors.topMargin: units.gu(3)
        width: parent.width

        color: "white"
        font.pixelSize: units.gu(2)
        horizontalAlignment: Text.AlignHCenter

        text: i18n.tr("A big thanks to:")
    }

    Text {
        id: ken

        anchors.top: kenint.bottom
        width: parent.width
        
        color: "white"
        font.pixelSize: units.gu(3)
        horizontalAlignment: Text.AlignHCenter
        
        text: "Ken VanDine"
    }

    Text {
        // Bacon2D is awesome, seriously
        id: stefano
        font.pixelSize: units.gu(3)
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        width: parent.width
        anchors.top: ken.bottom
        text: "Stefano Verzegnassi"
    }

    Text {
        id: baconText 

        anchors.top: stefano.bottom
        anchors.topMargin: units.gu(5)
        width: parent.width
        
        color: "white"
        font.pixelSize: units.gu(2)
        horizontalAlignment: Text.AlignHCenter
        
        text: i18n.tr("Based on:")
    }

    Text {
        id: bacon

        anchors.top: baconText.bottom
        width: parent.width
        
        color: "white"
        font.pixelSize: units.gu(3)
        horizontalAlignment: Text.AlignHCenter
        
        text: "Bacon 2D"
    }

    Image {
        // How cute is this pig?
        id: image 

        source: Qt.resolvedUrl("../img/pig-128.png")
        
        anchors.top: bacon.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        text: i18n.tr("Close")
        
        anchors.top: image.bottom
        anchors.topMargin: units.gu(5)
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: pagestack.pop()
    }
}
