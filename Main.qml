import QtQuick 6.8
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "CalculatorLogic.js" as Logic

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Calculator")

    property string inputText: "0"
    property string outputText: ""
    property bool secretMenuVisible: false

    function updateValues(result) {
        inputText = result.inputText;
        outputText = result.outputText;
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
            font.family: "Open Sans Semibold"
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
            font.pointSize: 50
            font.bold: true
            font.family: "Open Sans Semibold"
            color: "white"
            anchors.top: parent.top
            anchors.right: parent.right
            horizontalAlignment: Text.AlignRight
            anchors.rightMargin: 39
            anchors.topMargin: 68
            anchors.leftMargin: 39
            lineHeight: 1.2
            font.letterSpacing: 0.5

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
            rowSpacing: 24
            columnSpacing: 24

            // Первая строка (функциональные кнопки)
            CalcButton {
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.toggleParentheses(inputText, outputText))

                Image{
                    anchors.centerIn: parent
                    source: "data:image/svg+xml;utf8,<svg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M12 5C12 5 9 9 9 15C9 21 12 25 12 25' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><path d='M18 25C18 25 21 21 21 15C21 9 18 5 18 5' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /></svg>"
                    width: 30
                    height: 30
                }
            }
            CalcButton {
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.toggleSign(inputText, outputText))

                Image {
                    anchors.centerIn: parent
                    source: "data:image/svg+xml;utf8,<svg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M18 7L12 23' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><path d='M8 7V15' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><path d='M12 11L4 11' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><path d='M26 19L18 19' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /></svg>"
                    width: 30
                    height: 30
                }
            }
            CalcButton {
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "%"))

                Image {
                    anchors.centerIn: parent
                    source: "data:image/svg+xml;utf8,<svg width='20' height='20' viewBox='0 0 20 20' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M15 2L5 18' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><ellipse cx='16' cy='15' rx='3' ry='4' stroke='white' stroke-width='2' /><ellipse cx='4' cy='5' rx='3' ry='4' stroke='white' stroke-width='2' /></svg>"
                    width: 20
                    height: 20
                }
            }
            CalcButton {
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "/"))

                Image {
                    anchors.centerIn: parent
                    source: "data:image/svg+xml;utf8,<svg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M24.5 15L5.5 15' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><circle cx='15' cy='8' r='2' fill='white' /><circle cx='15' cy='22' r='2' fill='white' /></svg>"
                    width: 30
                    height: 30
                }
            }

             // Вторая строка (цифры и умножение)
            CalcButton { text: "7"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "7")) }
            CalcButton { text: "8"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "8")) }
            CalcButton { text: "9"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "9")) }
            CalcButton {
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "*"))

                Image {
                    anchors.centerIn: parent
                    source: "data:image/svg+xml;utf8,<svg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M21.7175 8.2825L8.2825 21.7175' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><path d='M21.7175 21.7175L8.2825 8.2825' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /></svg>"
                    width: 30
                    height: 30
                }
            }

            // Третья строка (цифры и вычитание)
            CalcButton { text: "4"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "4")) }
            CalcButton { text: "5"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "5")) }
            CalcButton { text: "6"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "6")) }
            CalcButton {
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "-"))

                Image {
                    anchors.centerIn: parent
                    source: "data:image/svg+xml;utf8,<svg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M24.5 15L5.5 15' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /></svg>"
                    width: 30
                    height: 30
                }
            }

            // Четвертая строка (цифры и сложение)
            CalcButton { text: "1"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "1")) }
            CalcButton { text: "2"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "2")) }
            CalcButton { text: "3"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "3")) }
            CalcButton {
                buttonColor: "#0889a6"
                textColor: "white"
                fontSize: 30
                onClicked: updateValues(Logic.appendValue(inputText, outputText, "+"))

                Image {
                    anchors.centerIn: parent
                    source: "data:image/svg+xml;utf8,<svg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M15 5.5V24.5' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><path d='M24.5 15L5.5 15' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /></svg>"
                    width: 30
                    height: 30
                    }
                }

                // Пятая строка (C, 0, ., =)
                CalcButton {
                    text: "C"
                    buttonColor: "#f25e5e"
                    textColor: "white"
                    fontSize: 24
                    onClicked: updateValues(Logic.clearAll())
                }
                CalcButton { text: "0"; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, "0")) }
                CalcButton { text: "."; buttonColor: "#b0d1d8"; textColor: "#024873"; fontSize: 24; onClicked: updateValues(Logic.appendValue(inputText, outputText, ".")) }
                CalcButton {
                           buttonColor: "#0889a6"
                           textColor: "white"
                           fontSize: 30

                           Image {
                                anchors.centerIn: parent
                                source: "data:image/svg+xml;utf8,<svg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'><path d='M24.5 19L5.5 19' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /><path d='M24.5 11L5.5 11' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' /></svg>"
                                width: 30
                                height: 30
                            }

                           MouseArea {
                               id: mouseArea
                               anchors.fill: parent

                               property bool isLongPress: false
                               property int pressStartTime: 0
                               property int longPressDuration: 4000

                               onPressed: {
                                   pressStartTime = Date.now();
                                   isLongPress = false;
                               }

                               onReleased: {
                                   let pressDuration = Date.now() - pressStartTime;
                                   if (pressDuration >= longPressDuration && inputText === "123") {
                                           secretMenu.visible = true;
                                           console.log("Секретное меню открыто")
                                   } else {

                                       console.log("Результат: " + outputText);
                                       let result = Logic.calculateResult(outputText);
                                       console.log("Вычисленный результат: " + result.inputText);
                                       updateValues(result);
                                       }
                                   }

                                   onCanceled: {

                                       isLongPress = false;
                                       }
                                   }
                                   }







    Window{
        id: secretMenu
        width:300
        height:300
        visible: false
        title: "Секретное меню"

        Rectangle {
            width: parent.width
            height: parent.height
            color: "#04BFAD"

            Text {
                text: "Секретное меню"
                font.pixelSize: 30
                color: "white"
                anchors.centerIn: parent
                font.family: "Open Sans Semibold"
            }
            Button {
                text: "Назад"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 80
                width: 100
                height: 40
                font.pixelSize: 18

                background: Rectangle {
                    color: '#024873'
                    radius: 10
                }

                onClicked: {
                    secretMenu.visible = false;
                    }
                }

        }
    }
}
}
}
