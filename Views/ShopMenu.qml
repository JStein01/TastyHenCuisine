import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

    
Rectangle{
    id: shopMenu
    radius: 10
    color: "grey"
    opacity: 0.9  

    property var itemWidth : 4 * screenWidth/8 /5
    property var itemHeight : 0.4 * screenHeight /7
    ColumnLayout {
        id: menuLayout
        anchors.centerIn : shopMenu
        anchors.fill: shopMenu
        Rectangle{
            id: menuMain
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            Text{
                anchors.centerIn: parent
                text: "Main"
                font.pointSize: 18
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "Main"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i), 
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)})
                        i++
                    }
                }
            }
        }
        Rectangle{
            id: menuBoxMeal
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            Text{
                anchors.centerIn: parent
                text: "Box Meal"
                font.pointSize: 18
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "BoxMeal"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i), 
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)})
                        i++
                    }
                }
            }
        }
        Rectangle{
            id: menuCombo
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            Text{
                anchors.centerIn: parent
                text: "Combo"
                font.pointSize: 18
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "Combo"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i), 
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)})
                        i++
                    }
                }
            }
        }
        
        Rectangle{
            id: menuShared
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            Text{
                anchors.centerIn: parent
                text: "Shared"
                font.pointSize: 18
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "Shared"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i),  
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)})
                        i++
                    }
                }
            }
        }
        Rectangle{
            id: menuSide
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            Text{
                anchors.centerIn: parent
                text: "Side"
                font.pointSize: 18
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "Side"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i), 
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)
                        })
                        i++
                    }
                }
            }
        }
        Rectangle{
            id: menuDrink
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            Text{
                anchors.centerIn: parent
                text: "Drink"
                font.pointSize: 18
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "Drink"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i),  
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)})
                        i++
                    }
                }
            }
        }
        Rectangle{
            id: menuSnack
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            Text{
                anchors.centerIn: parent
                text: "Snack"
                font.pointSize: 18
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "Snack"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i),  
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)})
                        i++
                    }
                }
            }
        }
        Rectangle{
            id: menuSauce
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            Text{
                anchors.centerIn: parent
                text: "Sauce"
                font.pointSize: 18
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "Sauce"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i),  
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)})
                        i++
                    }
                }
            }
        }
        Rectangle{
            id: menuCannabis
            width: itemWidth
            height: itemHeight
            Layout.alignment: Qt.AlignHCenter
            radius: 10
            color: "olivedrab"
            Text{
                anchors.centerIn: parent
                text: "Cannabis"
                font.pointSize: 18
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                property var length
                onClicked:{
                    currentDetail = "Cannabis"
                    menuDetailList.clear()
                    length = backend.getLength(currentDetail)
                    var i = 0
                    while (i < length ) {
                        menuDetailList.append({"detailName": backend.getName(currentDetail, i), 
                            "detailPrice":backend.getPrice(currentDetail, i), 
                            "detailRecipe": backend.getRecipe(currentDetail, i),  
                            "detailSide": backend.getSide(currentDetail, i), 
                            "detailDrink": backend.getDrink(currentDetail, i)})
                            i++
                    }
                }
            }
        }
    }
}


