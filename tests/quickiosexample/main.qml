import QtQuick 2.3
import QtQuick.Window 2.2
import QuickIOS 0.1

Window {
    id: window
    visible: true

    NavigationBar{
        id : navBar
        title: "Quick iOS Example Program"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            navigation.push(Qt.resolvedUrl("alertview/AlertViewDemo.qml"));
        }
    }

    Text {
        text: qsTr("Press for next content view")
        anchors.centerIn: parent
    }

    NavigationView {
        id : navigation
        anchors.top: navBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

    }

}
