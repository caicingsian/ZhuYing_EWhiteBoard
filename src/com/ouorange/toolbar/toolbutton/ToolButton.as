package com.ouorange.toolbar.toolbutton 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ToolButton extends Sprite 
	{
		public static const TOOL_ACTIVED:String = "TOOL_ACTIVED";
		public static const TOOL_DISACTIVE:String = "TOOL_DISACTIVE";
		
		public var originPostion:Point;
		
		protected var _asset:MovieClip;
		
		protected var _panel:MovieClip;
		
		protected var _toggleBtn:MovieClip;
		
		protected var _isActive:Boolean;
		
		//按鈕大小
		protected var _size:Number = 50;
		
		//private var activeFilter:DropShadowFilter = new DropShadowFilter(3, 45, 0, .8, 3, 3, 100, 1, true);
		
		//按鈕為單一點擊工具;
		public var isSingleClick:Boolean = false;
		
		public function ToolButton( asset:MovieClip ) 
		{
			_asset = asset;
			if ( _asset["panel"] ) 
			{
				_panel = _asset["panel"];
				_panel.visible = false;
				_panel.stop();
			}
			if ( _asset["__Btn"] )
			{
				_toggleBtn = _asset["__Btn"];
				_toggleBtn.addEventListener( MouseEvent.MOUSE_OVER , OnMouseHandler );
				_toggleBtn.addEventListener( MouseEvent.MOUSE_OUT , OnMouseHandler );
				_toggleBtn.addEventListener( MouseEvent.MOUSE_UP , OnMouseHandler );
				_toggleBtn.addEventListener( MouseEvent.MOUSE_DOWN , OnMouseHandler );
				_toggleBtn.addEventListener( MouseEvent.CLICK , OnMouseHandler );
				_toggleBtn.buttonMode = true;
			}
			_asset.x = _asset.y = 0;
			addChild(_asset);
			super();		
		}
		
		private function OnMouseHandler(e:MouseEvent):void 
		{
			//trace("123");
			_asset.gotoAndStop(1);
			if ( e.type == MouseEvent.MOUSE_DOWN ) {
				_asset.scaleX = _asset.scaleY = 0.9;
			} else if ( e.type == MouseEvent.MOUSE_UP ) {
				_asset.scaleX = _asset.scaleY = 1;
			}
			
			if ( e.type == MouseEvent.MOUSE_OVER && _isActive == false )
			{
				_asset.gotoAndPlay(2);
				this.parent.addChild( this );
			}
			else if ( e.type == MouseEvent.MOUSE_OUT && _isActive == false)
			{
				_asset.gotoAndPlay(7);
				_asset.scaleX = _asset.scaleY = 1;
			}
			else if ( e.type == MouseEvent.CLICK )
			{
				if ( _isActive )
					DisActiveTool();
				else
					ActiveTool();					
			}
		}
		
		//啟動工具
		public function ActiveTool():void
		{
			if ( _panel )
			{
				_panel.visible = true;
				_panel.gotoAndPlay(2);
			}
			isActive = true;
		}
		//關閉工具
		public function DisActiveTool():void
		{
			if ( _panel )
			{
				_panel.visible = false;
			}
			isActive = false;
		}
		
		public function get isActive():Boolean 
		{
			return _isActive;
		}
		
		public function set isActive(value:Boolean):void 
		{
			if ( isSingleClick )
			{
				this.dispatchEvent( new Event( TOOL_ACTIVED , true , true) );
			}
			else
			{
				_isActive = value;
				if ( _isActive ) this.dispatchEvent( new Event( TOOL_ACTIVED , true , true) );
				else this.dispatchEvent( new Event( TOOL_DISACTIVE , true , true ) );
			}
		}
		
		public function get size():Number 
		{
			return _size;
		}
		
		public function set size(value:Number):void 
		{
			_size = value;
		}
	}
}