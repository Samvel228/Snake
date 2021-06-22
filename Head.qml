import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml 2.15
import QtQuick.Layouts 1.3

Rectangle {
    id: r
    signal move()
    property int direction: 0
    property int now_direction: 0

    visible: true
    width: 25
    height: 25
    color: "skyblue"

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["right"]
        onActivated: {
            if (r.now_direction != 3){
                r.direction = 0
                move()
            }
        }
    }
    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["down"]
        onActivated: {
            if (r.now_direction != 2){
                r.direction = 1
                move()
            }
        }
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["left"]
        onActivated: {
            if (r.now_direction != 0){
                r.direction = 3
                move()
            }
        }
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["up"]
        onActivated: {
            if (r.now_direction != 1){
                r.direction = 2
                move()
            }
        }
    }
}
