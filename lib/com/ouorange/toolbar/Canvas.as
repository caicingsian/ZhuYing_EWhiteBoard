package com.ouorange.toolbar 
{
	import com.nocircleno.graffiti.events.GraffitiObjectEvent;
	import com.nocircleno.graffiti.GraffitiCanvas;
	import com.nocircleno.graffiti.tools.BrushTool;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class Canvas extends Sprite 
	{
		private var _canvas:GraffitiCanvas;
		
		private var _enable:Boolean;
		
		private var _active:Boolean;
		
		public function Canvas( canvasWidth:uint = 100, canvasHeight:uint = 100, numberHistoryLevels:uint = 0, overlay:DisplayObject = null, underlay:DisplayObject = null ) 
		{
			super();
			_canvas = new GraffitiCanvas( canvasWidth , canvasHeight , numberHistoryLevels , overlay , underlay );
			addChild( _canvas );
			_canvas.addEventListener( GraffitiObjectEvent.SELECT , OnCanvasEvent );
			enable = false;
		}
		
		private function OnCanvasEvent(e:Event):void 
		{
			if ( e.type == GraffitiObjectEvent.SELECT )
			{
				_active = true;
			}
		}
		
		public function DrawByEvent( e:MouseEvent ):void
		{
			canvas.draw( e );
		}
		
		//設定使用的筆
		public function SetBrush(curtPen:Pen):void 
		{
			//trace( "SetBrush" );
			_canvas.activeTool = curtPen.brushTool;
		}
		
		public function get enable():Boolean 
		{
			return _enable;
		}
		
		public function set enable(value:Boolean):void 
		{
			_enable = value;
			this.mouseChildren = this.mouseEnabled = _enable;
			_canvas.canvasEnabled = _enable;
		}
		
		public function get canvas():GraffitiCanvas 
		{
			return _canvas;
		}
	}
}