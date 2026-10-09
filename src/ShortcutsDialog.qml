import QtQuick
import QtQuick.Controls

Dialog {
    id: root

    property bool darkMode: true
    property color textColor: darkMode ? "#d0d0d0" : "#42464c"
    property color strongTextColor: darkMode ? "#eeeeee" : "#222324"
    property color activeButtonColor: "#428bca"
    property int containerWidth: 560
    property int containerHeight: 460
    property real textScale: 1

    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    width: Math.min(540, containerWidth - 32)
    x: Math.round((containerWidth - width) / 2)
    y: Math.round((containerHeight - height) / 2)
    padding: 24

    onOpened: closeButton.forceActiveFocus()

    Overlay.modal: Rectangle {
        color: Qt.rgba(0, 0, 0, 0.65)
    }

    background: Rectangle {
        color: root.darkMode ? "#181818" : "#fbfbfb"
        border.color: root.darkMode ? "#343434" : "#d8d8d8"
        border.width: 1
        radius: 0
    }

    header: Item {
        implicitHeight: headerLabel.implicitHeight + 20
        Label {
            id: headerLabel
            anchors.left: parent.left
            anchors.leftMargin: 24
            anchors.top: parent.top
            anchors.topMargin: 20
            text: "Keyboard shortcuts"
            color: root.strongTextColor
            font.family: "IBM Plex Mono"
            font.pixelSize: Math.round(15 * root.textScale)
            font.bold: true
        }
    }

    contentItem: Item {
        implicitWidth: columnsRow.implicitWidth
        implicitHeight: columnsRow.implicitHeight

        Row {
            id: columnsRow
            spacing: 24
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                spacing: 8

                Repeater {
                    model: [
                        { key: "Ctrl+S", desc: "Save" },
                        { key: "Ctrl+Shift+S", desc: "Save As" },
                        { key: "Ctrl+O", desc: "Open" },
                        { key: "Ctrl+N", desc: "New Window" },
                        { key: "Ctrl+P", desc: "Print" },
                        { key: "Ctrl+Z", desc: "Undo" },
                        { key: "Ctrl+Shift+Z", desc: "Redo" },
                        { key: "F11 / Super+F", desc: "Fullscreen" }
                    ]
                    Row {
                        spacing: 10
                        Label {
                            width: Math.round(125 * root.textScale)
                            text: modelData.key
                            color: root.strongTextColor
                            font.family: "IBM Plex Mono"
                            font.pixelSize: Math.round(12 * root.textScale)
                            font.bold: true
                        }
                        Label {
                            text: modelData.desc
                            color: root.textColor
                            font.family: "IBM Plex Mono"
                            font.pixelSize: Math.round(12 * root.textScale)
                        }
                    }
                }
            }

            Column {
                spacing: 8

                Repeater {
                    model: [
                        { key: "Ctrl+F", desc: "Find" },
                        { key: "Ctrl+H", desc: "Find & Replace" },
                        { key: "Ctrl+B", desc: "Bold" },
                        { key: "Ctrl+I", desc: "Italic" },
                        { key: "Ctrl+K", desc: "Link" },
                        { key: "Ctrl++ / -", desc: "Zoom In / Out" },
                        { key: "Ctrl+0", desc: "Reset Zoom" },
                        { key: "Ctrl+Shift+W", desc: "Full / Standard Width" },
                        { key: "Ctrl+? / Ctrl+/", desc: "Shortcuts" }
                    ]
                    Row {
                        spacing: 10
                        Label {
                            width: Math.round(125 * root.textScale)
                            text: modelData.key
                            color: root.strongTextColor
                            font.family: "IBM Plex Mono"
                            font.pixelSize: Math.round(12 * root.textScale)
                            font.bold: true
                        }
                        Label {
                            text: modelData.desc
                            color: root.textColor
                            font.family: "IBM Plex Mono"
                            font.pixelSize: Math.round(12 * root.textScale)
                        }
                    }
                }
            }
        }
    }

    footer: Item {
        implicitHeight: closeButton.implicitHeight + 20

        SquareDialogButton {
            id: closeButton
            anchors.right: parent.right
            anchors.rightMargin: 24
            anchors.verticalCenter: parent.verticalCenter
            text: "Close"
            primary: true
            darkMode: root.darkMode
            textScale: root.textScale
            activeColor: root.activeButtonColor
            onClicked: root.close()
        }
    }
}
