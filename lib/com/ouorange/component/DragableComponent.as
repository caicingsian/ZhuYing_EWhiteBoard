package com.ouorange.component 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.MouseCursor;
	/**
	 * ...
	 * @author Joe
	 */
	public class DragableComponent 
	{
		private var _target:Sprite;
		
		private var _enable:Boolean;
		
		private var _drager:Sprite;
		
		private var _prevP:Point = new Point();
		
		public function DragableComponent( drager:Sprite , target:Sprite = null) 
		{
			_drager = drager;
			this._target = target || drager;
		}	
		
		public function get enable():Boolean 
		{
			return _enable;
		}
		
		public function set enable(value:Boolean):void 
		{
			_enable = value;
			if ( _enable ) AddListener();
			else RemoveListener();
		}
		
		private function RemoveListener():void
		{
			_target.stopDrag();
			//_drager.stage.removeEventListener( MouseEvent.MOUSE_MOVE , OnMouseMove );
			_drager.stage.removeEventListener( MouseEvent.MOUSE_DOWN , OnMouseDown );
			_drager.stage.removeEventListener( MouseEvent.MOUSE_UP , OnMouseUp );
		}
		
		private function AddListener():void
		{
			//trace( "AddListener" );
			_drager.addEventListener( MouseEvent.MOUSE_DOWN , OnMouseDown , false , 0 , true);
		}
		
		private function OnMouseDown(e:MouseEvent):void 
		{
			_target.startDrag(false);
			//MouseCursor.HAND
			//_drager.stage.addEventListener( MouseEvent.MOUSE_MOVE , OnMouseMove , false , 0 , true);
			_drager.stage.addEventListener( MouseEvent.MOUSE_UP , OnMouseUp , false , 0 , true);
			//_prevP.x = e.stageX;
			//_prevP.y = e.stageY;
		}
		
		private function OnMouseUp(e:MouseEvent):void 
		{
			_target.stopDrag();
			//_drager.stage.removeEventListener( MouseEvent.MOUSE_MOVE , OnMouseMove );
			//_drager.stage.removeEventListener( MouseEvent.MOUSE_UP , OnMouseUp );
		}
		
		private function OnMouseMove(e:MouseEvent):void 
		{
			if ( _target )
			{
				//var os:Point = new Point(e.stageX - _prevP.x, e.stageY - _prevP.y);
				//trace( os );
				//_target.x += ( e.stageX - _prevP.x );
				//_target.y += ( e.stageY - _prevP.y );
				//_prevP.x = e.stageX;
				//_prevP.y = e.stageY;
			}
		}
	}
}