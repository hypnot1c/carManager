import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

import "temp123"

import "components"
import "windows"

ApplicationWindow {
  id: root
  width: 700
  height: 500
  visible: true

  Loader {
    id: menuModel
    source: "temp123/menu.qml"
  }
  Loader {
    id: contentModel
    source: "temp123/serviceContent.qml"
  }

  Item {
    id: lst
    anchors.fill: parent

    ListView {
      id: menu
      width: 150
      height: 200
      spacing: 3

      anchors.top: parent.top
      anchors.topMargin: 80
      anchors.left: parent.left
      anchors.leftMargin: 50

      focus: true
      model: menuModel.item
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
          onClicked: menu.currentIndex = index
        }
      }
    }

    ListView {
      id: serviceContent

      width: 400
      height: parent.height

      anchors.top: parent.top
      anchors.topMargin: 80
      anchors.left: menu.right
      anchors.leftMargin: 10

      model: contentModel.item

      delegate: Item {
        width: parent.width
        height: 150

        Column {
          width: parent.width

          Text {
            text: qsTr(date)
          }

          Rectangle {
            width: parent.width
            height: 4
            color: "Green"
          }

          Grid {
            columns: 5
            rows: 5
            spacing: 4
            Repeater {
              model: services
              delegate: Rectangle {
                  width: 80
                  height: 60
                  radius: 6

                  border.color: "Lightblue"
                  border.width: 1
                  Text {
                    text: name
                  }

                  Text {
                    text: cost
                    anchors.bottom: parent.bottom
                  }
                }
            }
          }
        }
      }
    }
  }
}
