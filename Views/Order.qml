import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: order
    radius: 10
    color: "grey"
    opacity: 0.9  
    Rectangle{
        id: listHodler
        width: 0.8 * parent.width
        height: 0.6 * parent.height
        anchors{
            top: parent.top
        }
        anchors.topMargin: parent.width/10
        anchors.horizontalCenter: parent.horizontalCenter 
        Component {
            id: menuDelegate
            Item {
                id: orderItem
                width: parent.width
                height: 40
                property var finalPrice: price
                property var itemName: name
                property var currentItemRecipe: recipe
                property var currentItemSide: side
                property var currentItemDrink: drink

                Column{
                    Text { 
                        text: '<b>Order:</b> ' + itemName 
                        }
                    Text { 
                        text: '<b>Price:</b> ' + finalPrice 
                        }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        listViewOrder.currentIndex = index
                        currentOrderIndex = index
                        currentItemName = listViewOrder.itemAtIndex(listViewOrder.currentIndex).itemName
                        currentSelectedRecipe = currentItemRecipe
                        currentSelectedSide = currentItemSide
                        currentSelectedDrink = currentItemDrink
                    }
                }
                ListView.onAdd:{
                    listViewOrder.incrementCurrentIndex()
                    currentItemName = listViewOrder.itemAtIndex(listViewOrder.currentIndex).itemName
                    currentSelectedRecipe = currentItemRecipe
                        currentSelectedSide = currentItemSide
                        currentSelectedDrink = currentItemDrink
                }
            }
        } 
        ListView {
            id: listViewOrder
            anchors.fill: parent
            anchors.margins: parent.width/10
            model: menuItem
            delegate: menuDelegate
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            focus: true
            highlight: Rectangle { color: "yellowgreen"; radius: 5; opacity: 0.9 }
            ScrollBar.vertical: ScrollBar {}
        } 
    }

    Rectangle{
        id: subTotalHolder
        width: parent.width
        height: parent.height / 20
        color: "transparent"
        anchors{
            top: listHodler.bottom
            left: parent.left
        }
        anchors.topMargin : parent.height / 30
        Rectangle{
            id: subTotalValueHolder
            width: parent.width /2.5
            height: parent.height * 0.8
            anchors.right: parent.right
            anchors.rightMargin : parent.width/10
            anchors.verticalCenter: parent.verticalCenter
            Text{
                anchors.centerIn: parent
                font.pointSize: 22
                text: totalPrice.toFixed(2)
            }
        }
        Rectangle{
            id: subTotalText
            height: parent.height
            color: "transparent"
            anchors.right: subTotalValueHolder.left
            anchors.left : parent.left
            anchors.verticalCenter: parent.verticalCenter
            Text{
                anchors.right: parent.right
                anchors.rightMargin: parent.width/20
                text: "Subtotal: "
                font.pointSize: 18
            }
        }
    }
    Rectangle{
        id: totalHolder
        width: parent.width
        height: parent.height / 20
        color: "transparent"
        anchors{
            top: subTotalHolder.bottom
            left: parent.left
        }
        anchors.topMargin : parent.height / 60
        Rectangle{
            id: totalValueHolder
            width: parent.width /2.5
            height: parent.height * 0.8
            anchors.right: parent.right
            anchors.rightMargin : parent.width/10
            anchors.verticalCenter: parent.verticalCenter
            Text{
                anchors.centerIn: parent
                font.pointSize: 24
                font.bold: true
                text: (totalPrice * 1.1).toFixed(2)
            }
        }
        Rectangle{
            id: totalText
            height: parent.height
            color: "transparent"
            anchors.right: totalValueHolder.left
            anchors.left : parent.left
            anchors.verticalCenter: parent.verticalCenter
            Text{
                anchors.right: parent.right
                anchors.rightMargin: parent.width/20
                text: "Total: " 
                font.pointSize: 18
            }
        }
    }
    Rectangle{
        id: orderIconHolder
        width: parent.width
        height: parent.height/10
        color:"transparent"
        anchors{
            bottom: parent.bottom
            left: parent.left
        }
        anchors.bottomMargin: parent.height/20
        Row{
            anchors.fill: parent
            anchors.margins: parent.width/20
            Rectangle{
                id: cancelIconHolder
                width:orderIconHolder.height
                height: orderIconHolder.height
                color:"transparent"
                Image{
                    anchors.fill: parent
                    source: "lib/delete.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        menuItem.clear()
                        totalPrice = 0
                    }
                }
            }
            Rectangle{
                id: trashIconHolder
                width:orderIconHolder.height
                height: orderIconHolder.height
                color:"transparent"
                Image{
                    anchors.fill: parent
                    source: "lib/trash.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        totalPrice = totalPrice - listViewOrder.itemAtIndex(listViewOrder.currentIndex).finalPrice
                        menuItem.remove(listViewOrder.currentIndex, 1)
                    }
                }
            }
            Rectangle{
                id: cashIconHolder
                width:orderIconHolder.height
                height: orderIconHolder.height
                color:"transparent"
                Image{
                    anchors.fill: parent
                    source: "lib/cash.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        inPayingByCash = true
                    }
                }
            }
            
            Rectangle{
                id: cardIconHolder
                width:orderIconHolder.height
                height: orderIconHolder.height
                color:"transparent"
                Image{
                    anchors.fill: parent
                    source: "lib/card.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        inPayingByCard = true
                    }
                }
            }
        }
    }
}