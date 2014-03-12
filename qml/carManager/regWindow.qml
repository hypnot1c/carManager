import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

Window {
  width: 1200
  height: 400
  modality: Qt.ApplicationModal

  Rectangle {

    width: 1200
    height: 400

    ListModel {
      id: dataModel

      ListElement {
        color: "orange"
        text: "first"
      }
      ListElement {
        color: "lightgreen"
        text: "second"
      }
    }

    PathView {
      id: view
      property int itemAngle: 60
      property int itemSize: 300
      anchors.fill: parent
      model: dataModel
      pathItemCount: 6
      Keys.onRightPressed: if (!moving && interactive) incrementCurrentIndex()
      Keys.onLeftPressed: if (!moving && interactive) decrementCurrentIndex()
      path: Path {
        startX: 0
        startY: height / 2

        PathPercent { value: 0.0 }
        PathAttribute { name: "z"; value: 0 }
        PathAttribute { name: "angle"; value: 60 }
        PathAttribute { name: "origin"; value: 0 }
        PathLine {
          x: (view.width - 300) / 2
          y: view.height / 2
        }
        PathAttribute { name: "angle"; value: 60 }
        PathAttribute { name: "origin"; value: 0 }
        PathPercent { value: 0.49 }
        PathAttribute { name: "z"; value: 10 }


        PathLine { relativeX: 0; relativeY: 0 }

        PathAttribute { name: "angle"; value: 0 }
        PathLine {
          x: (view.width - 300) / 2 + 300
          y: view.height / 2
        }
        PathAttribute { name: "angle"; value: 0 }
        PathPercent { value: 0.51 }

        PathLine { relativeX: 0; relativeY: 0 }

        PathAttribute { name: "z"; value: 10 }
        PathAttribute { name: "angle"; value: -60 }
        PathAttribute { name: "origin"; value: 300 }
        PathLine {
          x: view.width
          y: view.height / 2
        }
        PathPercent { value: 1 }
        PathAttribute { name: "z"; value: 0 }
        PathAttribute { name: "angle"; value: -60 }
        PathAttribute { name: "origin"; value: 300 }
      }
      delegate: Rectangle {
        property real rotationAngle: PathView.angle
        property real rotationOrigin: PathView.origin

        width: 300
        height: width
        z: PathView.z
        //color: model.color
        border {
          color: "black"
          width: 1
        }
        transform: Rotation {
          axis { x: 0; y: 1; z: 0 }
          angle: rotationAngle
          origin.x: rotationOrigin
        }
        Loader {
          source: model.text === "first" ? "qrc:/qml/qml/carManager/regForm.qml" : "qrc:/qml/qml/carManager/infoForm.qml"
        }
        Component {

        }

//        Text {
//          anchors.centerIn: parent
//          font.pointSize: 32
//          text: model.text
//        }
      }
    }
  }
}
