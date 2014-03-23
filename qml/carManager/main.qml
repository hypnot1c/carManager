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
    }
    ListElement {
      name: "Fuel"
    }
    ListElement {
      name: "Statistic"
    }
    ListElement {
      name: "Notifys"
    }
  }
  Component {
      id: highlight
      Rectangle {
          width: 180; height: 40
          color: "lightsteelblue"; radius: 5
          //y: lst.currentItem.y
          Behavior on y {
              SpringAnimation {
                  spring: 3
                  damping: 0.2
              }
          }
      }
  }
  Rectangle {
    id: lst
    anchors.fill: parent
    ListView {
      width: 200
      height: 200
      spacing: 3

      anchors.top: parent.top
      anchors.left: parent.left
      anchors.topMargin: 80
      anchors.leftMargin: 50

      model: menuModel
      currentIndex: 0
      highlight: highlight

      delegate: Rectangle {
        width: 140
        height: 30
        radius: 4
        border.color: "Gray"
        border.width: 2
        Text {
          text: name
        }
      }
    }
  }
}
