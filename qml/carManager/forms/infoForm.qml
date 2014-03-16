import QtQuick 2.2
import QtQuick.Controls 1.1

import "../components"

Item {
  id: infoForm
  anchors.centerIn: parent
  width: 500
  height: 200

  Column {
    anchors.centerIn: parent
    spacing: 4

    ComboBox {
      width: 100
    }
  }
}
