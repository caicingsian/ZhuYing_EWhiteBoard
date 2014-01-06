package com.ouorange.toolbar
{
	import com.nocircleno.graffiti.tools.BrushTool;
	import com.ouorange.toolbar.measuretool.CommonMeasureTool;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class PenControl extends Sprite
	{
		public static const BRUSH_UPDATE:String = "BRUSH_UPDATE";
		
		public var measureTools:Vector.<CommonMeasureTool>;
		
		private var _currentPen:Pen;
		
		//筆桶
		private var _brushPot:BrushPot;
		
		private var _enable:Boolean;
		
		private var _isTouchStart:Boolean;
		
		private var _stageRef:Stage;
		
		private var _bufferPoint:Point;
		
		public function PenControl( stage:Stage )
		{
			_stageRef = stage;
			_brushPot = new BrushPot();
			_bufferPoint = new Point();
			setCurrentPen( _brushPot.GetPen( BrushPot.HIGHLIGHTER ) );
			measureTools = new Vector.<CommonMeasureTool>();
		}
		
		public function get enable():Boolean
		{
			return _enable;
		}

		public function set enable(value:Boolean):void
		{
			_enable = value;
			_currentPen.enable = _enable;
			
			if( _enable ) setTouchEventListener();
			else stopTouchEventListener();
		}
		
		public function get currentPen():Pen 
		{
			return _currentPen;
		}
		
		public function GetPen( name:String ):Pen
		{
			return _brushPot.GetPen(name );
		}
		
		//設定使用的筆刷
		public function setCurrentPen( pen:Pen ):void
		{
			//trace( "setCurrentPen:" + pen.name );
			if ( pen )
			{
				if ( _currentPen != null )
				{
					removeChild( _currentPen );
				}
				_currentPen = pen;
				addChild( _currentPen );
				_currentPen.addEventListener(Pen.BRUSH_STYLE_UPDATE, OnPenStyleUpdate);
				this.dispatchEvent( new Event( BRUSH_UPDATE ) );
			}
		}
		
		private function OnPenStyleUpdate(e:Event):void 
		{
			//trace( "OnPenStyleUpdate" );
			if ( _currentPen == e.target )
			{
				this.dispatchEvent( new Event( BRUSH_UPDATE ) );
			}
		}
		
		private function stopTouchEventListener():void
		{
			_stageRef.removeEventListener( MouseEvent.MOUSE_DOWN , onTouchEventHandler );
			_stageRef.removeEventListener( MouseEvent.MOUSE_UP , onTouchEventHandler );
			_stageRef.removeEventListener( MouseEvent.MOUSE_MOVE , onTouchEventHandler );
		}
		
		private function setTouchEventListener():void
		{
			_stageRef.addEventListener( MouseEvent.MOUSE_DOWN , onTouchEventHandler );
			_stageRef.addEventListener( MouseEvent.MOUSE_UP , onTouchEventHandler );
			_stageRef.addEventListener( MouseEvent.MOUSE_MOVE , onTouchEventHandler );
		}
		
		//更新筆頭的位置
		private function updatePenPoint( pos:Point ):void
		{
			if( _currentPen  )
			{
				if ( _currentPen.name != BrushPot.ERASER )
				{
					_bufferPoint = vaildPenPoint( pos );	
				}
				_currentPen.setDrawPoint( _bufferPoint );	
			}
		}
		
		//根據某些工具修正目前筆頭位置.
		private function vaildPenPoint( pos:Point ):Point
		{
			var len:int = measureTools.length;
			for (var i:int = 0; i < len; i++) 
			{
				pos = measureTools[i].adjustDrawPostion(pos);	
			}
			return pos;
		}
		
		private function onTouchEventHandler(e:MouseEvent):void
		{
			if( e.type == MouseEvent.MOUSE_MOVE )
			{
				_bufferPoint.setTo( e.stageX , e.stageY );
				updatePenPoint( _bufferPoint );
			}
		}
	}
}