package com.ouorange.toolbar.events 
{
	import com.ouorange.toolbar.TouchSensor;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	/**
	 * ...
	 * @author Joe
	 */
	public class TouchSensorEvent extends Event 
	{
		public static const TOUCH_BEGIN:String = "TOUCH_BEGIN";
		public static const TOUCH_END:String = "TOUCH_END";
		public static const TOUCH_TAP:String = "TOUCH_TAP";
		
		private var _sensor:TouchSensor;
		
		public function TouchSensorEvent(type:String, sensor:TouchSensor) 
		{
			_sensor = sensor;
			super(type, bubbles, cancelable);		
		}
		
		override public function clone():Event 
		{
			var e:TouchSensorEvent = new TouchSensorEvent( type , _sensor );
			return e; 
		}
		
		public function get sensor():TouchSensor 
		{
			return _sensor;
		}
	}
}