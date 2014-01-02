package com.ouorange.toolbar 
{
	import com.ouorange.toolbar.events.TouchSensorEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe
	 */
	public class TouchSensor extends Sprite 
	{
		private var _isActived:Boolean;
		
		private var _sensor:Sprite;
		
		private var _owner:Sprite;
		
		private var _isDebug:Boolean;
		
		public function TouchSensor( swidth:int = 100, sheight:int = 100 , owner:Sprite = null , isDebug:Boolean = false) 
		{
			super();
			_isDebug = isDebug;
			_owner = owner;
			CreateSensor( swidth , sheight );
		}
		
		public function CreateSensor( swidth:int = 100 , sheight:int = 100 ):void
		{
			RemoveSensor();
			_sensor = new Sprite();
			_sensor.graphics.beginFill( 0x00FF00 , ( _isDebug ? 0.5 : 0 ) );
			_sensor.graphics.drawRect( 0 , 0 , swidth , sheight );
			_sensor.graphics.endFill();
			
			_sensor.addEventListener( MouseEvent.MOUSE_DOWN , OnTouchHandler );
			_sensor.addEventListener( MouseEvent.MOUSE_UP , OnTouchHandler );
			_sensor.addEventListener( MouseEvent.MOUSE_MOVE , OnTouchHandler );
			_sensor.addEventListener( MouseEvent.CLICK , OnTouchHandler );
			
			addChild( _sensor );
		}
		
		public function RemoveSensor():void
		{
			if ( _sensor )
			{
				_sensor.removeEventListener( MouseEvent.MOUSE_DOWN , OnTouchHandler );
				_sensor.removeEventListener( MouseEvent.MOUSE_UP , OnTouchHandler );
				_sensor.removeEventListener( MouseEvent.MOUSE_MOVE , OnTouchHandler );
				_sensor.removeEventListener( MouseEvent.CLICK , OnTouchHandler );
				removeChild( _sensor );
			}
		}
		
		private function OnTouchHandler(e:MouseEvent):void 
		{
			var type:String = e.type;
			//trace( "OnTouchHandler:" , type  );
			if ( type == MouseEvent.MOUSE_DOWN ) {
				type = TouchSensorEvent.TOUCH_BEGIN;
			} else if ( type == MouseEvent.MOUSE_UP ) {
				type = TouchSensorEvent.TOUCH_END;
			} else if ( type == MouseEvent.CLICK ) {
				type = TouchSensorEvent.TOUCH_TAP;
			} else if ( type == MouseEvent.MOUSE_MOVE ) {
				type = TouchSensorEvent.TOUCH_MOVE;
			}
			
			this.dispatchEvent( new TouchSensorEvent( type , this ) );
		}
		
		public function SetActive( bol:Boolean ):void
		{
			_isActived = bol;
			this.mouseChildren = this.mouseEnabled = _isActived;
		}
		
		public function get owner():Sprite 
		{
			return _owner;
		}
	}
}