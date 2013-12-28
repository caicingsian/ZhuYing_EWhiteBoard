package com.utils
{
	import flash.geom.Point;

	public class MathUtil
	{
		public function MathUtil()
		{
			
		}
		
		public static function d2r( d:Number ):Number
		{
			return d * Math.PI / 180;	
		}
		
		public static function r2d( r:Number ):Number 
		{
			return r * 180 / Math.PI;	
		}
		
		public static function Clamp( value:Number , min:Number , max:Number ):Number
		{
			return value < min ? min : value > max ? max : value;
		}
	}
}