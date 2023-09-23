import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: topBand
    color: "black"
    width: parent.width
    height: parent.height/7
    anchors{
        top: parent.top
        left:parent.left
        right: parent.right
    }
    Rectangle{
        id: logoTHC
        width: height * 0.8
        height: parent.height
        color: "transparent"
        anchors{
            top: parent.top
            right: parent.right
        }
        Image{
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            anchors.margins: 20
            source: "lib/Logo.jpg"
        }
    }

    Rectangle{
        id: logout
        height: parent.height
        width: height * 0.5
        color:"transparent"
        anchors{
            top: parent.top
            right: logoTHC.left
        }
        Image{
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "lib/logout.png"
            MouseArea{
                id:ma_Logout
                anchors.fill: parent
                onClicked:{
                    if (!inLogin){
                        inLogin = !inLogin
                        topBandText = "Please Log In"
                    }
                    else{
                        inLogin = inLogin
                    }
                }
            }
        }
    }
    Rectangle{
        id: logExit
        height: parent.height
        width: height*0.5
        color:"transparent"
        anchors{
            top: parent.top
            right: logout.left
        }
        Image{
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "lib/Exit.png"
            MouseArea{
                id:ma_Exit
                anchors.fill: parent
                onClicked:{
                    Qt.quit()
                }
            }
        }
    }
    Rectangle{
        id: time
        width: parent.width/4
        height: parent.height
        color: "transparent"
        anchors{
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            
        } 
        Text{
            id: hour
            anchors.centerIn: parent
            font.pointSize: 50
            Timer {
                interval: 30000; running: true; repeat: true
                onTriggered: hour.text = new Date().toLocaleTimeString(Qt.locale(), Locale.ShortFormat)
            }
            text:  new Date().toLocaleTimeString(Qt.locale(), Locale.ShortFormat)
            color: "white"
        }
    }
    Rectangle{
        id: pleaseLogin
        width:  parent.width/4
        height: parent.height
        color: "transparent"
        anchors{
            top: parent.top
            right: time.left
        }
        Text{
            id: loginplease
            anchors.centerIn: parent
            text: topBandText
            font.pointSize: 50
            color: "white"
        }
    }
    Rectangle{
        id: blazebaseRect
        height: parent.height
        width: height
        color: "transparent"
        anchors{
            top: parent.top
            left: parent.left
        }
        Image{
            anchors.fill: parent
            anchors.margins: 20
            fillMode: Image.PreserveAspectFit
            source: "lib/Logo_Cropped_Dark.png"
        }
    }
}