import QtQuick 2.0
import Toou2D 1.0

Column {
    Row {
        spacing: 20
        TButton {
            id: button
            height: 40
            label.text: "Loose"
            label.color: "#46A0FC"
            onClicked: popover.openToGlobal(button, mouseX, mouseY)
        }

        TButton {
            id: bmenu
            height: 40
            label.text: "Popover Menu"
            label.color: "#46A0FC"
            onClicked: popoverMenu.openToGlobal(bmenu, mouseX, mouseY)
        }

        TButton {
            id: b2
            height: 40
            label.text: "Fixed"
            label.color: "#46A0FC"
            onClicked: popover.openToGlobal(b2, 0, b2.height)
        }
    }

    TPopover {
        id: popover
    }

    TPopoverMenu {
        id: popoverMenu

        TPopoverElement {
            type: "group"
            text: "BUILDING BLOCKS"
            otherData: ''
        }

        TPopoverElement {
            iconSource: TAwesomeType.FA_apple
            text: "Request"
            otherData: ''
        }

        TPopoverElement {
            iconSource: TAwesomeType.FA_android
            text: "Collection"
            otherData: ''
        }

        TPopoverElement {
            iconSource: TAwesomeType.FA_git
            text: "Environment"
            otherData: ''
        }

        TPopoverElement {
            type: "group"
            text: "ADVANCED"
            otherData: ''
        }

        TPopoverElement {
            iconSource: TAwesomeType.FA_music
            text: "Document"
            otherData: ''
        }

        TPopoverElement {
            iconSource: TAwesomeType.FA_heartbeat
            text: "Mock Server"
            otherData: ''
        }

        TPopoverElement {
            iconSource: TAwesomeType.FA_car
            text: "Monitor"
            otherData: ''
        }
    }
}
