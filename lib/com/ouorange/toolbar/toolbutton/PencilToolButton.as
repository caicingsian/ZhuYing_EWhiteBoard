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
	public class PencilToolButton extends ToolButton 
	{
		//色彩挑選
		private var _colorPicker:ToolColorPicker;
		
		private var _burshSize:ToolBrushSize;
		
		private var _pen:Pen;
		
		public function PencilToolButton(asset:MovieClip) 
		{
			super(asset);
			this.name = ToolBarButtonControl.TOOL_PENCIL;
			_pen = BrushPot.Instance.GetPen( BrushPot.PENCIL );
			_colorPicker = new ToolColorPicker(_asset["panel"]["panel"]);
			_burshSize = new ToolBrushSize(_asset["panel"]["panel"]["__BrushSize"]);
			_colorPicker.addEventListener( ToolColorPicker.COLOR_UPDATE , OnColorChange );
			_burshSize.addEventListener( ToolBrushSize.SIZE_UPDATE , OnSizeChange );
			ApplyBrushSizeColor();
			UpdateBrushProp();
		}
		
		private function ApplyBrushSizeColor():void
		{
			_burshSize.SetBrushColor( _colorPicker.curtColor );
		}
		
		private function OnSizeChange(e:Event):void
		{
			UpdateBrushProp();
		}
		
		private function OnColorChange(e:Event):void 
		{
			UpdateBrushProp();
			ApplyBrushSizeColor();
		}
		
		private function UpdateBrushProp():void
		{
			var prop:PenProp = _pen.penProp;
			prop.color = _colorPicker.curtColor;
			prop.size = _burshSize.curtSize;
			_pen.UpdateBrushStyle( prop );
		}
	}
}