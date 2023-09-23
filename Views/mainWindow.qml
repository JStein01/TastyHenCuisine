import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.15
import QtCore
import io.qt.textproperties 1.0


ApplicationWindow {
    visible: true
    title: "Tasty Hen Cuisine"
    flags: Qt.FramelessWindowHint
    visibility: Window.Maximized
// --------------QML Variables -------------------------------
    property var inLogin: true
    property var pin: ""
    property var thePin: "0000"
    property var topBandText: "Please Log In"
    property var screenWidth: Screen.width
    property var screenHeight: Screen.height
    property var currentDetail: "Nothing"
    property var totalPrice: 0
    property var inPayingByCash: false
    property var currentOrderIndex: 0
    property var inPayingByCard: false
    property var currentItemName: ""
    property var currentSelectedRecipe : ""
    property var inExtra: false
    property var currentSelectedSide: ""
    property var inModifySide: false
    property var currentSelectedDrink: ""
    property var inModifyDrink: false
// ------------------------ Menu Lists---------------------------------    	
    ListModel {
        id:menuItem
    }
    ListModel{
        id: menuDetailList
    }
//------------------------------------------------------------------
    Backend{
        id: backend
    }
    Rectangle{
        id: mainRectangle
        anchors.fill: parent
        TopBand{
            id: topBand
        }
        LogInView{
            id: loginView
            visible: inLogin
            anchors{
                top: topBand.bottom
                left:parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }
        ShopView{
            id:shopView
            visible: !inLogin
            anchors{
                top: topBand.bottom
                left:parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }
    }

}