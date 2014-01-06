package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.BrushPot;
	import com.ouorange.toolbar.measuretool.PenProp;
	import com.ouorange.toolbar.Pen;
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class HighLightToolButton extends ToolButton
	{
		//色彩挑選
		private var _colorPicker:ToolColorPicker;
		
		private var _burshSize:ToolBrushSize;
		
		private var _pen:Pen;
		
		private var _sizeMutilply:Number = 5;
		
		private var _drawType:String;
		
		public function HighLightToolButton( asset:MovieClip ) 
		{	
			super( asset );
			var tmp:MovieClip;
			tmp = _asset["panel"]["panel"];
			
			this.name = ToolBarButtonControl.TOOL_HIGHLIGHT
			_pen = BrushPot.Instance.GetPen( BrushPot.HIGHLIGHTER );
			
			tmp["__DrawFreeButton"].addEventListener( MouseEvent.MOUSE_DOWN , OnDrawFreeHandler );
			tmp["__DrawLineButton"].addEventListener( MouseEvent.MOUSE_DOWN , OnDrawLineHandler );
			
			_colorPicker = new ToolColorPicker(tmp);
			_burshSize = new ToolBrushSize(tmp["__BrushSize"]);
			
			_colorPicker.addEventListener( ToolColorPicker.COLOR_UPDATE , OnColorChange );
			_burshSize.addEventListener( ToolBrushSize.SIZE_UPDATE , OnSizeChange );
			
			ApplyBrushSizeColor();
			UpdateBrushProp();
			
		}
		
		//設定為畫線
		private function OnDrawLineHandler(e:MouseEvent):void 
		{
			_drawType = PenProp.DRAW_LINE;
			UpdateBrushProp();
		}
		
		//設定為自由畫
		private function OnDrawFreeHandler(e:MouseEvent):void 
		{
			_drawType = PenProp.DRAW_FREE;
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
			prop.size = _burshSize.curtSize * _sizeMutilply;
			prop.drawType = _drawType;
			_pen.UpdateBrushStyle( prop );
		}
	}
}