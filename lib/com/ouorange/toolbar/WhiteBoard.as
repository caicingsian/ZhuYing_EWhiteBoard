package com.ouorange.toolbar
{
	import com.nocircleno.graffiti.GraffitiCanvas;
	import com.nocircleno.graffiti.tools.BrushTool;
	import com.nocircleno.graffiti.tools.BrushType;
	import com.nocircleno.graffiti.tools.LineTool;
	import com.nocircleno.graffiti.tools.LineType;
	import com.nocircleno.graffiti.tools.ToolMode;
	import flash.geom.Rectangle;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	//白板
	public class WhiteBoard extends Sprite
	{
		private var _canvas:Canvas;
		
		private var _direction:String;
		
		private var _asset:MovieClip;
		
		private var _enable:Boolean;
		
		private var _dragRegions:Array;
		
		private var _toggleButton:MovieClip;
		
		public function WhiteBoard( asset:MovieClip , direction:String )
		{
			_asset = asset;
			_direction = direction;
			
			_dragRegions = new Array();
			_dragRegions[WhiteBoardDirection.TOP] = new Rectangle( 0 , 0 , 0 , 700 );
			_dragRegions[WhiteBoardDirection.BOTTOM] = new Rectangle( 0 , 0 , 0 , -700 );
			_dragRegions[WhiteBoardDirection.LEFT] = new Rectangle( 0 , 0 , 1400 , 0 );
			_dragRegions[WhiteBoardDirection.RIGHT] = new Rectangle( 0 , 0 , -1400 , 0 );
			
			_canvas = new Canvas( _asset.width , _asset.height );
			
			addChild( _asset );
			_asset.addChildAt( _canvas , 1 );
			
			canvas.name = "white_board_" + _direction;
			
			SetUpDragHandler();
			enable = false;
		}
		
		public function ToggleWhiteboard():void 
		{
			enable = !enable;
		}
		
		private function SetUpDragHandler():void 
		{
			if ( _direction == WhiteBoardDirection.CENTER )
			{
				MovieClip(_asset["close_btn"]).buttonMode = true;
				MovieClip(_asset["close_btn"]).addEventListener(MouseEvent.CLICK, onCloseClick);
			}
			else
			{
				MovieClip(_asset["drag_btn"]).buttonMode = true;
				MovieClip(_asset["drag_btn"]).addEventListener(MouseEvent.MOUSE_DOWN, OnDragStart);
			}
		}
		
		private function OnDragStop(e:MouseEvent):void 
		{
			this.stopDrag();
			this.stage.removeEventListener( MouseEvent.MOUSE_UP, OnDragStop );
		}
		
		private function OnDragStart(e:MouseEvent):void 
		{
			this.startDrag( false , _dragRegions[ _direction ] );
			this.stage.addEventListener( MouseEvent.MOUSE_UP, OnDragStop );
		}
		
		private function onCloseClick(e:MouseEvent):void 
		{
			enable = false;
		}
		
		public function get canvas():Canvas 
		{
			return _canvas;
		}
		
		public function set canvas(value:Canvas):void 
		{
			_canvas = value;
		}
		
		public function get enable():Boolean 
		{
			return _enable;
		}
		
		public function set enable(value:Boolean):void 
		{
			_enable = value;
			this.visible = _enable;
		}
	}
}