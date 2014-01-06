package com.ouorange.toolbar 
{
	import adobe.utils.CustomActions;
	import com.greensock.TweenMax;
	import com.ouorange.toolbar.toolbutton.DragToolButton;
	import com.ouorange.toolbar.toolbutton.DrawShapeToolButton;
	import com.ouorange.toolbar.toolbutton.EraseToolButton;
	import com.ouorange.toolbar.toolbutton.HighLightToolButton;
	import com.ouorange.toolbar.toolbutton.MeasureToolButton;
	import com.ouorange.toolbar.toolbutton.NextHistoryToolButton;
	import com.ouorange.toolbar.toolbutton.PencilToolButton;
	import com.ouorange.toolbar.toolbutton.PrevHistoryToolButton;
	import com.ouorange.toolbar.toolbutton.ToolBarToggleButton;
	import com.ouorange.toolbar.toolbutton.ToolButton;
	import com.ouorange.toolbar.toolbutton.TrashCanToolButton;
	import com.ouorange.toolbar.toolbutton.WhiteBoardToolButton;
	import com.ouorange.toolbar.toolbutton.ChartToolButton;
	import com.ouorange.toolbar.toolbutton.ZoomInToolButton;
	import com.ouorange.toolbar.toolbutton.ZoomOutToolButton;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ToolBarButtonControl extends Sprite
	{
		public static const DIR_LEFT:String = "DIR_LEFT";
		public static const DIR_RIGHT:String = "DIR_RIGHT";
		public static const DIR_TOP:String = "DIR_TOP";
		public static const DIR_DOWN:String = "DIR_DOWN";
		
		public static const TOOL_TOGGLE:String = "TOOL_TOGGLE";
		public static const TOOL_DRAW_SHAPE:String = "TOOL_DRAW_SHAPE";
		public static const TOOL_XYCOMPOMENT:String = "TOOL_XYCOMPOMENT";
		public static const TOOL_MEASURE:String = "TOOL_MEASURE";
		public static const TOOL_PENCIL:String = "TOOL_PENCIL";
		public static const TOOL_HIGHLIGHT:String = "TOOL_HIGHLIGHT";
		public static const TOOL_ERASE:String = "TOOL_ERASE";
		public static const TOOL_ZOOM_OUT:String = "TOOL_ZOOM_OUT";
		public static const TOOL_DRAG:String = "TOOL_DRAG";
		public static const TOOL_ZOOM_IN:String = "TOOL_ZOOM_IN";
		public static const TOOL_PREV_HISTORY:String = "TOOL_PREV_HISTORY";
		public static const TOOL_NEXT_HISTORY:String = "TOOL_NEXT_HISTORY";
		public static const TOOL_WHITEBOARD:String = "TOOL_WHITEBOARD";
		public static const TOOL_TRASHCAN:String = "TOOL_TRASHCAN";
		
		private var _asset:MovieClip;
		
		private const _toggleSpeed:Number = 0.3;
		
		private var _toolButtons:Vector.<ToolButton>;
		
		private var _prevActiveTool:ToolButton;
		
		private var _direction:String = DIR_LEFT;
		
		private var _toggleButton:ToolButton;
		
		private var _isClosed:Boolean = true;
		
		private var _allToolCount:int;
		
		private var _shiftValues:Array = [0,50,45,40,35,30,25,20];
		
		public function ToolBarButtonControl( asset:MovieClip ) 
		{
			_asset = asset;			
			_toolButtons = new Vector.<ToolButton>();
			AppendToolButton( new ToolBarToggleButton(_asset["tool_btn"]) ); //開關
			_toggleButton = _toolButtons[0];
			
			_toggleButton.x = 1400;
			_toggleButton.y = 700;
			
			AppendToolButton( new TrashCanToolButton(_asset["btn11"]) );
			AppendToolButton( new WhiteBoardToolButton(_asset["btn10"]) );
			AppendToolButton( new NextHistoryToolButton(_asset["btn13"]) );
			AppendToolButton( new PrevHistoryToolButton(_asset["btn12"]) );
			AppendToolButton( new ZoomInToolButton(_asset["btn9"]) );
			AppendToolButton( new DragToolButton(_asset["btn8"]) );
			AppendToolButton( new ZoomOutToolButton(_asset["btn7"]) );
			AppendToolButton( new EraseToolButton(_asset["btn6"]) );
			AppendToolButton( new HighLightToolButton(_asset["btn5"]) );
			AppendToolButton( new PencilToolButton(_asset["btn4"]) );
			AppendToolButton( new MeasureToolButton(_asset["btn3"]) );
			AppendToolButton( new ChartToolButton(_asset["btn2"]) );
			AppendToolButton( new DrawShapeToolButton(_asset["btn1"]) );
			
			_allToolCount = _toolButtons.length;
			
			ArrangeToolButton(0);
		}
		
		public function AppendToolButton( button:ToolButton ):void
		{
			addChild( button );
			button.addEventListener( ToolButton.TOOL_ACTIVED , OnToolActived );
			button.addEventListener( ToolButton.TOOL_DISACTIVE , OnToolDisActived );
			_toolButtons.push( button );
		}
		
		private function OnToolDisActived(e:Event):void 
		{
			TweenMax.killDelayedCallsTo( ArrangeToolButton );
			TweenMax.delayedCall( 0.1 , ArrangeToolButton , [_toggleSpeed]  );
			if ( _prevActiveTool == e.target )
			{
				_prevActiveTool = null;
			}
		}
		
		private function OnToolActived(e:Event):void 
		{
			var tool:ToolButton = e.target;
			trace( "OnToolActived:",tool.name);
			
			if ( tool == _toggleButton ) 
			{
				ToogleToolPanel();
				return;
			}
			
			if ( _prevActiveTool && _prevActiveTool != tool )
			{
				//關閉前一個
				_prevActiveTool.DisActiveTool();
			}
			
			_prevActiveTool = tool;
			TweenMax.killDelayedCallsTo( ArrangeToolButton );
			TweenMax.delayedCall( 0.1 , ArrangeToolButton , [_toggleSpeed]  );
			addChild( tool );
		}
		
		public function ToogleToolPanel():void
		{
			_isClosed = !_isClosed;
			if ( _prevActiveTool ) 
			{
				_prevActiveTool.DisActiveTool();
			}
			ArrangeToolButton(_toggleSpeed);
		}
		
		public function ArrangeToolButton( speed:Number ):void
		{
			//trace( speed );
			var len:int;
			var idx:int;
			var goX:int;
			var goY:int;
			var activeIdx:int;
			var offset:Point = new Point();
			var vx:int;
			var vy:int;
			var activeToolSize:Number;
			
			len = _toolButtons.length;
			
			if ( _direction == DIR_LEFT ) offset.x = -65;
			
			if ( _prevActiveTool )
			{
				activeToolSize = _prevActiveTool.size;
				activeIdx = _toolButtons.indexOf( _prevActiveTool );
			}
			
			for (var i:int = 1; i < len; i++) 
			{	
				if ( _isClosed )
				{
					TweenMax.to( _toolButtons[i] , speed , 
					{ 
						x:_toggleButton.x ,
						y:_toggleButton.y ,
						visible:false } );
				} else {
					_toolButtons[i].visible = true;
					if ( activeIdx > 0 )
					{
						goX = ( _toggleButton.x + offset.x * i );						
						if ( activeIdx != i )  //根據開啟的工具、調整按鈕的位置
						{
							vx = activeToolSize -  Math.abs( activeIdx - i ) * 5;
							if ( activeIdx - i > 0 ) { //往右往上
								if( vx > 0 ) goX += vx;								
							} else {
								if( vx * -1 < 0 ) goX -= vx;
							}							
						}
						TweenMax.to( _toolButtons[i] , speed , 
						{ 
							x: goX ,
							y: _toggleButton.y + offset.y * i 
						} );
					}
					else 
					{
						TweenMax.to( _toolButtons[i] , speed , 
						{ 
							x: _toggleButton.x + offset.x * i ,
							y: _toggleButton.y + offset.y * i 
						} );
					}					
				}
			}
		}
	}
}