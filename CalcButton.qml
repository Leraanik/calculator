import QtQuick 6.8

Rectangle {
    id: button
    width: 60
    height: 60
    radius: 30
    color: buttonColor

    property alias text: buttonText.text
    property color buttonColor: "#04BFAD"
    property color pressedColor: "#F7E425"
    property color textColor: "white"
    property int fontSize: 20

    signal clicked

    Behavior on color {
            ColorAnimation { duration: 150 }
        }

    Text {
        id: buttonText
        text: "Btn"
        anchors.centerIn: parent
        font.pixelSize: fontSize
        font.family: "Open Sans"
        color: textColor
    }

    MouseArea {
        anchors.fill: parent
        onPressed: button.color = pressedColor
        onReleased: button.color = buttonColor
        onClicked: button.clicked()
    }
}
