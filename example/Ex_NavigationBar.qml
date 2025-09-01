import QtQuick 2.0
import Toou2D 1.0

Column {
    spacing: 20

    TNavigationBar {
        width: 400
        itemWidth: 60
        TNavigationElement {
            text: "User"
            otherData: ''
        }

        TNavigationElement {
            text: "Config"
            otherData: ''
        }

        TNavigationElement {
            text: "Role"
            otherData: ''
        }

        TNavigationElement {
            text: "Task"
            otherData: ''
        }

        children: [
            TDividerLine {
                width: parent.width
                height: 1
                color: "#DCDCDC"
                anchors.bottom: parent.bottom
            }
        ]
    }

    TNavigationBar {
        id: nb
        width: 400
        itemWidth: 90

        activeLabel.color: "#F36D6F"
        activeIcon.color: "#F36D6F"

        TNavigationElement {
            iconSource: TAwesomeType.FA_apple
            text: "Apple"
            otherData: ''
        }

        TNavigationElement {
            iconSource: TAwesomeType.FA_android
            text: "Android"
            otherData: ''
        }

        TNavigationElement {
            iconSource: TAwesomeType.FA_github
            text: "Github"
            otherData: ''
        }

        TNavigationElement {
            iconSource: TAwesomeType.FA_youtube
            text: "Youtube"
            otherData: ''
        }

        children: [
            TDividerLine {
                anchors.bottom: parent.bottom
                width: nb.currentItem?.width ?? 0
                height: 2
                x: nb.currentItem?.x ?? 0
                color: "#DCDCDC"

                Behavior on x {
                    NumberAnimation {
                        easing.type: Easing.OutBack
                        duration: 100
                    }
                }
            }
        ]
    }
}
