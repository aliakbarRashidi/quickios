// NavigationView provides views management like UINavigationController in iOS
// Author: Ben Lau (benlau)

import QtQuick 2.0

Item {
    id: navigationView
    width: 100
    height: 62

//    property alias views : stack

    function push(content) {
        // Only string source is supportd now.
        stack.append({ source: content
                     })
    }

    function pop() {
        if (stack.count > 0)
            stack.remove(stack.count - 1);
    }

    ListModel {
        id : stack
    }

    Repeater {
        anchors.fill: parent
        id : repeater
        model: stack
        z: 100000

        delegate: Item {
            id: item
            enabled: index === stack.count - 1 ; // Only the top page is enabled
            x: 0; // Don't use anchors for animation
            y: 0;
            width: repeater.width;
            height: repeater.height;

            property bool alive : true

            Loader {
                id: content
                active: true
                source: model.source
                anchors.fill: parent
            }
        }
    }

}
