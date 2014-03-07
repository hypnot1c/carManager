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
    Item {
      anchors.centerIn: parent
      width: 200
      height: parent.height
      Column {
        anchors.centerIn: parent
      Row {
        Text {
          text: "Login"
          font.pointSize: 14
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

      Row {
        width: parent.width
        Text {
          text: "Password"
          font.pointSize: 14
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
  }
//        Row {
//            anchors.horizontalCenter: parent.horizontalCenter
//            width: parent.width
//            Button {
//                id: login
//                text: "Sign in"
//                tooltip: "Sign into programm"
//                onClicked: {
//                    login.enabled = false;
//                    authorizing(userEmail.inputText, userPassword.inputText);
//                }
//            }
//        }
//        Row
//        {
//            anchors.horizontalCenter: parent.horizontalCenter
//            width: parent.width
//            ProgressBar {
//                 id: pb2
//                 indeterminate: true
//                 width: parent.width
//                 height: 12
//                 visible: true
//             }
//        }

//        Row {
//            anchors.horizontalCenter: parent.horizontalCenter
//            width: parent.width
//            Text {
//                id: authResultText
//                text: "Please login..."
//            }
//        }
    }
}
