import QtQuick 2.2
import QtQuick.Controls 1.1

import "components"
import "windows"

Rectangle {
  id: root
  width: 360
  height: 300

  signal authorizing(string login, string password)

  function authResult(isSuccess) {
    login.enabled = true;
    pb2.visible = false;
  }

  Image {
    id: addUser
    anchors.right: parent.right
    source: "qrc:/img/image/addProfile.png"
    MouseArea{
      anchors.fill: parent
      onClicked: {
        var comp = Qt.createComponent("qrc:/qml/qml/carManager/windows/regWindow.qml");
        var win = comp.createObject(root);
        win.show();
      }
    }
  }

  Item {
    id: loginForm
    anchors.centerIn: parent
    width: 200
    height: 200

    Column {
      anchors.centerIn: parent
      spacing: 4
      Row {
        width: parent.width
        height: 66
        Item {
          width: parent.width
          Image {
            id: car
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/image/car.png"
          }
        }
      }

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
      Row {
        width: parent.width
        height: 25
        Item {
          width: parent.width
          height: parent.height
          Button {
            id: login
            text: "Sign in"
            anchors.right: parent.right
            width: 80
            tooltip: "Sign into programm"
            onClicked: {
              login.enabled = false;
              pb2.visible = true;
              authorizing(userEmail.inputText, userPassword.inputText);
            }
          }
        }
      }
    }
    Item {
      width: parent.width
      height: 25
      anchors.top: loginForm.bottom
      ProgressBar {
        id: pb2
        anchors.horizontalCenter: parent.horizontalCenter
        indeterminate: true
        width: parent.width + 30
        height: 12
        visible: false
      }
    }
  }
}
