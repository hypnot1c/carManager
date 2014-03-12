import QtQuick 2.2

Item {
  id: infoForm
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
  }
}
