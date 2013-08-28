/**
 * BossClick.as
 * @author Christopher Long at The Banner Boss - @clong
 * @description Creates and adds an invisible hitArea over the entirety
 *				of the banner.  It also filters a basic clickTAG request
 *				sent from a web browser into the banner swf file.
 *				Finally, there is a method to add a border
 *				around the edge of the banner which is required by
 *				most websites that host ads.
 */
package com.thebannerboss.utils{
	
	import flash.events.MouseEvent;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.external.ExternalInterface;
	
	public class BossClick extends Sprite{
		
		private var url:String;
		private var hitAreaWidth:uint;
		private var hitAreaHeight:uint;
		
		public function BossClick(loaderInfo:Object,stage:Stage) {
			
			//Invisible hit area
			hitAreaWidth = stage.stageWidth;
			hitAreaHeight = stage.stageHeight;
			this.graphics.beginFill(0xFF0000, 0);
			this.graphics.drawRect( 0, 0, hitAreaWidth, hitAreaHeight );
			this.graphics.endFill();
			
			//Check for various iterations of clickTAG
			if(loaderInfo.parameters.clicktag != null) {
				url = loaderInfo.parameters.clicktag;
			} else if(loaderInfo.parameters.clickTag != null) {
				url = loaderInfo.parameters.clickTag;
			}else if(loaderInfo.parameters.clickTag1 != null) {
				url = loaderInfo.parameters.clickTag1;
			}else if(loaderInfo.parameters.clickTAG != null) {
				url = loaderInfo.parameters.clickTAG;
			}
			
			//Add Click event listener to trigger actions when the banner is clicked on
			addEventListener(MouseEvent.CLICK, clickHandler);
			buttonMode = true;
		
		}
		
		//CLICKTAG MANNIPULATION BEGIN ---!!!!!!
		private function clickHandler(e:MouseEvent):void {
			if (! url) {
				trace("BossClick ACTIVATED");
			}else{
				openWindow( url );
			}
		}
		
		private function getBrowserName():String {
			var browser:String;
			//Uses external interface to reach out to browser and grab browser useragent info.
			var browserAgent:String = ExternalInterface.call("function getBrowser(){return navigator.userAgent;}");
			//Determines brand of browser using a find index. If not found indexOf returns (-1).
			if (browserAgent != null && browserAgent.indexOf("Firefox")>= 0) {
				browser = "Firefox";
			} else if (browserAgent != null && browserAgent.indexOf("Safari")>= 0) {
				browser = "Safari";
			} else if (browserAgent != null && browserAgent.indexOf("MSIE")>= 0) {
				browser = "IE";
			} else if (browserAgent != null && browserAgent.indexOf("Opera")>= 0) {
				browser = "Opera";
			} else {
				browser = "Undefined";
			}
			return (browser);
		}
		
		//Try to avoid pop-blockers by using ExternalInterface call to load url
		private function openWindow(url:String, target:String = '_blank', features:String=""):void {
			var WINDOW_OPEN_FUNCTION:String = "window.open";
			var myURL:URLRequest = new URLRequest(url);
			var browserName:String = getBrowserName();
			switch (browserName) {
					//If browser is Firefox, use ExternalInterface to call out to browser
					//and launch window via browser's window.open method.
				case "Firefox" :
					ExternalInterface.call(WINDOW_OPEN_FUNCTION, url, target, features);
					break;
					//If IE,
				case "IE" :
					ExternalInterface.call("function setWMWindow() {window.open('" + url + "', '"+target+"', '"+features+"');}");
					break;
					// If Safari or Opera or any other;
				case "Safari" :
					navigateToURL(myURL, target);
					break;
				case "Opera" :
					navigateToURL(myURL, target);
					break;
				default :
					navigateToURL(myURL, target);
					break;
			}
		}
		//CLICKTAG MANNIPULATION END ---!!!!!!
		
		//border - if no properties are set on method call, give the banner a black border that is 2 pxls thick
		public function addBorder(borderThickness:uint=2,borderColor:uint=0x000000):void{
			
			//rect visual properties
			var borderRectHeight:uint = hitAreaHeight; 
			var borderRectWidth:uint = hitAreaWidth; 
			var borderRect:Shape = new Shape();
			borderRect.graphics.lineStyle(borderThickness, borderColor, 1);
			 
			// rect starting at point 0, 0
			borderRect.graphics.moveTo(0, 0);
			borderRect.graphics.lineTo(borderRectWidth - 1, 0); 
			borderRect.graphics.lineTo(borderRectWidth - 1, borderRectHeight - 1);
			borderRect.graphics.lineTo(0, borderRectHeight - 1);
			borderRect.graphics.lineTo(0, 0); 
			addChild(borderRect);
		}

	}
	
}
