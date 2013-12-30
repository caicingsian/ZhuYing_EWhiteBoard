package com.ouorange.toolbar 
{
	import com.ouorange.toolbar.events.TouchSensorEvent;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe
	 * 白板感應區管理
	 * 由於除了畫面外、左右上下都可以拖拉白板出來
	 * 所以必須統一管理、目前點擊的是哪一個區塊.
	 */
	public class TouchSensorManager extends EventDispatcher 
	{
		private static var _instance:TouchSensorManager;
		
		public static function get Instance():TouchSensorManager
		{
			_instance = _instance || new TouchSensorManager();
			return _instance;
		}
		
		private var _sensors:Vector.<TouchSensor>;
		
		public function TouchSensorManager() 
		{
			_sensors = new Vector.<TouchSensor>();		
		}
		
		public function AppendSensor( sensor:TouchSensor ):void
		{
			_sensors.push( sensor );
			sensor.addEventListener( TouchSensorEvent.TOUCH_BEGIN , OnSensorTouchHandler );
			//sensor.addEventListener( TouchSensorEvent.TOUCH_END , OnSensorTouchHandler );
			//sensor.addEventListener( TouchSensorEvent.TOUCH_TAP , OnSensorTouchHandler );
		}
		
		private function OnSensorTouchHandler(e:TouchSensorEvent):void 
		{
			//trace( "OnSensorTouchHandler" );
			this.dispatchEvent( e );
		}
	}
}