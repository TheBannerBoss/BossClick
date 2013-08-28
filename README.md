BossClick
=========

Actionscript 3. Standard, ad-banner clickTag button generator and border creator

Usage
---------

Import the BossClick class into your Flash(.fla) file.
```actionscript
import com.thebannerboss.utils.BossClick;
```
Instantiate an instance of the BossClick class. *loaderInfo* and *stage* are part of the *flash.display* package.
So, if you instantiate BossClick from within an .fla file, the *loaderInfo* and *stage* classes are naturally
inherited and available to pass into the BossClick class.
```actionscript
var bossClick = new BossClick(loaderInfo,stage);
```
Add the instantiated BossClick object to the display list so it will appear on screen.
```ActionScript
addChild(bossClick);
```
Finally, if a border is desired, call the *addBorder* method and pass in the desired parameters. The first parameter
is the thickness of the border in pixels.  The second parameter is the Hex Code for the border color.  If no parameters are
passed in, a two pixel, black border will be added.
```actionscript
bossClick.addBorder(3,0x0000FF);
```
Here is a complete code block showing how to use BossClick.
```actionscript
import com.thebannerboss.utils.BossClick;

var bossClick = new BossClick(loaderInfo,stage);
addChild(bossClick);
bossClick.addBorder(3,0x0000FF);
```


