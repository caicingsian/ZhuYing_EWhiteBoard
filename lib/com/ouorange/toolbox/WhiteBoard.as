package com.ouorange.toolbox
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

		private var _penButton2:MovieClip;

		private var _eraserButton:MovieClip;

		private var _canvas:GraffitiCanvas;

		private var _canvas2:GraffitiCanvas;

		private var _clearButton:MovieClip;



		//--------------------------------------  Allen



		private var _canvas3:GraffitiCanvas;

		private var _canvas4:GraffitiCanvas;

		private var _canvas5:GraffitiCanvas;

		private var _canvas6:GraffitiCanvas;

		private var _canvas7:GraffitiCanvas;

		private var brd_t:MovieClip;
		private var brd_r:MovieClip;
		private var brd_b:MovieClip;
		private var brd_l:MovieClip;
		private var brd_c:MovieClip;

		//---------------------------------調色盤物件
		private var cc1:MovieClip;
		private var cc2:MovieClip;
		private var cc3:MovieClip;
		private var cc4:MovieClip;
		private var cc5:MovieClip;
		private var cc6:MovieClip;
		private var cc7:MovieClip;
		private var cc8:MovieClip;
		private var cc9:MovieClip;

		private var m_line1:MovieClip;
		private var m_line2:MovieClip;
		private var m_line3:MovieClip;
		private var m_line4:MovieClip;
		private var m_line5:MovieClip;
		private var m_line6:MovieClip;


		private var mcc:MovieClip;

		//---------------------------------調色盤物件 (螢光筆)
		private var cc1s:MovieClip;
		private var cc2s:MovieClip;
		private var cc3s:MovieClip;
		private var cc4s:MovieClip;
		private var cc5s:MovieClip;
		private var cc6s:MovieClip;
		private var cc7s:MovieClip;
		private var cc8s:MovieClip;
		private var cc9s:MovieClip;

		private var m_line1s:MovieClip;
		private var m_line2s:MovieClip;
		private var m_line3s:MovieClip;
		private var m_line4s:MovieClip;
		private var m_line5s:MovieClip;
		private var m_line6s:MovieClip;


		private var mcc2:MovieClip;

		//-------------------------------------------色盤關閉物件
		private var mcc_close:MovieClip;
		private var mcc2_close:MovieClip;
		//-----------------------------------------

		private var bcc:MovieClip;
		//----------------------------------------

		public function WhiteBoard()
		{
			super();
			//return;
			instance = this;
			canvasGroup = new Array();
			appendCanvas( new WhiteBoardCanvas() );

			var mainTimeLine:MovieClip = ToolBox.stageRef.getChildAt(0) as MovieClip;
			_penButton = mainTimeLine.getChildByName("btn4");//鉛筆
			_penButton2 = mainTimeLine.getChildByName("btn5");//螢光筆
			_eraserButton = mainTimeLine.getChildByName("btn6");
			_clearButton = mainTimeLine.getChildByName("btn10");
			//-------------------------------------------------------- Allen


			brd_t = mainTimeLine.getChildByName("broad_t_obj");//上方白板

			brd_r = mainTimeLine.getChildByName("broad_r_obj");//右方白板

			brd_b = mainTimeLine.getChildByName("broad_b_obj");//下方白板

			brd_l = mainTimeLine.getChildByName("broad_l_obj");//左方白板

			brd_c = mainTimeLine.getChildByName("broad_c_obj");//左方白板

			//---------------------------------------------------------------------------
			//var mycolor:Array=new Array();
			//mycolor[0] = "0xE60012";
			var mcs:String = "0x3E3A39";

			cc1 = mainTimeLine.getChildByName("pan_m2").getChildByName("color1");
			cc2 = mainTimeLine.getChildByName("pan_m2").getChildByName("color2");
			cc3 = mainTimeLine.getChildByName("pan_m2").getChildByName("color3");
			cc4 = mainTimeLine.getChildByName("pan_m2").getChildByName("color4");
			cc5 = mainTimeLine.getChildByName("pan_m2").getChildByName("color5");
			cc6 = mainTimeLine.getChildByName("pan_m2").getChildByName("color6");
			cc7 = mainTimeLine.getChildByName("pan_m2").getChildByName("color7");
			cc8 = mainTimeLine.getChildByName("pan_m2").getChildByName("color8");
			cc9= mainTimeLine.getChildByName("pan_m2").getChildByName("color9")
			;
			m_line1 = mainTimeLine.getChildByName("pan_m2").getChildByName("line_mc");
			m_line2 = mainTimeLine.getChildByName("pan_m2").getChildByName("line_mc2");
			m_line3 = mainTimeLine.getChildByName("pan_m2").getChildByName("line_mc3");
			m_line4 = mainTimeLine.getChildByName("pan_m2").getChildByName("line_mc4");
			m_line5 = mainTimeLine.getChildByName("pan_m2").getChildByName("line_mc5");
			m_line6=mainTimeLine.getChildByName("pan_m2").getChildByName("line_mc6")
			;
			mcc= mainTimeLine.getChildByName("pan_m2").getChildByName("pcmc")
			            ;
			//---------------------------------------------------------------------------------螢光筆
			var mcs2:String = "0x898989";

			cc1s = mainTimeLine.getChildByName("pan_m").getChildByName("color1");
			cc2s = mainTimeLine.getChildByName("pan_m").getChildByName("color2");
			cc3s = mainTimeLine.getChildByName("pan_m").getChildByName("color3");
			cc4s = mainTimeLine.getChildByName("pan_m").getChildByName("color4");
			cc5s = mainTimeLine.getChildByName("pan_m").getChildByName("color5");
			cc6s = mainTimeLine.getChildByName("pan_m").getChildByName("color6");
			cc7s = mainTimeLine.getChildByName("pan_m").getChildByName("color7");
			cc8s = mainTimeLine.getChildByName("pan_m").getChildByName("color8");
			cc9s = mainTimeLine.getChildByName("pan_m").getChildByName("color9")
			;
			m_line1s = mainTimeLine.getChildByName("pan_m").getChildByName("line_mc");
			m_line2s = mainTimeLine.getChildByName("pan_m").getChildByName("line_mc2");
			m_line3s = mainTimeLine.getChildByName("pan_m").getChildByName("line_mc3");
			m_line4s = mainTimeLine.getChildByName("pan_m").getChildByName("line_mc4");
			m_line5s = mainTimeLine.getChildByName("pan_m").getChildByName("line_mc5");
			m_line6s =mainTimeLine.getChildByName("pan_m").getChildByName("line_mc6")
			;
			mcc2= mainTimeLine.getChildByName("pan_m").getChildByName("pcmc")
			            ;
			//-----------------------------------------------------------------------------------



			//---------------------------------------------------------------------------------

			bcc = mainTimeLine.getChildByName("broad_btn");

			main_cc = mainTimeLine.getChildByName("main_broad_mc");

			//------------------------------------------------------------------color
			/*
			cc1.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0x3E3A39",1)});


			cc2.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0xE60012",2)});

			cc3.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0xEB6100",3)});

			cc4.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0xF8B62D",4)});

			cc5.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0x009A3E",5)});

			cc6.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0x00A29A",6)});

			cc7.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0x036EB8",7)});

			cc8.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0x0B318F",8)});

			cc9.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent(e, "0x7E318E",9)});
            */

			function handleClickEvent(e:MouseEvent,dstr:String,dstr2:Number)
			{

				mcs = dstr;
				mcc.gotoAndStop(dstr2);

				_brush.color = mcs;
				_eraser.color = mcs;

				_brush.alpha = 1;
			}
			//-----------------------------------------------------------------------------line
			var linesize:Number = 1;

			/*
			m_line1.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent3(e, 1)});

			m_line2.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent3(e, 2)});

			m_line3.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent3(e, 3)});

			m_line4.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent3(e, 4)});

			m_line5.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent3(e, 5)});

			m_line6.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent3(e, 6)});

             */
			function handleClickEvent3(e:MouseEvent,dstr2:Number)
			{
				linesize  =dstr2
				       ;
				_brush.size = linesize;
				//_eraser.size = linesize;

				_brush.alpha = 1;
			}

			//------------------------------------------------------------------color  (螢光筆)
			
			/*
			cc1s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e, "0x898989",1)});


			cc2s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e, "0xE4007F",2)});

			cc3s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e, "0xF39800",3)});

			cc4s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e, "0xFAEE00",4)});

			cc5s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e, "0x8FC31F",5)});

			cc6s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e, "0x2EA7E0",6)});

			cc7s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e, "0x00A29A",7)});

			cc8s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e,  "0x1F50B2",8)});

			cc9s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent2(e, "0x7E318E",9)});
            */

			function handleClickEvent2(e:MouseEvent,dstr:String,dstr2:Number)
			{

				mcs2 = dstr;
				mcc2.gotoAndStop(dstr2);

				_brush.color = mcs2;
				_eraser.color = mcs2;

				_brush.alpha = 0.5;
			}
			//-----------------------------------------------------------------------------line (螢光筆)
			var linesize2:Number = 2;

			
			/*
			m_line1s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent4(e, 2)});

			m_line2s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent4(e, 4)});

			m_line3s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent4(e, 6)});

			m_line4s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent4(e, 8)});

			m_line5s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent4(e, 10)});

			m_line6s.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			handleClickEvent4(e, 12)});
            */

			function handleClickEvent4(e:MouseEvent,dstr2:Number)
			{
				linesize2  =dstr2
				       ;
				_brush.size = linesize2;
				//_eraser.size = linesize2;

				_brush.alpha = 0.5;
			}
			//-----------------------------------------

			mcc_close = mainTimeLine.getChildByName("fff")
			mcc2_close = mainTimeLine.getChildByName("pan_m").getChildByName("center_btn");
			//------------------------------------------------------------------------------
			_canvas = new GraffitiCanvas(1500,844,10);
			main_cc.addChild(_canvas);
			_canvas.canvasEnabled = false;
			main_cc.visible=false
			;
			var col:Bitmap = new Bitmap(new BitmapData(500,400,true,0xFFFFFFFF));

			_canvas2 = new GraffitiCanvas(500,400,10,null,col);
			_canvas2.setCanvasPos( new Point( 300 , 100 ) );
			_canvas2.x = 300;
			_canvas2.y = 100;
			//cc.addChild(_canvas2);
			_canvas2.canvasEnabled = false;

			//_canvas2.visible=false
			//canvas2.addEventListener(MouseEvent.MOUSE_DOWN , onCanvasDown);


			//-------------
			//bcc.addEventListener( MouseEvent.CLICK , bcc_f );
			function bcc_f(e:MouseEvent):void
			{
				if (main_cc.visible == false)
				{
					main_cc.visible = true;
				}
				else
				{
					main_cc.visible = false;
				}

			}
			//-----------------------------------------------------------------------Allen



			_canvas3 = new GraffitiCanvas(brd_t.width,brd_t.height,10);
			_canvas4 = new GraffitiCanvas(brd_r.width,brd_r.height,10);
			_canvas5 = new GraffitiCanvas(brd_b.width,brd_b.height,10);
			_canvas6 = new GraffitiCanvas(brd_l.width,brd_l.height,10);
			_canvas7 = new GraffitiCanvas(brd_c.width,brd_c.height,10);



			brd_t.mc.addChild(_canvas3);
			brd_r.mc.addChild(_canvas4);
			brd_b.mc.addChild(_canvas5);
			brd_l.mc.addChild(_canvas6);
			brd_c.mc.addChild(_canvas7);

			_canvas3.canvasEnabled = false;
			_canvas4.canvasEnabled = false;
			_canvas5.canvasEnabled = false;
			_canvas6.canvasEnabled = false;
			_canvas7.canvasEnabled = false;


			//------------------------------------------------------------------------------------

			_brush = new BrushTool(linesize,mcs,1,0,BrushType.DIAMOND);
			_eraser = new BrushTool(6,mcs,1,0,BrushType.ROUND,ToolMode.ERASE);


			//_penButton.addEventListener( MouseEvent.CLICK , onPenClick );
			//_penButton2.addEventListener( MouseEvent.CLICK , onPenClick2 );



			//_eraserButton.addEventListener( MouseEvent.CLICK , onEraserClick );
			
			//mcc_close .addEventListener( MouseEvent.CLICK ,pan_close);
			//mcc2_close .addEventListener( MouseEvent.CLICK ,pan_close)

			//---;

			//-----------------------------------------------------------------------------------;
			//_clearButton.addEventListener( MouseEvent.CLICK , onClearClick );

			//canvas.activeTool = brush;
			//var dottedLine:LineTool = new LineTool(4, 0xBBBBBB, 1, LineType.DOTTED);
			//canvas2.activeTool = dottedLine;

		}




		private function onPenClick(e:MouseEvent):void
		{
			trace("onPenClick");
			main_cc.visible = true;
			_canvas.activeTool = _brush;
			_canvas2.activeTool = _brush;
			_canvas.canvasEnabled = true;
			_canvas2.canvasEnabled = true;

			//-----------------------------------------------Allen

			//if (_canvas3.canvasEnabled == false)
			//{
			_canvas3.activeTool = _brush;
			_canvas3.canvasEnabled = true;
			_canvas4.activeTool = _brush;
			_canvas4.canvasEnabled = true;
			_canvas5.activeTool = _brush;
			_canvas5.canvasEnabled = true;
			_canvas6.activeTool = _brush;
			_canvas6.canvasEnabled = true;
			_canvas7.activeTool = _brush;
			_canvas7.canvasEnabled = true;

			/*
			}
			
			else
			{
			_canvas.canvasEnabled = false;
			//_canvas2.canvasEnabled = false;
			_canvas3.canvasEnabled = false;
			_canvas4.canvasEnabled = false;
			_canvas5.canvasEnabled = false;
			_canvas6.canvasEnabled = false;
			_canvas7.canvasEnabled = false;
			}*/

			//----------------------------------------------
		}





		//-------------------------------------------------------螢光筆

		private function onPenClick2(e:MouseEvent):void
		{

			trace("onPenClick2----");
			main_cc.visible = true;
			_canvas.activeTool = _brush;
			_canvas2.activeTool = _brush;
			_canvas.canvasEnabled = true;
			_canvas2.canvasEnabled = true;

			//-----------------------------------------------Allen

			//if (_canvas3.canvasEnabled == false)
			//{
			_canvas3.activeTool = _brush;
			_canvas3.canvasEnabled = true;
			_canvas4.activeTool = _brush;
			_canvas4.canvasEnabled = true;
			_canvas5.activeTool = _brush;
			_canvas5.canvasEnabled = true;
			_canvas6.activeTool = _brush;
			_canvas6.canvasEnabled = true;
			_canvas7.activeTool = _brush;
			_canvas7.canvasEnabled = true;


			/*}
			
			
			else
			{
			
			_canvas3.canvasEnabled = false;
			_canvas4.canvasEnabled = false;
			_canvas5.canvasEnabled = false;
			_canvas6.canvasEnabled = false;
			_canvas7.canvasEnabled = false;
			}*/


			//----------------------------------------------
		}

		private function pan_close(e:MouseEvent):void
		{
            trace("pan_close")
			_canvas.canvasEnabled = false;
			_canvas2.canvasEnabled = false;
			_canvas3.canvasEnabled = false;
			_canvas4.canvasEnabled = false;
			_canvas5.canvasEnabled = false;
			_canvas6.canvasEnabled = false;
			_canvas7.canvasEnabled = false;


		}

		//--------------------------------------------------------
		private function onClearClick(e:MouseEvent):void
		{
			_canvas.clearCanvas();
			_canvas2.clearCanvas();
		}

		private function onEraserClick(e:MouseEvent):void
		{
			_canvas.activeTool = _eraser;
			_canvas2.activeTool = _eraser;
			_canvas3.activeTool = _eraser;
			_canvas4.activeTool = _eraser;
			_canvas5.activeTool = _eraser;
			_canvas6.activeTool = _eraser;
			_canvas7.activeTool = _eraser;


		}

		private function onCanvasDown(e:MouseEvent):void
		{
			var s:Sprite = e.target as Sprite;
			//s.startDrag(false);
		}

		public function appendCanvas( canvas:Sprite ):void
		{
			if ( checkCanvasExist( canvas ) == false )
			{
				canvasGroup.push( canvas );
			}
		}

		public function checkCanvasExist( canvas:Sprite ):Boolean
		{
			var idx:int = canvasGroup.indexOf(canvas);
			if ( idx >= 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}