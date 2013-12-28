package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.BrushPot;
	import com.ouorange.toolbar.measuretool.PenProp;
	import com.ouorange.toolbar.Pen;
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class EraseToolButton extends ToolButton 
	{
		private var _burshSize:ToolBrushSize;
		
		private var _pen:Pen;
		
		public function EraseToolButton(asset:MovieClip) 
		{
			super( asset );
			this.name = ToolBarButtonControl.TOOL_ERASE
			_pen = BrushPot.Instance.GetPen( BrushPot.ERASER );
			_burshSize = new ToolBrushSize(_asset["panel"]["panel"]["__BrushSize"]);
			_burshSize.addEventListener( ToolBrushSize.SIZE_UPDATE , OnSizeChange );
			UpdateBrushProp();
		}
		
		private function OnSizeChange(e:Event):void
		{
			UpdateBrushProp();
		}
		
		private function UpdateBrushProp():void
		{
			var prop:PenProp = _pen.penProp;
			prop.size = _burshSize.curtSize;
			_pen.UpdateBrushStyle( prop );
		}
		
	}

}