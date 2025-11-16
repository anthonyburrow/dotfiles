import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Rectangle {
    width: 640
    height: 480
    color: "#1e1e1e"

    TextConstants { id: textConstants }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Login"
            color: "#ffffff"
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: usernameField
            width: 300
            placeholderText: "Username"
            text: userModel.lastUser
            font.pixelSize: 14
            color: "#ffffff"
            background: Rectangle {
                color: "#2e2e2e"
                border.color: "#4e4e4e"
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
            font.pixelSize: 14
            color: "#ffffff"
            background: Rectangle {
                color: "#2e2e2e"
                border.color: "#4e4e4e"
                radius: 4
            }
            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    login()
                }
            }
        }

        Rectangle {
            width: 300
            height: 40
            color: loginMouseArea.pressed ? "#4e4e4e" : "#3e3e3e"
            border.color: "#5e5e5e"
            radius: 4
            
            Text {
                text: "Login"
                color: "#ffffff"
                anchors.centerIn: parent
                font.pixelSize: 14
            }
            
            MouseArea {
                id: loginMouseArea
                anchors.fill: parent
                onClicked: login()
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