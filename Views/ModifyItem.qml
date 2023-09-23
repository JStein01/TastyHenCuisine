import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: menuModify
    radius: 10
    color: "grey"
    opacity: 0.9
    Rectangle{
        id: listModifyHodler
        color: "transparent"
        anchors.fill: parent
        anchors.topMargin: parent.height * 0.05/2
        Rectangle{
            id: currentItemHolder
            width: parent.width * 0.8
            height: parent.height* 0.08
            radius: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            Text{
                anchors.centerIn : parent
                text: currentItemName
                font.pointSize: 20
            }
        }
        Rectangle{
            id: recipeHolder
            width: parent.width * 0.8
            height: parent.height/3
            color: "transparent"
            radius: 20
            anchors{
                top: currentItemHolder.bottom
                topMargin: 5
            }
            anchors.horizontalCenter: parent.horizontalCenter
            Text{
                id: recipeTextHolder
                anchors.left: parent.left
                anchors.leftMargin: 10
                text: "Recipe:" 
                font.pointSize: 20
            }
            Rectangle{
                id: recipeItemHolder
                width: parent.width * 0.75
                radius: 20
                clip: true
                anchors{
                    top: recipeTextHolder.bottom
                    bottom: parent.bottom
                    topMargin: 5
                    left: parent.left
                }
                Text{
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: 20
                    text: currentSelectedRecipe
                    font.pointSize: 15
                }
            }
            Rectangle{
                id: recipeExtraHolder
                width: parent.width * 0.25
                height: parent.height
                color: "transparent"
                anchors{
                    top: recipeTextHolder.bottom
                    left: recipeItemHolder.right
                }

                Rectangle{
                    width: parent.width * 0.8
                    height: parent.height /3
                    anchors.centerIn: parent
                    color: "olivedrab"
                    Text{
                        anchors.centerIn: parent
                        text: "Modify"
                        color: "white"
                        font.bold: true
                        font.pointSize: 15
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            inExtra = true
                        }
                    }
                }
            }
        }
        
        Rectangle{
            id: currentSideHolder
            width: parent.width * 0.8
            height: parent.height* 0.08
            radius: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: recipeHolder.bottom
            anchors.topMargin: 10
            Text{
                anchors.centerIn : parent
                text: "Side"
                font.pointSize: 20
            }
        }
        Rectangle{
            id: sideTextHolder
            width: parent.width * 0.8 * 0.75
            height: parent.height* 0.2
            anchors.top: currentSideHolder.bottom
            anchors.topMargin: 5
            anchors.left: currentSideHolder.left
            
            radius: 20
            Text{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 20
                text: currentSelectedSide
                font.pointSize: 15
            }
        }
        Rectangle{
            id: modifySideHolder
            width: parent.width * 0.8 *0.25
            height: parent.height* 0.1
            color: "transparent"
            anchors{
                top: currentSideHolder.bottom
                left: sideTextHolder.right
            }

            Rectangle{
                id: modifySide
                width: parent.width * 0.8
                height: parent.height /2
                anchors.centerIn: parent
                color: "olivedrab"
                Text{
                    anchors.centerIn: parent
                    text: "Modify"
                    color: "white"
                    font.bold: true
                    font.pointSize: 15
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        inModifySide = true
                    }
                }
            }

            Rectangle{
                width: parent.width * 0.8
                height: parent.height /2
                anchors.top: modifySide.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                color: "indianred"
                Text{
                    anchors.centerIn: parent
                    text: "Clear"
                    color: "white"
                    font.bold: true
                    font.pointSize: 15
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        currentSelectedSide = ""
                    }
                }
            }
        }
        Rectangle{
            id: currentDrinkHolder
            width: parent.width * 0.8
            height: parent.height* 0.08
            radius: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: sideTextHolder.bottom
            anchors.topMargin: 10
            Text{
                anchors.centerIn : parent
                text: "Drink"
                font.pointSize: 20
            }
            Rectangle{
                id: drinkTextHolder
                height: parent.height
                width: parent.width * 0.75
                anchors.top: parent.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                
                radius: 20
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text: currentSelectedDrink
                    font.pointSize: 20
                }
            }
            Rectangle{
                id: modifyDrinkHolder
                width: parent.width * 0.25
                height: parent.height
                color: "transparent"
                anchors{
                    top: parent.bottom
                    left: drinkTextHolder.right
                }

                Rectangle{
                    width: parent.width * 0.8
                    height: parent.height /2
                    anchors.centerIn: parent
                    color: "olivedrab"
                    Text{
                        anchors.centerIn: parent
                        text: "Modify"
                        color: "white"
                        font.bold: true
                        font.pointSize: 15
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            inModifyDrink = true
                        }
                    }
                }
            }
        }
        Rectangle{
            id: applyHolder
            width: parent.width
            height: parent.height* 0.05
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            color: "transparent"
            Rectangle{
                id: buttonApply
                width: parent.width/3
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 20
                color: "indianred"
                Text{
                    id: textApply
                    anchors.centerIn: parent
                    text: "Apply"
                    color: "white"
                    font.bold: true
                    font.pointSize: 20
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        menuItem.setProperty(currentOrderIndex, "drink", currentSelectedDrink )
                        menuItem.setProperty(currentOrderIndex, "side", currentSelectedSide )
                        menuItem.setProperty(currentOrderIndex, "recipe", currentSelectedRecipe )
                    }
                }
            }
        }
    }
}