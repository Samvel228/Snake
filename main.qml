import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15


Window {
    id: window
    width: 1025
    height: 800
    visible: true
    title: qsTr("body")
    maximumHeight: 800
    minimumHeight: 800
    maximumWidth: 1025
    minimumWidth: 1025

    color: "#99ff66"

    Background {}

    Apple{
        id: apple
        x: -25
        y: -25
    }

    Repeater {
        id: body
        model: 1

        Body {
            x: 500
            y: 375
        }
    }

    Head {
        id: head
        x: 525
        y: 375
    }

    End_window {
        id: dialog
        visible: true
    }

    Score_counter {
        id: score
        anchors.bottom: parent.bottom
    }

    Timer{
        id: t
        interval: 80
        running: false
        repeat: true
        onTriggered: {
            for (var i = body.model-1; i >= 1;i--){
                body.itemAt(i).x = body.itemAt(i-1).x
                body.itemAt(i).y = body.itemAt(i-1).y
            }
            body.itemAt(0).x = head.x
            body.itemAt(0).y = head.y

            head.now_direction = head.direction

             switch (head.direction) {
                case(0):
                    head.x+=25
                    break;
                case (1):
                    head.y+=25
                    break;
                case (2):
                    head.y-=25
                    break;
                case (3):
                    head.x-=25
                    break;
            }

            if (head.x > 1000) {
                 head.x = 0
            }
            if (head.x < 0) {
                 head.x = 1000
            }
            if (head.y > 700){
                head.y = 0
            }
            if (head.y < 0) {
                head.y = 700
            }

            if ((head.x === apple.x) && (head.y === apple.y)){
                var last_posX = []
                var last_posY = []

                for (i = 0; i <= body.model-1;i++){
                    last_posX.push(body.itemAt(i).x)
                    last_posY.push(body.itemAt(i).y)
                }
                body.model += 1

                for (i = body.model-2; i >= 0;i--){
                    body.itemAt(i).x = last_posX[i]
                    body.itemAt(i).y = last_posY[i]
                }
                body.itemAt(body.model-1).x = last_posX[body.model-2]
                body.itemAt(body.model-1).y = last_posY[body.model-2]

                var a = random_position.random_pos(last_posX, last_posY)
                apple.x = a[0]
                apple.y = a[1]
                score.score += 1
            }

            for (i = body.model-1; i >= 1;i--){
                if ((body.itemAt(i).x === head.x) && (body.itemAt(i).y === head.y)){
                    t.running = false
                    dialog.visible = true
                }
            } 
        }
    }
}

