import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import com.kr 1.0

Window {
    id: base
    visible: true

    // this will provide automatic adaption to screen size and orientation
    property bool orientationPortrait: false
    property bool targetARM: false // do not change this line

    width: (orientationPortrait) ? 480 : 800;   height: (orientationPortrait) ? 800 : 480;

    Rectangle {
        id: view

        // this will provide automatic adaption to screen size and orientation
        width: (targetARM && orientationPortrait) ? base.height : base.width;
        height: (targetARM && orientationPortrait) ? base.width : base.height;
        rotation: (targetARM && orientationPortrait) ? -90 : 0
        anchors.centerIn: parent


        // add your GUI code below this line

        color: "black"

        // a text in the center of the application
        Text {
            anchors.centerIn: parent
            font.pointSize: 20
            color: "blue"
            text: "kr_ccpilot_va"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    pulu.moveBackwardTo(1, 1);
                }
            }
        }

        // a simple exit-button in the top-right corner
        Rectangle {
            width: 120;  height: 120
            anchors.right: parent.right
            anchors.top: parent.top
            color: "grey"
            Text {
                anchors.centerIn: parent
                text: "Exit"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.quit();
                }
            }
        }

        // status console bar on bottom
        Rectangle {
            id: statbar
            anchors.bottom: parent.bottom
            width: parent.width
            height: statbartext.font.pixelSize * 2
            color: "white"
            Text {
                id: statbartext
                anchors {
                    fill: parent
                }
                verticalAlignment: Text.AlignVCenter
                color: "black"
                text: "Hello QML"
                Connections {
                    target: ui
                    onStatusLog: {
                                statbartext.text = str;
                            }
                }
            }
        }
    }
}

