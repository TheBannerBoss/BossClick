BossClick
=========

Standard banner advertisement clickTag button generator and border creator. Actionscript 3.

Usage
---------

Import the BossClick class into your Flash(.fla) file.
```ActionScript
import com.thebannerboss.utils.BossClick;
```
Instantiate an instance of the BossClick class. *loaderInfo* and *stage* are part of the *flash.display* package.
So, if you instantiate BossClick from within an .fla file, the *loaderInfo* and *stage* classes are naturally
inherited and available to pass into the BossClick class.
```ActionScript
var bossClick = new BossClick(loaderInfo,stage);
```
Add the instantiated BossClick object to the display list so it will appear on screen.
```ActionScript
addChild(bossClick);
```
To add an invisible button which covers the entire ad and links out to a URL set by an external clickTag, call
the *addClickTagBtn* method.
```ActionScript
bossClick.addClickTagBtn();
```

Finally, if a border is desired, call the *addBorder* method and pass in the desired parameters. The first parameter
is the thickness of the border in pixels.  The second parameter is the Hex Code for the border color.  If no parameters are
passed in, a two pixel, black border will be added.
```ActionScript
bossClick.addBorder(3,0x0000FF);
```
Here is a complete code block showing how to use BossClick.
```ActionScript
import com.thebannerboss.utils.BossClick;

var bossClick = new BossClick(loaderInfo,stage);
addChild(bossClick);
bossClick.addClickTagBtn();
bossClick.addBorder(3,0x0000FF);
```

Notes on clickTag Filtering
---------
What is a clickTag?  A [clickTag](http://en.wikipedia.org/wiki/Clicktag) is a commonly used method of passing in a URL from an HTML page into a .swf file that resides
on that HTML page.  This approach allows the website which hosts the banner to set the destination of the banner's click-through
without having to actually change any of the code in the banner ad.

While using the Flash Player's native method to open links in browsers works most of the time when using the industry standard
clickTag approach, it occasionally fails when certain browsers mistake the action as a call to open a pop-up window.  To account for this possibility,
BossClick checks to see what browser the ad banner is in.  If the ad is in a potentially troublesome browser, BossClick will use
[ExternalInterface](http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/external/ExternalInterface.html) to open the URL set by the clickTag.


