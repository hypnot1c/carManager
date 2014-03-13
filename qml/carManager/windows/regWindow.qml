import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

import "../components"

Window {
  width: 1200
  height: 400
  modality: Qt.ApplicationModal

  Rectangle {
    width: 1200
    height: 400

    LineInput {
      width: 140
      hintText: "sdgdsfgfdgd"
    }
  }
}
