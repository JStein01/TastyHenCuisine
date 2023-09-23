import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Rectangle{
    id: loginViewRec
    property var padItemSize: screenWidth/11
    Image{
        id: loginViewBackground
        anchors.centerIn: parent
        height: parent.height
        width: parent.width
        //fillMode: Image.PreserveAspectFit
        source: "lib/southpark.jpg"
        Rectangle{
            id:pad
            width: parent.width/3
            height: 0.95*parent.height
            anchors.centerIn: parent       
            radius: 10
            color: "grey"
            opacity: 0.9
            
        }
        GridLayout{
                rows: 4
                columns: 3
                anchors.centerIn: pad
                columnSpacing: pad.width/20
                rowSpacing: pad.width/20
                Rectangle{
                    id: b1
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"1"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "1"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b2
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"2"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "2"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b3
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"3"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "3"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b4
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"4"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "4"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b5
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"5"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "5"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b6
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"6"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "6"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b7
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"7"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "7"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b8
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"8"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "8"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b9
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"9"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "9"
                        }
                        onPressed:{
                            parent.color = "darkgray"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: bx
                    width: padItemSize
                    height: padItemSize
                    color: "transparent"
                    radius: 100
                    opacity: 1
                    Image{
                        anchors.fill:parent
                        source: "lib/cancel.svg"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin = ""
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: b0
                    width: padItemSize
                    height: padItemSize
                    color: "gainsboro"
                    border.color: "black"
                    radius: 10
                    opacity: 1
                    Text{
                        anchors.centerIn: parent
                        text:"0"
                        font.pointSize: 80
                        font.bold: true
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            pin += "0"
                        }
                        onPressed:{
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "gainsboro"
                        }
                    }
                }
                Rectangle{
                    id: bV
                    width: padItemSize
                    height: padItemSize
                    color: "transparent"
                    radius: 10
                    opacity: 1
                    Image{
                        anchors.fill:parent
                        source: "lib/ok.svg"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            backend.processPin(pin)
                            if (backend.processPin(pin)){
                                console.log("right pin")
                                inLogin = !inLogin
                                topBandText = backend.getCurrentUser()
                                pin=""
                            }
                            else{
                                topBandText = "Wrong Pin"
                                console.log("wrong pin")
                                pin=""
                            }
                        }
                    }
                }
            }
    }
}