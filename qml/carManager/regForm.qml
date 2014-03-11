import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

Window {
  width: 500
  height: 300
  modality: Qt.ApplicationModal

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
}
