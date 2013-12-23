package com.ouorange.toolbar
{
	import com.nocircleno.graffiti.GraffitiCanvas;
	import com.nocircleno.graffiti.tools.BrushTool;
	import com.nocircleno.graffiti.tools.BrushType;
	import com.nocircleno.graffiti.tools.LineTool;
	import com.nocircleno.graffiti.tools.LineType;
	import com.nocircleno.graffiti.tools.ToolMode;
	

	
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	public class WhiteBoard extends Sprite
	{
		private var canvasGroup:Array;
		
		public static var instance:WhiteBoard;

		private var _brush:BrushTool;
		
		private var _eraser:BrushTool;
		
		private var _penButton:MovieClip;
		
		private var _eraserButton:MovieClip;

		private var _canvas:GraffitiCanvas;

		private var _canvas2:GraffitiCanvas;
		
		private var _clearButton:MovieClip;
	
		private var _pen:Pen;
		
		public function WhiteBoard()
		{
			super();
//			return;
			instance = this;
			canvasGroup = new Array();
			appendCanvas( new WhiteBoardCanvas() );
			
			var mainTimeLine:MovieClip = ToolBox.stageRef.getChildAt(0) as MovieClip;
			_penButton = mainTimeLine.getChildByName("btn4");
			_eraserButton = mainTimeLine.getChildByName("btn6");
			_clearButton = mainTimeLine.getChildByName("btn10");
			
			_canvas = new GraffitiCanvas(1500, 400, 10);
			addChild(_canvas);
			_canvas.canvasEnabled = false;
			
			var col:Bitmap = new Bitmap( new BitmapData(  500 , 400 , true , 0xFFFFFFFF ) );
			
			_canvas2 = new GraffitiCanvas(500, 400, 10 , null , col);
			_canvas2.setCanvasPos( new Point( 300 , 100 ) );
			_canvas2.x = 300;
			_canvas2.y = 100;
			addChild(_canvas2);
//			_canvas2.mouseDrag = true;
//			_canvas2.canvasEnabled = false;
//			canvas2.addEventListener(MouseEvent.MOUSE_DOWN , onCanvasDown);
			
			_brush = new BrushTool(8, 0xFF0000, 1, 0, BrushType.DIAMOND);
			_eraser = new BrushTool(8, 0xFF0000, 1, 0, BrushType.ROUND, ToolMode.ERASE);
			
			
			_penButton.addEventListener( MouseEvent.CLICK , onPenClick );
			_eraserButton.addEventListener( MouseEvent.CLICK , onEraserClick );
			_clearButton.addEventListener( MouseEvent.CLICK , onClearClick );
			
//			canvas.activeTool = brush;
//			var dottedLine:LineTool = new LineTool(4, 0xBBBBBB, 1, LineType.DOTTED);
//			canvas2.activeTool = dottedLine;
			
			//_pen = new Pen();
			//addChild( _pen );
		}
		
		private function onPenClick(e:MouseEvent):void
		{
			_canvas.activeTool = _brush;
			_canvas2.activeTool = _brush;
			_canvas.canvasEnabled = true;
			_canvas2.canvasEnabled = true;
			
		}
		
		private function onClearClick(e:MouseEvent):void
		{
			_canvas.clearCanvas();
			_canvas2.clearCanvas();
		}
		
		private function onEraserClick(e:MouseEvent):void
		{
			_canvas.activeTool = _eraser;
			_canvas2.activeTool = _eraser;
			
		}
		
		private function onCanvasDown(e:MouseEvent):void
		{
			var s:Sprite = e.target as Sprite;
			//s.startDrag(false);
		}
		
		public function appendCanvas( canvas:Sprite ):void
		{
			if( checkCanvasExist( canvas ) == false )
			{
				canvasGroup.push( canvas );
			}
		}
		
		public function checkCanvasExist( canvas:Sprite ):Boolean
		{
			var idx:int = canvasGroup.indexOf( canvas );
			if( idx >= 0) 
				return true;
			else
				return false;
		}
	}
}