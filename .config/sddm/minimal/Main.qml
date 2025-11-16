import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Rectangle {
    width: 640
    height: 480
    color: "#1e1e1e"

    Image {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
    }

    TextConstants { id: textConstants }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Login"
            color: config.colorForeground
            font.family: "Noto Mono"
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: usernameField
            width: 300
            placeholderText: "Username"
            text: userModel.lastUser
            font.family: "Noto Mono"
            font.pixelSize: 14
            color: config.colorBackground
            palette {
                text: config.colorBackground
                placeholderText: config.colorBackground
            }
            background: Rectangle {
                color: config.colorForeground
                border.color: config.colorForeground
                radius: 4
            }
            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    passwordField.focus = true
                }
            }
        }

        TextField {
            id: passwordField
            width: 300
            placeholderText: "Password"
            echoMode: TextInput.Password
            passwordCharacter: "•"
            font.family: "Noto Mono"
            font.pixelSize: 14
            color: config.colorBackground
            palette {
                text: config.colorBackground
                placeholderText: config.colorBackground
            }
            background: Rectangle {
                color: config.colorForeground
                border.color: config.colorForeground
                radius: 4
            }
            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    login()
                }
            }
        }

        Text {
            id: errorMessage
            text: ""
            color: "#ff6b6b"
            font.pixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
            visible: text !== ""
        }
    }

    function login() {
        console.log("Login attempt:", usernameField.text)
        errorMessage.text = ""
        sddm.login(usernameField.text, passwordField.text, sessionModel.lastIndex)
    }

    Component.onCompleted: {
        console.log("Theme loaded successfully")
        console.log("Config object:", JSON.stringify(config))
        if (usernameField.text === "") {
            usernameField.focus = true
        } else {
            passwordField.focus = true
        }
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            errorMessage.text = "Login failed"
            passwordField.text = ""
            passwordField.focus = true
        }
    }
}