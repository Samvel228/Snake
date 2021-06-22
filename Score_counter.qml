import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: score_counter
    property int score: 0
    width: 1025
    height: 75
    color: "#619417"

    RowLayout {
        anchors.centerIn: parent

        Rectangle {
            id: a_score
            visible: true
            radius: 7.5
            width: 25
            height: 25
            color: "#ec3e31"
        }

        Text {
            id: score
            font.pixelSize: 35
            color: "White"
            text: score_counter.score
        }
    }

    Rectangle {
        height: 75
        width: 8
        color: "#185012"
        anchors.left: parent.left
    }
    Rectangle {
        height: 75
        width: 8
        color: "#185012"
        anchors.right: parent.right
    }
    Rectangle {
        height: 8
        width: 1025
        color: "#185012"
        anchors.bottom: parent.bottom
    }
    Rectangle {
        height: 8
        width: 1025
        color: "#185012"
        anchors.top: parent.top
    }
}
