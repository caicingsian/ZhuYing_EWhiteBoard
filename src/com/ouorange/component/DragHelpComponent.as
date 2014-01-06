package com.ouorange.component 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.MouseCursor;
	/**
	 * ...
	 * @author Joe
	 */
	public class DragHelpComponent extends Sprite
	{
		private var _target:Sprite;
		
		private var _enable:Boolean;
		
		private var _drager:Sprite;
		
		private var _prevP:Point = new Point();
		
		public function DragHelpComponent( drager:Sprite , target:Sprite = null) 
		{
			_drager = drager;
			this._target = target || drager;
			
			_drager.addEventListener(Event.REMOVED_FROM_STAGE, OnRemoved );
		}	
		
		private function OnRemoved(e:Event):void 
		{
			_drager.removeEventListener(Event.REMOVED_FROM_STAGE, OnRemoved);
			Dispose();
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
		
		public function Dispose():void
		{
			RemoveListener();
			_drager = null;
			_target = null;
		}
		
		private function RemoveListener():void
		{
			_target.stopDrag();
			_drager.stage.removeEventListener( MouseEvent.MOUSE_DOWN , OnMouseDown );
			_drager.stage.removeEventListener( MouseEvent.MOUSE_UP , OnMouseUp );
		}
		
		private function AddListener():void
		{
			_drager.addEventListener( MouseEvent.MOUSE_DOWN , OnMouseDown );
		}
		
		private function OnMouseDown(e:MouseEvent):void 
		{
			_target.startDrag(false);
			_drager.stage.addEventListener( MouseEvent.MOUSE_UP , OnMouseUp );
		}
		
		private function OnMouseUp(e:MouseEvent):void 
		{
			_target.stopDrag();
		}
		
		private function OnMouseMove(e:MouseEvent):void 
		{
			
		}
	}
}