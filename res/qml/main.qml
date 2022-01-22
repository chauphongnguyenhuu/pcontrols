import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        color: "grey"
    }

    SequentialImageAnimation {
        id: anim
        anchors.centerIn: parent
        startFrame: 0
        endFrame: 5
        frameRate: 1
        sourceFormat: "qrc:/image/animation_{3}.png"
        loops: Animation.Infinite
        running: false
    }

    Row {
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 50
            leftMargin: 50
        }
        spacing: 10

        Button {
            width: 60
            height: 40
            text: "start"
            onClicked: anim.start()
        }

        Button {
            width: 60
            height: 40
            text: "stop"
            onClicked: anim.stop()
        }

        Button {
            width: 60
            height: 40
            text: "restart"
            onClicked: anim.restart()
        }

        Button {
            width: 60
            height: 40
            text: "pause"
            onClicked: anim.pause()
        }

        Button {
            width: 60
            height: 40
            text: "resume"
            onClicked: anim.resume()
        }

        Button {
            width: 60
            height: 40
            text: "complete"
            onClicked: anim.complete()
        }
    }
}
