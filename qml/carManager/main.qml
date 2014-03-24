import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

import "components"
import "windows"

ApplicationWindow {
  id: root
  width: 700
  height: 500
  visible: true



  ListModel {
    id: menuModel
    ListElement {
      name: "Service"
      image: "qrc:/img/image/wrench.png"
    }
    ListElement {
      name: "Fuel"
      image: "qrc:/img/image/fuel.png"
    }
    ListElement {
      name: "Statistic"
      image: "qrc:/img/image/chart.png"
    }
    ListElement {
      name: "Notifys"
      image: "qrc:/img/image/notification.png"
    }
  }

  Item {
    id: lst
    anchors.fill: parent
    ListView {
      id: menu
      width: 200
      height: 200
      spacing: 3

      anchors.top: parent.top
      anchors.left: parent.left
      anchors.topMargin: 80
      anchors.leftMargin: 50
      focus: true
      model: menuModel
      currentIndex: 0
      highlight: Rectangle {
        color: "lightgray"
        radius: 5
        opacity: 0.7
      }

      delegate: Item {
        width: 140
        height: 30

        Image {
          width: 22
          height: 22
          anchors.left: parent.left
          anchors.leftMargin: 10
          anchors.verticalCenter: parent.verticalCenter

          source: image
        }

        Text {
          text: name
          anchors.centerIn: parent
        }

        MouseArea {
          anchors.fill: parent
          onClicked: {
            menu.currentIndex = index;
          }
        }
      }
    }
  }
}
