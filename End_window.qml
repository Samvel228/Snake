import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15

Rectangle {
    id: dialog
    anchors.centerIn: parent
    height: 540
    width: 480
    visible: false
    color: "#ec3e31"

    ColumnLayout {
        id: cl
        anchors.centerIn: parent
        spacing: 50

        Text {
            Layout.alignment : Qt.AlignVCenter | Qt.AlignHCenter
            font.pixelSize: 50
            color: "#2ced68"
            text: "Score: " + score.score
            font.bold: true
        }

        RowLayout {
            My_Button {
                Text {
                    anchors.centerIn: parent
                    text: "New Game"
                    font.bold: true
                }

                onActivated: {
                    head.x = 525
                    head.y = 375
                    head.direction = 0
                    head.now_direction = 0
                    body.model = 1
                    t.running = true
                    var last_posX = []
                    var last_posY = []
                    var a = random_position.random_pos(last_posX, last_posY);
                    apple.x = a[0]
                    apple.y = a[1]
                    score.score = 0
                    dialog.visible = false
                }
            }

            My_Button {
                Text {
                    anchors.centerIn: parent
                    text: "Quit"
                    font.bold: true
                }

                onActivated: {
                    Qt.quit()
                }
            }
        }
    }
}
