package com.ouorange.toolbar 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ColorPicker extends EventDispatcher
	{	
		public static const COLOR_CHANGE:String = "COLOR_CHANGE";
		
		private var _curtColorMC:MovieClip;
		
		private var _colorConfig:Array;
		
		private var _asset:MovieClip;
		
		private var _curtColor:uint;
		
		public function ColorPicker( asset:MovieClip ) 
		{
			_colorConfig = new Array();
			_colorConfig["c1"] = "0x000000";
			_colorConfig["c2"] = "0xFF0000";
			_colorConfig["c3"] = "0x00FF00";
			_colorConfig["c4"] = "0x0000FF";
			_colorConfig["c5"] = "0x000000";
			_colorConfig["c6"] = "0x000000";
			_colorConfig["c7"] = "0x000000";
			_colorConfig["c8"] = "0x000000";
			_colorConfig["c9"] = "0x000000";
			_colorConfig["c10"] = "0x000000";
			
			_asset = asset;
			
			_curtColorMC = _asset["__CurrentColor"];
			
			InitColorSelect();
		}	
		
		private function InitColorSelect():void 
		{
			var c:MovieClip = _asset["__ColorSelect"];
			var len:int = 10;
			var color:MovieClip;
			for (var i:int = 1; i <= len; i++) 
			{
				color = c["c" + i];
				if ( color )
				{
					color.buttonMode = true;
					color.addEventListener(MouseEvent.MOUSE_DOWN, onColorSelect);
				}
			}
		}
		
		private function onColorSelect(e:MouseEvent):void 
		{
			trace( e.target.name );
			var id:String = String(e.target.name);
			if ( _colorConfig[id] )
			{
				UpdateCurtColor( _colorConfig[id] );
			}
		}
		
		public function SetCurtColor( color:uint ):void
		{
			_curtColor = color; 
			trace( _curtColor );
			var ct:ColorTransform = new ColorTransform();
			ct.color = _curtColor;
			MovieClip(_curtColorMC["__Color"]).transform.colorTransform = ct;
		}
		
		private function UpdateCurtColor( color:uint ):void
		{
			SetCurtColor( color );
			this.dispatchEvent( new Event( COLOR_CHANGE ) );
		}
		
		public function get curtColor():uint 
		{
			return _curtColor;
		}
		
		public function set curtColor(value:uint):void 
		{
			_curtColor = value;
			SetCurtColor( _curtColor );
		}
	}
}