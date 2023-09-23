import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: menuDetail
    radius: 10
    color: "grey"
    opacity: 0.9
    Rectangle{
        id: listDetailHodler
        color: "transparent"
        anchors.fill: parent
        anchors.topMargin: parent.height * 0.05
        anchors.bottomMargin: parent.height * 0.05

        clip: true
        Component {
            id: menuDetailDelegate
            Item {
                id: itemDetail
                width: menuDetail.width; height: menuDetail.height/8
                property var recipe: detailRecipe
                property var side: detailSide
                property var drink: detailDrink
                Rectangle{
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    color: "gainsboro"
                    radius: 20
                    clip: true
                    border.color: "grey"
                    Column{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: parent.width/10
                        anchors.rightMargin: parent.width/10
                        Text { 
                            id: detailNameText
                            text: detailName 
                            font.pointSize: 16
                        }
                        Text { 
                            id: detailPriceText
                            property var priceInt
                            text: 'Price: ' + detailPrice + ' AUD'
                            font.pointSize: 12
                            font.bold: true
                            priceInt: detailPrice
                            }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            parent.color= "yellowgreen"
                            parent.opacity = 0.5
                            }
                        onReleased:{
                            parent.color= "gainsboro"
                            parent.opacity = 1
                        }
                        onClicked:{
                            listViewDetail.currentIndex = index
                            menuItem.append({"name": detailNameText.text, "price": detailPriceText.priceInt, "recipe": itemDetail.recipe, "side": itemDetail.side, "drink": itemDetail.drink})
                            totalPrice += detailPriceText.priceInt
                        }
                    }
                }
            }
        } 
        ListView {
            id: listViewDetail
            anchors.fill: parent
            model: menuDetailList
            delegate: menuDetailDelegate
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            focus: true
            ScrollBar.vertical: ScrollBar {}
        } 
    }
}