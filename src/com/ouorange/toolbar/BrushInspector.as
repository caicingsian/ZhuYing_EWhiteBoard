package com.ouorange.toolbar 
{
	import com.ouorange.toolbar.measuretool.PenProp;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class BrushInspector extends Sprite
	{		
		private var _asset:MovieClip;
		
		//目前操作的筆
		private var _holderPen:Pen;
		
		private var _colorPicker:ColorPicker;
		
		private var _closeButton:MovieClip;
		
		//畫筆屬性調整
		public function BrushInspector( asset:MovieClip ) 
		{
			_asset = asset;
			addChild( _asset );
			InitInspector();
		}
		
		private function InitInspector():void 
		{
			_colorPicker = new ColorPicker(_asset["__ColorPicker"]);
			
			_colorPicker.addEventListener( ColorPicker.COLOR_CHANGE , OnColorChange );
			
			_closeButton = _asset["__CloseButton"];
			_closeButton.buttonMode = true;
			_closeButton.addEventListener( MouseEvent.CLICK , onCloseClick );
		}
		
		private function OnColorChange(e:Event):void 
		{
			RefreshBrushStyle();
		}
		
		private function RefreshBrushStyle():void
		{
			if ( _holderPen )
			{	
				var prop:PenProp = _holderPen.penProp;
				//顏色
				prop.color = _colorPicker.curtColor;
				//粗細
				
				//透度度
				
				_holderPen.UpdateBrushStyle(prop);
			}
		}
		
		private function onCloseClick(e:MouseEvent):void 
		{
			CloseInspector();
		}
		
		public function UpdateBrush( pen:Pen ):void
		{
			_holderPen = pen;
			//依據畫筆的屬性更新面版
			var penProp:PenProp = _holderPen.penProp;
			_colorPicker.curtColor = penProp.color;
		}
		
		public function ShowInspector():void
		{
			_asset.visible = true;
		}
		
		public function CloseInspector():void
		{
			_asset.visible = false;
		}
	}
}