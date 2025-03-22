import QtQuick 6.8
import QtQuick.Layouts 1.15
import "CalculatorLogic.js" as Logic

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Calculator")

    property string inputText: "0"
    property string outputText: ""

    function updateValues(result) {
        inputText = result.inputText;
        outputText = result.outputText;
    }

    FontLoader {
           id: openSansFont
           source: ":/OpenSans_Condensed-SemiBold.ttf"

           onStatusChanged: {
                   if (status === FontLoader.Error) {
                       console.log("Ошибка загрузки шрифта: " + errorString);
                   }
               }
       }

    Rectangle {
        anchors.fill: parent
        color: '#024873'
    }

    Rectangle {
        height: 156
        width: parent.width
        color: "#04BFAD"
        bottomRightRadius: 30
        bottomLeftRadius: 30
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: output
            width: 280
            height: 30
            text: outputText
            font.pixelSize: 30
            font.family: openSansFont.name
            color: "white"
            anchors.top: parent.top
            anchors.right: parent.right
            horizontalAlignment: Text.AlignRight
            anchors.rightMargin: 39
            anchors.topMargin: 44
            anchors.leftMargin: 39
        }

        Text {
            id: input
            width: 281
            height: 60
            text: inputText
            font.pixelSize: 60
            font.bold: true
            font.family: openSansFont.name
            color: "white"
            anchors.top: parent.top
            anchors.right: parent.right
            horizontalAlignment: Text.AlignRight
            anchors.rightMargin: 39
            anchors.topMargin: 82
            anchors.leftMargin: 39
        }
    }

    Rectangle {
        width: 312
        height: 396
        border.color: "transparent"
        color: '#024873'
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 180
        anchors.leftMargin: 24

        GridLayout {
            columns: 4
            anchors.centerIn: parent
            rowSpacing: 10
            columnSpacing: 10

            // Первая строка (функциональные кнопки)
            CalcButton {
                text: "()"
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.toggleParentheses(inputText, outputText))
            }
            CalcButton {
                text: "+/-"
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.toggleSign(inputText, outputText))
            }
            CalcButton {
                text: "%"
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "%"))
            }
            CalcButton {
                text: "÷"
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "/"))
            }

            // Вторая строка (цифры и умножение)
            CalcButton { text: "7"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "7")) }
            CalcButton { text: "8"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "8")) }
            CalcButton { text: "9"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "9")) }
            CalcButton {
                text: "×"
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "*"))
            }

            // Третья строка (цифры и вычитание)
            CalcButton { text: "4"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "4")) }
            CalcButton { text: "5"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "5")) }
            CalcButton { text: "6"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "6")) }
            CalcButton {
                text: "-"
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "-"))
            }

            // Четвертая строка (цифры и сложение)
            CalcButton { text: "1"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "1")) }
            CalcButton { text: "2"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "2")) }
            CalcButton { text: "3"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "3")) }
            CalcButton {
                text: "+"
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "+"))
            }

            // Пятая строка (C, 0, ., =)
            CalcButton {
                text: "C"
                buttonColor: "#f25e5e"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.clearAll())
            }
            CalcButton { text: "0"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, "0")) }
            CalcButton { text: "."; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 30; onClicked: updateValues(Logic.appendValue(inputText, outputText, ".")) }
            CalcButton {
                text: "="
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.calculateResult(outputText))
            }
        }
    }
}
