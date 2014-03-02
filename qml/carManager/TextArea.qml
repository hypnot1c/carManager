import QtQuick 2.0

FocusScope {
    id: focusScope;
    width: 400;
    height: textInput.paintedHeight + (2 * textInput.anchors.topMargin);

    property alias  value                          : textInput.text;
    property alias  fontSize                       : textInput.font.pointSize;
    property alias  textColor                      : textInput.color;
    property alias  placeHolder                    : typeSomething.text;

    Rectangle {
        id: background;
        anchors.fill: parent;
        color: "#AAAAAA";
        radius: 5;
        antialiasing: true;
        border {
            width: 3;
            color: (focusScope.activeFocus ? "red" : "steelblue");
        }
    }
    TextEdit {
        id: textInput;
        focus: true
        selectByMouse: true
        font.pointSize: 20;
        wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere;
        color: "black";
        anchors {
            top: parent.top;
            topMargin: 10;
            left: parent.left;
            leftMargin: 10;
            right: parent.right;
            rightMargin: 10;
        }
    }
    Text {
        id: typeSomething;
        text: "Type something...";
        color: "gray";
        opacity: (value === "" ? 1.0 : 0.0);
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
    MouseArea {
        visible: (!focusScope.activeFocus);
        anchors.fill: parent
        onClicked: { textInput.forceActiveFocus(); }
    }
    Text {
        id: clear;
        text: "\u2717" // 'x' //"\u2713"
        color: 'steelblue';
        font.pixelSize: 30;
        opacity: (value !== "" ? 1.0 : 0.0);
        anchors {
            right: parent.right;
            bottom: parent.bottom;
            margins: 5;
        }

        Behavior on opacity { NumberAnimation { duration: 250; } }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                value = "";
                focusScope.focus = false;
            }
        }
    }
}
