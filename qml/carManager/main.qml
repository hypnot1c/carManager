import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1

Rectangle {
    width: 360
    height: 360

    signal authorizing(string login, string password)

    function authResult(isSuccess) {
        login.enabled = true;
        authResultText.text = isSuccess ? "Success" : "Fail"
    }

    Column {
        spacing: 4
        anchors.centerIn: parent
        Row {
            anchors.left: parent.left;
            anchors.right: parent.right
            width: parent.width
        Text {
            text: "Login"
            width: 50
        }

        LineInput {
            id: userEmail
            width: 140
            focus: true
            hintText: "Enter e-mail..."
            KeyNavigation.tab: userPassword
        }
        }

        Row {
            anchors.right: parent.right
            Text {
                text: "Password"
                width: 50
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

        Row {
            anchors.right: parent.right
            Button {
                id: login
                text: "Sign in"
                tooltip: "Sign into programm"
                onClicked: {
                    login.enabled = false;
                    authorizing(userEmail.inputText, userPassword.inputText);
                }
            }
        }
        Row {

            ProgressBar {
                 id: pb2
                 indeterminate: true
                 width: 100
                 height: 12
                 visible: true
             }

            Text {
                id: authResultText
                text: "Please login..."
            }
        }

    }
}
