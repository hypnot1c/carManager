import QtQuick 2.0

Rectangle {

    width: 300;
    height: 100;

Rectangle {

    anchors.verticalCenter: parent.verticalCenter;
    anchors.horizontalCenter: parent.horizontalCenter;
    width:150;
    height: 30;
    radius: 4;
    border.color: "#000000";

    TextInput {
        id: input;
        clip: true;
        width: parent.width - 30;
        height: parent.height;
        cursorVisible: true;

        anchors.left: parent.left;
        anchors.leftMargin: 3;

        font.family: "Times New Roman";
        font.weight: Font.Normal;
        font.pointSize: height/2 + 2;
    }

    Rectangle {
        border.color: "#000000";
        border.width: 1;
        radius: parent.radius;
        height: parent.height;

        anchors.left: input.right;
        anchors.leftMargin: 5;
        anchors.right: parent.right;

        MouseArea {
            anchors.fill: parent;
            onClicked: { parent.border.color = "red"; }
        }

        Text {
            id: arrow
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;

            font.pointSize: parent.height/2;
            text: qsTr("V")
        }
    }
}

}
