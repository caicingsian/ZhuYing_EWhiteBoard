package com.ouorange.toolbar 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ChartComponent extends Sprite 
	{
		public static const CHART_XY:String = "CHART_XY";
		
		protected var _canvas:Canvas;
		
		protected var _asset:MovieClip;
		
		protected var _sn:Number;
		
		protected var _chart_type:String;
		
		public function ChartComponent() 
		{
			super();
		}
		
		public function CloseChart():void
		{
			
		}
		
		public function OpenChart():void
		{
			
		}
		
		public function RemoveChart():void
		{
			ChartManager.Instance.RemoveChart( this );
		}
		
		public function get sn():Number 
		{
			return _sn;
		}
		
		public function set sn(value:Number):void 
		{
			_sn = value;
		}
		
		public function get chart_type():String 
		{
			return _chart_type;
		}
	}
}