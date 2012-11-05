package skins
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	
	import spark.components.supportClasses.StyleableTextField;
	import spark.skins.mobile.supportClasses.ButtonSkinBase;
	
	use namespace mx_internal;
	
	public class ImageButtonSkin extends ButtonSkinBase
	{
		
		[Embed(source = "assets/backspace.png")]
		public var upCls:Class;
		[Embed(source = "assets/backspace.png")]
		public var downCls:Class;
		//
		public var labelDisplayShadow:StyleableTextField;
		
		//
		public function ImageButtonSkin()
		{
			super();
			//
			layoutGap = 5;
			layoutPaddingLeft = 10;
			layoutPaddingRight = 10;
			layoutPaddingTop = 10;
			layoutPaddingBottom = 10;
			layoutBorderSize = 1;
			measuredDefaultWidth = 150;
			measuredDefaultHeight = 50;
			
		}
		
		//
		override protected function createChildren():void
		{
			super.createChildren();
			//
			if (!labelDisplayShadow && labelDisplay)
			{
				labelDisplayShadow = StyleableTextField(createInFontContext(StyleableTextField));
				labelDisplayShadow.styleName = this;
				labelDisplayShadow.colorName = "textShadowColor";
				labelDisplayShadow.useTightTextBounds = false;
				// add shadow before display
				addChildAt(labelDisplayShadow, getChildIndex(labelDisplay));
			}
			setStyle("textAlign", "center");
		}
		
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			//
			labelDisplayShadow.alpha = getStyle("textShadowAlpha");
			labelDisplayShadow.commitStyles();
			//
			setElementPosition(labelDisplayShadow, labelDisplay.x, labelDisplay.y + 1);
			setElementSize(labelDisplayShadow, labelDisplay.width, labelDisplay.height);
			//
			if (labelDisplay.isTruncated)
				labelDisplayShadow.text = labelDisplay.text;
			//
			
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			var source:* = (new (getBgClassForCurrentState()))
			var bounds:Rectangle = DisplayObject(source).getBounds(DisplayObject(source));
			graphics.clear();
			graphics.beginBitmapFill(source.bitmapData);
			graphics.drawRect(0, 0, bounds.width, bounds.height);
			graphics.endFill();
		}
		
		private function getBgClassForCurrentState():Class
		{
			if (currentState == "down")
				return downCls;
			else
				return upCls;
		}
		
		override protected function labelDisplay_valueCommitHandler(event:FlexEvent):void
		{
			super.labelDisplay_valueCommitHandler(event);
			labelDisplayShadow.text = labelDisplay.text;
		}
		
		override protected function commitCurrentState():void
		{
			super.commitCurrentState();
			invalidateDisplayList();
		}
	}
}