import QtQuick 2.2

import "../components"

Item {
  id: regForm
  anchors.centerIn: parent
  width: 500
  height: 200

  Column {
    anchors.centerIn: parent
    spacing: 4

    Row {
      Text {
        text: "Login"
        font.pointSize: 14
        width: 150
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
        width: 150
      }

      LineInput {
        id: userPassword
        width: 140
        focus: true
        hintText: "Enter password..."
        KeyNavigation.tab: checkUserPassword
        echoMode: TextInput.Password
      }
    }

    Row {
      width: parent.width
      Text {
        text: "Password again"
        font.pointSize: 14
        width: 150
      }

      LineInput {
        id: checkUserPassword
        width: 140
        focus: true
        hintText: "Enter password..."
        KeyNavigation.tab: userEmail
        echoMode: TextInput.Password
      }
    }
  }
}
