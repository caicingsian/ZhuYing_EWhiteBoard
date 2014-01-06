package com.ouorange.component
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Joe
	 */
	public class CalculatorComponent extends Sprite
	{
		public static const UPDATE:String = "UPDATE";
		
		private var _asset:MovieClip;
		
		private var _valueLabel:TextField;
		
		private var _curNum:Number = 0;
		
		private var _dotActived:Boolean = false;
		
		private var _pointCount:int = 0;
		
		public function CalculatorComponent( asset:MovieClip ) 
		{
			_asset = asset;
			addChild( _asset );
			Init();
			//AppendNumber(1);
			//_dotActived = true;
			//AppendNumber(2);
		}	
		
		private function Init():void 
		{
			_valueLabel = _asset["__Value"];
			
			_asset["__CloseButton"].addEventListener( MouseEvent.MOUSE_DOWN , OnCloseHandler );
			
			_asset["__Dot"].addEventListener( MouseEvent.MOUSE_DOWN , OnDotClick );
			_asset["__Reset"].addEventListener( MouseEvent.MOUSE_DOWN , OnResetClick );
			
			for (var i:int = 0; i < 10; i++) 
			{
				_asset["n" + i].addEventListener( MouseEvent.MOUSE_DOWN , OnNumClick );
			}	
		}
		
		private function OnCloseHandler(e:MouseEvent):void 
		{
			Close();
		}
		
		public function Open():void
		{
			this.visible = true;
		}
		
		public function Close():void
		{
			this.visible = false;
			Reset();
		}
		
		private function OnResetClick(e:MouseEvent):void
		{
			Reset();
		}
		
		public function Reset():void
		{
			_curNum = 0;
			_dotActived = false;
			_pointCount = 0;
			UpdateNumer(0);
		}
		
		private function OnDotClick(e:MouseEvent):void 
		{
			if ( _dotActived ) return;
			_dotActived = true; 
		}
		
		private function OnNumClick(e:MouseEvent):void 
		{
			var num:int = e.target.name.split("")[1];
			AppendNumber( num );
		}
		
		private function AppendNumber( num:Number ):void
		{
			if ( _dotActived ) 
			{
				_pointCount++;
				UpdateNumer( _curNum + ( num / ( Math.pow( 10 , _pointCount ) ) ) );
			}
			else 
			{
				UpdateNumer( num + _curNum * 10 );
			}
		}
		
		private function UpdateNumer( num:Number ):void
		{
			//trace( 
			_curNum = num;
			_valueLabel.text = _curNum.toString();
			this.dispatchEvent( new Event( UPDATE ) );
		}
		
		public function get curNum():Number 
		{
			return _curNum;
		}
	}
}