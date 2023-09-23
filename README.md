# TastyHenCuisine
**School Project for Software Design and Development Course**  
The task was to create a Fast Food POS System for a franchise of our choosing, so I made up "Tasty Hen Cuisine", or "THC" for short - a parody of KFC!
## Installation and Usage
You need to install Python 3 and PySide6 to run this program.  
Default PIN is 0000. To edit menu items simply open the relevant text file in *TastyHenCuisine/Views/Menus* 

**Format:** Name of Item, 0, Main Item, SIDE, <Sides here, as many as you like separated by comma+space>, DRINK, Default Drink  
Where *0* is the price of the item.  
All fields except for *Name of Item* and *Price* are optional!  

**Example:** THC Tenders Box, 12, 3 THC Tenders, SIDE, Pot&GGravy, PotCorn Buds, Regular FRHighs, DRINK, Pepsi Max  
For more examples, some items are already included in the provided text files!  

Unfortunately, I ran out of time for a settings menu, so to change some settings such as the PIN (Default 0000), you will need to edit the QML files directly :(  
This also applies for the sides when you press the *Modify* button (NOT the standalone sides). You will see what I mean when you play around with the app!
