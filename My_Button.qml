import QtQuick 2.0

Rectangle {
    signal activated()
    width: 100
    height: 60
    color: "#2ced68"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            activated()
        }
    }
}
