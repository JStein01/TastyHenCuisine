
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Rectangle{
    id: shopView
    Image{
        id: loginViewBackground
        anchors.centerIn: parent
        height: parent.height
        width: parent.width
        source: "lib/tegridy.jpg"
    }


    ShopMenu{
        id: shopMenu
        width: shopView.width/8
        height: 0.95*shopView.height
        anchors.left: shopView.left
        anchors.leftMargin: shopView.width/45    
        anchors.top: shopView.top
        anchors.topMargin: (shopView.height-height)/2   
    }

    MenuDetail{
        id: menuDetail
        width: screenWidth/4
        height: 0.95 * parent.height
        anchors.top: shopView.top
        anchors.left: shopMenu.right
        anchors.leftMargin: screenWidth/25
        anchors.topMargin: (shopView.height-height)/2   
    }

    ModifyItem{
        id: modifyItem
        width: screenWidth/4
        height: 0.95 * parent.height
        anchors.top: shopView.top
        anchors.left: menuDetail.right
        anchors.leftMargin: screenWidth/25
        anchors.topMargin: (shopView.height-height)/2   
    }

    Order{
        id: order
        width: shopView.width/4.5
        height: 0.95*shopView.height
        anchors.right: shopView.right
        anchors.rightMargin: shopView.width/45    
        anchors.top: shopView.top
        anchors.topMargin: (shopView.height-height)/2   
    }    
    Rectangle{
        id: payByCash
        anchors.centerIn: parent
        width: screenWidth/3
        height: 0.6 * screenHeight
        visible: inPayingByCash
        radius: 10
        color: "olivedrab"
        
        Column{
            anchors.centerIn: parent
            Text{
                text: "Customer Cash: "
                font.pointSize: 50
            }
            TextField{
                id: clientCash
                font.pointSize: 40
                validator: IntValidator {bottom: 1; top: 500}
            }
            Text{
                text: "Change: "
                font.pointSize: 50
            }
            Text{
                text: (parseFloat(clientCash.text) - totalPrice * 1.1).toFixed(2) > 0 ? (parseFloat(clientCash.text) - totalPrice * 1.1).toFixed(2) : "0"
                font.pointSize: 40
            }
        }
        Rectangle{
            id: donePayingCash
            width: parent.width/5
            height: parent.height/10
            color: "yellowgreen"
            radius: 10
            anchors{
                bottom: parent.bottom
                right: parent.right
            }
            anchors.bottomMargin: parent.width/12
            anchors.rightMargin: parent.width/12
            Text{
                anchors.centerIn: parent
                text: "Done"
                font.pointSize: 22
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    inPayingByCash = false
                    menuItem.clear()
                    totalPrice = 0
                }
            }
        }
    }   
    Rectangle{
        id: payByCard
        anchors.centerIn: parent
        width: screenWidth/3
        height: 0.6 * screenHeight
        visible: inPayingByCard
        radius: 10
        color: "olivedrab"
        Column{
            anchors.centerIn: parent
            Text{
                text: "Please pay by card: "
                font.pointSize: 50
            }
            Text{
                text: "Total: "
                font.pointSize: 50
            }
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: (totalPrice * 1.1).toFixed(2) + " AUD"
                font.pointSize: 60
            }
        }
        Rectangle{
            id: donePayingCard
            width: parent.width/5
            height: parent.height/10
            color: "yellowgreen"
            radius: 10
            anchors{
                bottom: parent.bottom
                right: parent.right
            }
            anchors.bottomMargin: parent.width/12
            anchors.rightMargin: parent.width/12
            Text{
                anchors.centerIn: parent
                text: "Done"
                font.pointSize: 22
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    inPayingByCard = false
                    menuItem.clear()
                    totalPrice = 0
                }
            }
        }
    }
    Rectangle{
        id: extraView
        anchors.centerIn: parent
        width: screenWidth/3
        height: 0.6 * screenHeight
        visible: inExtra
        radius: 10
        color: "olivedrab"
        Column{
            spacing: 10
            anchors.fill: parent
            anchors.margins: 20
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textBacon
                    property var extraPrice: 1.00
                    anchors.centerIn: parent
                    text: "Bacon Slice        1.00 AUD"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textBacon.extraPrice
                        currentSelectedRecipe += "<br>" + textBacon.text 
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textBBQ
                    property var extraPrice: 0.3
                    anchors.centerIn: parent
                    text: "High-oli Drizzle       0.10 AUD"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textBBQ.extraPrice
                        currentSelectedRecipe += "<br>" + textBBQ.text 
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textCheese
                    property var extraPrice: 0.5
                    anchors.centerIn: parent
                    text: "Cheese Slice         0.50 AUD"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textCheese.extraPrice
                        currentSelectedRecipe += "<br>" + textCheese.text 
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textCorn
                    property var extraPrice: 0.5
                    anchors.centerIn: parent
                    text: "Corn Chips           0.50 AUD"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textCorn.extraPrice
                        currentSelectedRecipe += "<br>" +  textCorn.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id:textSlaw
                    property var extraPrice: 0.5
                    anchors.centerIn: parent
                    text: "Extra Bread           0.50 AUD"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textSlaw.extraPrice
                        currentSelectedRecipe += "<br>" + textSlaw.text 
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textLettuce
                    property var extraPrice: 0.1
                    anchors.centerIn: parent
                    text: "Lettuce           0.10 AUD"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textLettuce.extraPrice
                        currentSelectedRecipe += "<br>" + textLettuce.text 
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textMayo
                    property var extraPrice: 0.1
                    anchors.centerIn: parent
                    text: "Superhigh Sauce           0.10 AUD"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textMayo.extraPrice
                        currentSelectedRecipe +=  "<br>" + textMayo.text
                    }
                }
            }
        }
        Rectangle{
            id: doneExtra
            width: parent.width/5
            height: parent.height/10
            color: "yellowgreen"
            radius: 10
            anchors{
                bottom: parent.bottom
                right: parent.right
            }
            anchors.bottomMargin: parent.width/12
            anchors.rightMargin: parent.width/12
            Text{
                anchors.centerIn: parent
                text: "Done"
                font.pointSize: 22
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    inExtra = false
                }
            }
        }
    }
    Rectangle{
        anchors.centerIn: parent
        width: screenWidth/3
        height: 0.8 * screenHeight
        visible: inModifyDrink
        radius: 10
        color: "olivedrab"
        Column{
            spacing: 10
            anchors.fill: parent
            anchors.margins: 20
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textPepsiMax
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Pepsi Max"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textPepsiMax.extraPrice
                        currentSelectedDrink = textPepsi.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textPepsi
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Pepsi"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textPepsi.extraPrice
                        currentSelectedDrink = textPepsi.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: text7up
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "7up"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += text7up.extraPrice
                        currentSelectedDrink = text7up.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textmountain
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Mountain Dew"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textmountain.extraPrice
                        currentSelectedDrink = textmountain.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textSolo
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Solo"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textSolo.extraPrice
                        currentSelectedDrink = textSolo.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textSunkist
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Sunkist no Sugar"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textSunkist.extraPrice
                        currentSelectedDrink = textSunkist.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textWater
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Bottled Water"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textWater.extraPrice
                        currentSelectedDrink = textWater.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textSparklingWater
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Sparkling Water"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textSparklingWater.extraPrice
                        currentSelectedDrink = textSparklingWater.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textOrange
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Orange Juice"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textOrange.extraPrice
                        currentSelectedDrink = textOrange.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textLipton
                    property var extraPrice: 0
                    anchors.centerIn: parent
                    text: "Lipton Ice Tea"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textLipton.extraPrice
                        currentSelectedDrink = textLipton.text
                    }
                }
            }
        }
        Rectangle{
            id: doneModifyDrink
            width: parent.width/5
            height: parent.height/10
            color: "yellowgreen"
            radius: 10
            anchors{
                bottom: parent.bottom
                right: parent.right
            }
            anchors.bottomMargin: parent.width/12
            anchors.rightMargin: parent.width/12
            Text{
                anchors.centerIn: parent
                text: "Done"
                font.pointSize: 22
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    inModifyDrink = false
                }
            }
        }
    }
    
    Rectangle{
        anchors.centerIn: parent
        width: screenWidth/3
        height: 0.6 * screenHeight
        visible: inModifySide
        radius: 10
        color: "olivedrab"
        Column{
            spacing: 10
            anchors.fill: parent
            anchors.margins: 50
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textLarge
                    property var extraPrice: 3
                    anchors.centerIn: parent
                    text: "Large FRHighs"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textLarge.extraPrice
                        currentSelectedSide += "<br>" + textLarge.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textRegular
                    property var extraPrice: 2
                    anchors.centerIn: parent
                    text: "Regular FRHighs"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textRegular.extraPrice
                        currentSelectedSide += "<br>" + textRegular.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textCrunchy
                    property var extraPrice: 3
                    anchors.centerIn: parent
                    text: "SlowBurn Slaw"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textCrunchy.extraPrice
                        currentSelectedSide += "<br>" + textCrunchy.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textColeslaw
                    property var extraPrice: 2
                    anchors.centerIn: parent
                    text: "Doobie Roll"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textColeslaw.extraPrice
                        currentSelectedSide += "<br>" + textColeslaw.text
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height/11
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gainsboro"
                radius: 20
                Text{
                    id: textChocolateMouse
                    property var extraPrice: 4
                    anchors.centerIn: parent
                    text: "Choco-Munchie Mousse"
                    font.pointSize: 12
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice += textChocolateMouse.extraPrice
                        currentSelectedSide += "<br>" + textChocolateMouse.text
                    }
                }
            }
        }
        Rectangle{
            id: doneModifySide
            width: parent.width/5
            height: parent.height/10
            color: "yellowgreen"
            radius: 10
            anchors{
                bottom: parent.bottom
                right: parent.right
            }
            anchors.bottomMargin: parent.width/12
            anchors.rightMargin: parent.width/12
            Text{
                anchors.centerIn: parent
                text: "Done"
                font.pointSize: 22
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    inModifySide = false
                }
            }
        }
    }
}