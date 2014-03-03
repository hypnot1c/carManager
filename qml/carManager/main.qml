import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1

Rectangle {
    width: 360
    height: 360

    signal authorizing(string login, string password)

    function authResult(isSuccess) {
        authResultText.text = isSuccess ? "Success" : "Fail"
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 4

    RowLayout {
    Text {
        text: "Login"
        Layout.fillWidth: true;

        width: 100
    }

    LineInput {
        id: userEmail
        width: 140
        focus: true
        hintText: "Enter e-mail..."
        KeyNavigation.tab: userPassword
    }
    }

    RowLayout {
        Text {
            text: "Password"
            Layout.fillWidth: true;
            width: 100
        }

    LineInput {
        id: userPassword
        width: 140
        focus: true
        hintText: "Enter password..."
        KeyNavigation.tab: userEmail
        echoMode: TextInput.Password
    }
    }

    RowLayout {
        anchors.right: parent.right
        Button {
            anchors.right: parent.right
            id: login
            text: "Sign in"
            tooltip: "Sign into programm"
            onClicked: authorizing(userEmail.inputText, userPassword.inputText)
        }
    }
    RowLayout {
        Text {
            id: authResultText
            text: "Please login..."
        }
    }
    }
}
