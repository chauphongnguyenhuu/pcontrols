import QtQuick 2.0

Item {
    id: root

    property string sourceFormat: "example_{0}.png"

    property int startFrame: 0
    property int endFrame: 0
    property int frameRate: 0
    property int frameCount: endFrame - startFrame + 1
    property int currentFrame: startFrame

    property alias easing: anim.easing
    property alias loops: anim.loops
    property alias running: anim.running
    property alias paused: anim.paused
    property alias alwaysRunToEnd: anim.alwaysRunToEnd

    property alias animation: anim // for convenience

    signal started()
    signal stopped()

    function start() {
        anim.start()
    }

    function stop() {
        anim.stop()
    }

    function restart() {
        anim.restart()
    }

    function pause() {
        anim.pause()
    }

    function resume() {
        anim.resume()
    }

    function complete() {
        anim.complete()
    }

    function padZero(value, width) {
        return ("" + value).padStart(width, "0")
    }

    function formatString(str, value) {
        return str.replace(/{(\d+)}/g, function(match, number) {
            var width = parseInt(number)
            return padZero(value, width)
        })
    }

    width: 200
    height: 200

    Repeater {
        model: frameCount

        Image {
            anchors.fill: root
            source: formatString(sourceFormat, model.index + startFrame)
            visible: currentFrame === model.index + startFrame
        }
    }

    // jerked when endFrame -> startFrame
    NumberAnimation on currentFrame {
        id: anim
        from: startFrame
        to: endFrame
        duration: frameCount * 1000.0 / frameRate
        onStarted: root.started()
        onStopped: root.stopped()
    }
}
