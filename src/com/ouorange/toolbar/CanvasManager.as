package com.ouorange.toolbar 
{
	import adobe.utils.CustomActions;
	import com.nocircleno.graffiti.events.GraffitiObjectEvent;
	import com.nocircleno.graffiti.GraffitiCanvas;
	import com.nocircleno.graffiti.tools.BrushTool;
	import com.nocircleno.graffiti.tools.BrushType;
	import com.utils.MathUtil;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class CanvasManager extends Sprite 
	{
		private static var _instance:CanvasManager;
		
		public static function get Instance():CanvasManager
		{
			_instance = _instance || new CanvasManager();
			return _instance;
		}
		
		private var _penCtrl:PenControl;
		//目前所使用的筆.
		private var _curtPen:Pen;
		
		private var _stage:Stage;
		
		private var allCanvas:Vector.<Canvas>;
		
		private var defCanvas:Canvas;
		
		private var _enable:Boolean;
		
		private var _activeCanvas:Canvas;
		
		private var _drawHistory:Vector.<Canvas>;
		
		private var _historyPoint:int = 0;
		
		public function CanvasManager( _stage:Stage ) 
		{
			_instance = this;
			this._stage = _stage;
			allCanvas = new Vector.<Canvas>();
			
			//預設的畫布
			defCanvas = new Canvas(1500, 800, 10);
			defCanvas.name = "default";
			addChild( defCanvas );
			AppendCanvas( defCanvas );
			
			_drawHistory = new Vector.<Canvas>();
			
			_activeCanvas = defCanvas;			
			//_stage.addEventListener(MouseEvent.MOUSE_DOWN , OnStageMouseDown );
			_stage.addEventListener(MouseEvent.MOUSE_UP , OnStageMouseUp );
		}
		
		private function OnStageMouseUp(e:MouseEvent):void 
		{
			//這裏出錯了
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE , OnStageMouseMove );
		}
		
		private function OnStageMouseDown(e:MouseEvent = null):void 
		{
			if ( _enable )
			{
				_stage.addEventListener(MouseEvent.MOUSE_MOVE , OnStageMouseMove );
				if ( _activeCanvas )
				{
					_drawHistory.push( _activeCanvas );
					_historyPoint = _drawHistory.length - 1;
					//trace("add:",_historyPoint);	
				}
			}
		}
		
		public function PrevHistory():void
		{
			if ( _historyPoint < 0 || _drawHistory.length == 0) return;
			VaildHistoryPoint();
			_drawHistory[_historyPoint].canvas.prevHistory();
			_historyPoint--;
			
		}
		
		public function NextHistory():void
		{
			if ( _historyPoint >= _drawHistory.length || _drawHistory.length == 0) return;
			VaildHistoryPoint();
			_drawHistory[_historyPoint].canvas.nextHistory();
			_historyPoint++;
			
		}
		
		private function VaildHistoryPoint():void
		{
			_historyPoint = MathUtil.Clamp( _historyPoint , 0 , _drawHistory.length - 1 );
		}
		
		private function OnStageMouseMove(e:MouseEvent):void 
		{			
			var p:Point = _curtPen.drawPoint;
			p = _activeCanvas.globalToLocal( p );
			
			e.localX = p.x;
			e.localY = p.y;
			
			_activeCanvas.DrawByEvent( e );
		}
		
		public function AppendCanvas( canvas:Canvas )
		{
			if ( CanvasExist( canvas ) ) return;
			canvas.addEventListener( GraffitiObjectEvent.SELECT , OnCanvasSelect , true , 0 , true );
			allCanvas.push( canvas );
		}
		
		public function RemoveCanvas( canvas:Canvas ):void
		{
			if ( CanvasExist( canvas ) )
			{
				var idx:int = allCanvas.indexOf(canvas);
				allCanvas.splice( idx , 1 );
				canvas.Dispose();
			}
		}
		
		private function OnCanvasSelect(e:Event):void 
		{
			OnStageMouseDown();
			_activeCanvas = e.currentTarget;
		}
		
		public function CanvasExist( canvas:Canvas ):Boolean
		{
			return allCanvas.indexOf( canvas ) >= 0 ? true : false;
		}		
		
		public function ClearALL():void 
		{
			var len:int = allCanvas.length;
			_drawHistory = new Vector.<Canvas>();
			for (var i:int = 0; i < len; i++) 
			{
				allCanvas[i].canvas.clearCanvas();
			}
		}
		
		public function get enable():Boolean 
		{
			return _enable;
		}
		
		public function set enable(value:Boolean):void 
		{
			_enable = value;
			var len:int = allCanvas.length;
			for (var i:int = 0; i < len; i++) 
			{
				allCanvas[i].enable = _enable;
			}
			this.mouseChildren = this.mouseEnabled = _enable;
		}
		
		public function set penCtrl(value:PenControl):void 
		{
			_penCtrl = value;
			OnBrushUpdate();
			_penCtrl.addEventListener( PenControl.BRUSH_UPDATE , OnBrushUpdate );
		}
		
		//更新使用的筆刷
		private function OnBrushUpdate(e:Event=null):void 
		{
			_curtPen = _penCtrl.currentPen;
			var len:int = allCanvas.length;
			for (var i:int = 0; i < len; i++) 
			{
				allCanvas[i].SetBrush( _curtPen );
			}
		}
	}
}