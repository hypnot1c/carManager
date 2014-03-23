import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

import "../forms"

Window {
  id: regWindow
  width: 500
  height: 300
  modality: Qt.ApplicationModal
  Rectangle {
    id: steps
    width: parent.width
    height: 20

    color: "green"
    anchors.top: parent.top
    anchors.topMargin: 40
  }

  Item {
    width: parent.width * 0.8

    anchors.top: steps.bottom
    anchors.topMargin: 20
    anchors.horizontalCenter: parent.horizontalCenter

    Column {
      width: parent.width
      height: parent.height
      spacing: 4
      Item {
        id: regItm
        width: parent.width
        height: 120
        Loader {
          width: 300
          height: 120
          id: reg
          anchors.horizontalCenter: parent.horizontalCenter
          source: "qrc:/qml/qml/carManager/forms/regForm.qml"
        }
      }
    }
  }
  Item {
    width: 80
    height: 40

    anchors.right: parent.right
    anchors.rightMargin: 20
    anchors.bottom: parent.bottom

    Button {
      text: "Next ->"
      width: 80

      onClicked: ParallelAnimation {
        PropertyAnimation {
          target: regItm
          property: "x"
          to: -70
          duration: 600
        }
        PropertyAnimation {
          target: regItm
          property: "opacity"
          to: 0.0
          duration: 600
        }
        onStopped: {
          reg.setSource("qrc:/qml/qml/carManager/forms/infoForm.qml");
          regItm.x += 70;
          regItm.opacity = 1.0;
        }
      }
    }
  }
}
