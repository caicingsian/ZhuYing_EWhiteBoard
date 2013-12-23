package com.ouorange.toolbar
{
	import com.ouorange.toolbar.measuretool.CommonMeasureTool;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class PenControl
	{
		private var _currentPen:Pen;
		
		private var _enable:Boolean;
		
		private var _isTouchStart:Boolean;
		
		private var _stageRef:Stage;
		
		private var _bufferPoint:Point;
		
		private var _measureTools:Vector.<CommonMeasureTool>;
		
		public function PenControl( stage:Stage )
		{
			_stageRef = stage;
			_bufferPoint = new Point();
			_measureTools = new Vector.<CommonMeasureTool>();
		}
		
		public function appendMeasureTool( tool:CommonMeasureTool ):void
		{
			_measureTools.push( tool );
		}
		
		public function removeMeasureTool( tool:CommonMeasureTool ):void
		{
			
		}
		
		public function get enable():Boolean
		{
			return _enable;
		}

		public function set enable(value:Boolean):void
		{
			_enable = value;
			if( _enable ) setTouchEventListener();
			else stopTouchEventListener();
		}

		public function setCurrentPen(pen:Pen):void
		{
			_currentPen = pen;
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
		
		private function updatePenPoint( pos:Point ):void
		{
			_bufferPoint = vaildPenPoint( pos );
			//darw on the canvas by point.
			if( _currentPen )
			{
				_currentPen.setDrawPoint( _bufferPoint );	
			}
		}
		
		private function vaildPenPoint( pos:Point ):Point
		{
			var len:int = _measureTools.length;
			for (var i:int = 0; i < len; i++) 
			{
				pos = _measureTools[i].adjustDrawPostion(pos);	
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