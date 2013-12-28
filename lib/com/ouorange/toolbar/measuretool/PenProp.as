package com.ouorange.toolbar.measuretool 
{
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class PenProp 
	{	
		private var _color:uint = 0x000000;
		
		private var _size:Number = 3;
		
		private var _alpha:Number = 1;
		
		private var _blur:Number;
		
		private var _type:String;
		
		private var _mode:String;
		
		public function PenProp( brushSize:Number = 4, brushColor:uint = 0x000000, brushAlpha:Number = 1, brushBlur:Number = 0, brushType:String = null, toolMode:String = null ) 
		{
			_size = brushSize;
			_color = brushColor;
			_alpha = brushAlpha;
			_blur = brushBlur;
			_type = brushType;
			_mode = toolMode;
		}
		
		public function get color():uint 
		{
			return _color;
		}
		
		public function set color(value:uint):void 
		{
			_color = value;
		}
		
		public function get size():Number 
		{
			return _size;
		}
		
		public function set size(value:Number):void 
		{
			_size = value;
		}
		
		public function get alpha():Number 
		{
			return _alpha;
		}
		
		public function set alpha(value:Number):void 
		{
			if ( value >= 0 || value <= 1 )
			{
				_alpha = value;
			}
		}
		
		public function get blur():Number 
		{
			return _blur;
		}
		
		public function set blur(value:Number):void 
		{
			_blur = value;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function set type(value:String):void 
		{
			_type = value;
		}
		
		public function get mode():String 
		{
			return _mode;
		}
		
		public function set mode(value:String):void 
		{
			_mode = value;
		}
	}
}