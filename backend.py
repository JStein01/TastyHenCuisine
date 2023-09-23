
import sys
from pathlib import Path
import os

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtQuickControls2 import QQuickStyle

QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
class Backend(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.access = self.processLogin()
        self.logedInUser= ""

    @Slot(str, result=bool)
    def processPin(self, pin):
        for user in self.access:
            if pin == "":
                return False
            if pin == user[1]:
                self.logedInUser = user[0]
                return True
            
    @Slot(result=str)
    def getCurrentUser(self):
        return self.logedInUser
    
    @Slot(str, result=int)
    def getLength(self, menu):
        try:
            file = f"Views/Menus/Menu{menu}.txt"
            with open(file, 'r') as fp:
                x = len(fp.readlines())
                return x
        except Exception as e:
            print(f"A problem occurred: {e}" )
    
    @Slot(str, int, result=str)
    def getName(self, menu, line):
        return self.getMenu(menu, line)[0][0]
    
    @Slot(str, int, result=float)
    def getPrice(self, menu, line):
        return self.getMenu(menu, line)[0][1]

    @Slot(str, int, result=str)
    def getRecipe(self, menu, line):
        return self.getMenu(menu, line)[1]

    @Slot(str, int, result=str)
    def getSide(self, menu, line):
        return self.getMenu(menu, line)[2]
    
    @Slot(str, int, result=str)
    def getDrink(self, menu, line):
        return self.getMenu(menu, line)[3]

    def getMenu(self, menu, line):
        try:
            file = f"Views/Menus/Menu{menu}.txt"
            with open(file, 'r') as fp:
                x = fp.readlines()[line]
                info = x.strip().split(', ')
                isCombo = "SIDE" in info
                Side = ""
                drink = ""
                if isCombo:
                    endRecipe = info.index("SIDE")
                    endSide = info.index("DRINK")
                    recipe = ';'.join(info[2:endRecipe]).replace(';', "<br>")
                    Side = ';'.join(info[endRecipe+1:endSide]).replace(';', "<br>")
                    drink = ' '.join(info[endSide+1:])
                else: 
                    recipe = ' '.join(info[2:]).replace(' ', "<br>")
                ItemAndPrice = (info[0], float(info[1].strip()))
                return ItemAndPrice, recipe, Side, drink
        except Exception as e:
            print(f"A problem occurred: {e}" )

    def processLogin(self):
        access = []
        try:
            file = f"Views/lib/Login.txt"
            with open(file, 'r') as fp:
                for line in fp:
                    x = line.strip().split(',')
                    access += [[x[0], x[1].strip()]]
            #print(access)
            return access
        except Exception as e:
            print(f"A problem occurred: {e}" )
