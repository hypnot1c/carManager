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
      anchors.topMargin: 80
      anchors.left: parent.left
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

    ListModel {
      id: serviceModel

      ListElement {
        date: "25.03.2014"

        services: [
          ListElement {
            name: "Замена ГРМ"
            cost: 3130.55
          },
          ListElement {
            name: "Замена ГРМ"
            cost: 3130.55
          },
          ListElement {
            name: "Замена ГРМ"
            cost: 3130.55
          },
          ListElement {
            name: "Замена ГРМ"
            cost: 3130.55
          },
          ListElement {
            name: "Замена ГРМ"
            cost: 3130.55
          },
          ListElement {
            name: "Замена ГРМ"
            cost: 3130.55
          },
          ListElement {
            name: "Замена ГРМ"
            cost: 3130.55
          },
          ListElement {
            name: "Замена ГРМ"
            cost: 3130.55
          }
        ]
      }
    }


    ListView {
      id: serviceContent

      width: 400
      height: parent.height

      anchors.top: parent.top
      anchors.topMargin: 80
      anchors.left: menu.right
      anchors.leftMargin: 20

      model: serviceModel

      delegate: Item {
        width: parent.width
        height: 400

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
