package com.ouorange.toolbar.toolbutton 
{
	import com.utils.MathUtil;
	import com.utils.Trigonometric;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ToolBrushSize extends EventDispatcher
	{
		public static const SIZE_UPDATE:String = "SIZE_UPDATE";
		
		private var _asset:MovieClip;
		
		private var _curtSize:Number = 3;
		
		private var _brushSlider:MovieClip;
		
		private var _brushThumb:MovieClip;
		
		private var _stage:Stage;
		
		private var _maxSize:Number = 8;
		
		private var _minSize:Number = 1;
		
		public function ToolBrushSize( asset:MovieClip ) 
		{
			this._asset = asset;
			_brushSlider = this._asset["__Slider"];
			_brushThumb = this._asset["__Thumb"];
			_brushThumb.buttonMode = true;
			_brushThumb.mouseChildren = false;
			_brushThumb.addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
			this._asset.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			RefreshSizeAngle();
		}
		
		private function onAddToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			_stage = _asset.stage;
		}
		
		private function OnMouseDown(e:MouseEvent):void 
		{
			if ( _stage )
			{
				_stage.addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
				_stage.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			}
		}
		
		private function OnMouseUp(e:MouseEvent):void 
		{
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
		}
		
		private function OnMouseMove(e:MouseEvent):void 
		{
			var p:Point = new Point( e.stageX , e.stageY );
			p = _asset.globalToLocal( p );
			var a:Number = Math.atan2( p.y , p.x ); 
			var d:Number = Trigonometric.radian2degree( a );
			
			d = MathUtil.Clamp( d , -130 , -50 );

			p = Trigonometric.degreeEdge2Point(d, 47);
			_brushThumb.x = p.x;
			_brushThumb.y = p.y;
			
			var pp:Number = 1 - ( Math.abs(d) - 50 ) / 80;
				
			UpdateSize( uint( pp * _maxSize ) + 1 );
		}
		
		private function RefreshSizeAngle():void
		{
			var degree:Number = -130 + ( _curtSize - 1 ) * ( 80 / 9 );
			var p:Point = Trigonometric.degreeEdge2Point(degree, 47);
			_brushThumb.x = p.x;
			_brushThumb.y = p.y;
			UpdateSize(_curtSize,true);
		}
		
		private function UpdateSize( size:Number , force:Boolean = false ):void
		{
			if ( _curtSize != size || force )
			{
				_curtSize = size;
				_brushSlider.gotoAndStop(_curtSize);
				UpdateSizeLabel();
				this.dispatchEvent( new Event( SIZE_UPDATE ) );
			}
		}
		
		private function UpdateSizeLabel():void
		{
			_brushThumb["__Size"].text = _curtSize.toString();
		}
		
		public function SetBrushColor( color:uint ):void
		{
			var ct:ColorTransform = new ColorTransform();
			ct.color = color;
			_brushSlider.transform.colorTransform = ct;
		}
		
		public function get curtSize():Number 
		{
			return _curtSize;
		}
	}
}