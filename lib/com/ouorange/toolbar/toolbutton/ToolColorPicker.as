package com.ouorange.toolbar.toolbutton 
{
	import com.greensock.TweenMax;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ToolColorPicker extends EventDispatcher
	{
		public static const COLOR_UPDATE:String = "COLOR_UPDATE";
		
		private var _asset:MovieClip;
		
		private var _colorDisk:MovieClip;
		
		private var _colorConfig:Array;
		
		private var _curtColor:uint;
		
		public function ToolColorPicker( asset:MovieClip ) 
		{
			_colorConfig = [
				0x000000,
				0xFF0000, 
				0xF39800,
				0xFAEE00,
				0x8FC31F,
				0x2EA7E0,
				0x00A29A,
				0x1F50B2,
				0x7E318E,
				0xFFFFFF
			];
			
			this._asset = asset;
			
			_colorDisk = _asset["pcmc"];
			
			var b:MovieClip;
			for ( var i:int = 1 ; i <= _colorConfig.length ; i++ )
			{
				b = _asset["color" + i];
				if ( b )
				{
					b.buttonMode = true;
					b.addEventListener( MouseEvent.CLICK , OnMouseDown );
				}
			}
		}	
		
		private function OnMouseDown(e:MouseEvent):void 
		{
			var b:String = e.target.name;
			var idx:String = b.replace("color", "");
			if ( _colorConfig[int(idx) - 1] != null )
			{
				SetDiskColor( _colorConfig[int(idx) - 1] );
			}
		}
		
		private function GetColorIdx( color:uint ):int
		{
			var idx:int = _colorConfig.indexOf( color );
			return idx;
		}
		
		public function SetDiskColor( color:uint )
		{
			var idx:int = GetColorIdx( color );
			TweenMax.to( _colorDisk , 0.3 , { rotation: idx * 18 } );
			_curtColor = color;
			this.dispatchEvent( new Event( COLOR_UPDATE ) );
		}
		
		public function get curtColor():uint 
		{
			return _curtColor;
		}
	}
}