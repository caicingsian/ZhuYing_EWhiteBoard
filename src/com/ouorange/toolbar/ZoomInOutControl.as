package com.ouorange.toolbar 
{
	import com.greensock.easing.Linear;
	import com.greensock.easing.Power0;
	import com.greensock.TweenMax;
	import com.utils.DisplayObjectUtil;
	import com.utils.MathUtil;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.sampler.NewObjectSample;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ZoomInOutControl extends Sprite
	{
		public static const MODE_DRAG:String = "MODE_DRAG";
		
		public static const MODE_ZOOM_IN:String = "MODE_ZOOM_IN";
		
		public static const MODE_ZOOM_OUT:String = "MODE_ZOOM_OUT";
		
		private const MAX_RATIO:Number = 5;
		
		private const MIN_RATIO:Number = 0.1;
		
		private var _target:DisplayObject;
		
		private var _enable:Boolean;
		
		private var _mode:String = MODE_ZOOM_IN;
		
		private var _curtCursor:MouseCursor;
		
		private var _curs:Vector.<MouseCursor>;
		
		private var _zoomRect:Rectangle;
		
		private var _zoomDrawer:Sprite;
		
		private var _isDrawing:Boolean;
		
		private var _isDraging:Boolean;
		
		private var _sensor:Sprite;
		
		public function ZoomInOutControl( target:DisplayObject )
		{
			this.name = "ZoomInOutControl";
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
			_target = target;
			_curs = new Vector.<MouseCursor>();
			_zoomRect = new Rectangle();
			_zoomDrawer = new Sprite();
			
			_sensor = new Sprite();
			_sensor.graphics.beginFill( 0xFF0000 , 0 );
			_sensor.graphics.drawRect( 0 , 0 , 1500 , 850 );
			_sensor.graphics.endFill();
			
			_zoomDrawer.mouseChildren = _zoomDrawer.mouseEnabled = false;
			
			addChild( _sensor );
			addChild( _zoomDrawer );
		}
		
		private function OnAddToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
			SetEnable(false);
			UpdateCursor();
		}
		
		public function SetCursor( mode:String , asset:MovieClip ):void
		{
			var len:int = _curs.length;
			var cursor:MouseCursor;
			for (var i:int = 0; i < len; i++) 
			{
				if ( _curs[i].name == mode ) {
					_curs[i].asset = asset;
					return;
				}
			}
			cursor = new MouseCursor( mode , asset );
			_curs.push( cursor );
			this.addChild( cursor );
			//DisplayObjectUtil.ShowDisplayObjectHirachy( cursor.asset );
		}
		
		public function SetEnable( bol:Boolean ):void
		{
			_enable = bol;
			_enable ? AddListener() : RemoveListener();
			SetAllCursorVisible(_enable);
			this.mouseChildren = this.mouseEnabled = _enable;
		}
		
		private function SetAllCursorVisible( visible:Boolean ):void
		{
			var len:int = _curs.length;
			for (var i:int = 0; i < len; i++) 
			{
				_curs[i].visible = visible;
			}
		}		
		
		public function SetMode( mode:String ):void
		{
			_isDraging = _isDrawing = false;
			_mode = mode;
			UpdateCursor();
		}
		
		private function UpdateCursor():void
		{
			var len:int = _curs.length;
			for (var i:int = 0; i < len; i++) 
			{
				if ( _curs[i].name == _mode ) {
					_curs[i].visible = true;
					_curtCursor = _curs[i];
				} else {
					_curs[i].visible = false;
				}
			}
		}
		
		private function ZoomIn():void
		{
			scaleXRatio = _target.scaleX * 1.2;
			scaleXRatio = MathUtil.Clamp( scaleXRatio , MIN_RATIO , MAX_RATIO );
			//x:_target.x - shiftX ,
			//y:_target.y - shiftY,
			TweenMax.to( _target , 0.3 , 
			{
				
				scaleX:scaleXRatio,
				scaleY:scaleXRatio,
				ease:Linear.easeNone
			} );
			
			return;
			var p1:Point = new Point( _zoomRect.x , _zoomRect.y );
			var p2:Point = new Point( _zoomRect.right , _zoomRect.bottom );
			
			//長寬
			var offSet:Point = p2.subtract( p1 );
			//選取範圍的中心點
			var center:Point = p1.add( new Point( ( (p2.x - p1.x) * 0.5 ) , ( (p2.y - p1.y) * 0.5 ) ) );
			
			var shiftX:Number = 0;
			var shiftY:Number = 0;
			
			var scaleXRatio:Number = _target.scaleY * ( ( stage.stageHeight * 1 ) / _zoomRect.height );
			
			scaleXRatio = scaleXRatio * _target.scaleX;
			scaleXRatio = MathUtil.Clamp( scaleXRatio , MIN_RATIO , MAX_RATIO );
			
			shiftX = ( _zoomRect.width * scaleXRatio - _zoomRect.width ) * 0.5;
			shiftY = ( _zoomRect.height * scaleXRatio - _zoomRect.height ) * 0.5;
			
			if ( _target.scaleX == scaleXRatio ) return;
			
			TweenMax.to( _target , 0.3 , 
			{
				x:_target.x - shiftX , y:_target.y - shiftY,
				scaleX:scaleXRatio, scaleY:scaleXRatio				
			} );
		}
		
		private function ZoomOut():void
		{
			scaleXRatio = _target.scaleX * 0.8;
			scaleXRatio = MathUtil.Clamp( scaleXRatio , MIN_RATIO , MAX_RATIO );
			
			var shiftX:Number = 0;
			var shiftY:Number = 0;
			//x:_target.x - shiftX ,
				//y:_target.y - shiftY,
			TweenMax.to( _target , 0.3 , 
			{
				
				scaleX:scaleXRatio,
				scaleY:scaleXRatio,
				ease:Linear.easeNone
			} );
		}
		
		private function OnMouseUp(e:MouseEvent):void 
		{
			_isDrawing = false;
			_zoomDrawer.graphics.clear();
			
			if ( _mode == MODE_ZOOM_IN ) ZoomIn();
			if ( _mode == MODE_ZOOM_OUT ) ZoomOut();
			if ( _mode == MODE_DRAG ) 
			{
				_isDraging = false;
			}
		}
		
		private function OnMouseDown(e:MouseEvent):void 
		{
			_isDrawing = true;
			_isDraging = true;
			_zoomRect.setEmpty();
			_zoomRect.x = mouseX;
			_zoomRect.y = mouseY;
			_prevP.x = mouseX;
			_prevP.y = mouseY;
		}
		
		private var _prevP:Point = new Point();
		
		private function OnMouseMove(e:MouseEvent):void 
		{
			CursorFollow();
			
			if ( _mode == MODE_DRAG && _isDraging ) 
			{
				DragTarget();
			}
		}
		
		private function CursorFollow():void
		{
			if ( _curtCursor ) 
			{
				var curtX:Number = mouseX;
				var curtY:Number = mouseY;
				_curtCursor.x = curtX;
				_curtCursor.y = curtY;
			}
		}
		
		private function DragTarget():void
		{
			_target.x += mouseX - _prevP.x;
			_target.y += mouseY - _prevP.y;
			_prevP.x = mouseX;
			_prevP.y = mouseY;
		}
		
		private function RenderZoomRect():void
		{
			_zoomDrawer.graphics.clear();
			_zoomDrawer.graphics.lineStyle( 2 , 0xFFFFFF );
			_zoomDrawer.graphics.beginFill( 0x000000 , 0.5 );
			_zoomDrawer.graphics.drawRect( _zoomRect.x , _zoomRect.y , _zoomRect.width, _zoomRect.height );
			_zoomDrawer.graphics.endFill();
		}
		
		private function AddListener():void 
		{
			_sensor.addEventListener( MouseEvent.MOUSE_DOWN , OnMouseDown );
			_sensor.addEventListener( MouseEvent.MOUSE_UP , OnMouseUp );
			_sensor.addEventListener( MouseEvent.MOUSE_MOVE , OnMouseMove );
		}
		
		private function RemoveListener():void 
		{
			_sensor.removeEventListener( MouseEvent.MOUSE_DOWN , OnMouseDown );
			_sensor.removeEventListener( MouseEvent.MOUSE_UP , OnMouseUp );
			_sensor.removeEventListener( MouseEvent.MOUSE_MOVE , OnMouseMove );
		}
	}
}

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;

class MouseCursor extends Sprite
{
	private var _asset:MovieClip;
	
	public function MouseCursor( name:String , asset:MovieClip )
	{
		this.mouseChildren = this.mouseEnabled = false;
		this.name = name;
		this.asset = asset;
	}
	
	public function set asset(value:MovieClip):void 
	{
		if ( _asset ) this.removeChild( _asset );
		_asset = value;
		_asset.x = 0;
		_asset.y = 0;
		this.addChild( _asset );
	}
	
	public function get asset():MovieClip 
	{
		return _asset;
	}
}