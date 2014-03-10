import QtQuick 2.0

FocusScope {
    property alias inputText: input.text
    property alias hintText: typeSomething.text
    property alias maximumLength: input.maximumLength
    property alias fontSize: input.font.pointSize
    property alias echoMode: input.echoMode

    width: 180; height: 28
    BorderImage {
        source: "qrc:/img/resources/image/lineedit.sci"
        anchors.fill: parent
    }

    TextInput {
        id: input
        anchors.centerIn: parent
        width: parent.width-16
        color: "#151515"; selectionColor: "green"
        font.pixelSize: 16; font.bold: true
        selectByMouse: true
        mouseSelectionMode: TextInput.SelectCharacters
        clip: true
        focus: true
    }
    Text {
        id: typeSomething;
        color: "gray";
        opacity: (inputText === "" ? 1.0 : 0.0);
        font {
            italic: true
            pointSize: fontSize;
        }
        anchors {
            left: parent.left;
            right: parent.right;
            leftMargin: 10;
            rightMargin: 10;
            verticalCenter: parent.verticalCenter;
        }

        Behavior on opacity { NumberAnimation { duration: 250; } }
    }
}
