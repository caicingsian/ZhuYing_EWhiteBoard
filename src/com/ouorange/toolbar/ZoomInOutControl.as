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
	//------------
    import fl.transitions.easing.*;
	import fl.transitions.Tween;
	
	//------------
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
		
		//-------------------------------------Allen
		private var scale:Number;
        private var nnx:Number;
        private var nny:Number;
	    private var loader_mc_w:Number//原始物件寬
        private var loader_mc_h:Number  //原始物件高
        private var isDown:Boolean = false;
        private var oldX:Number;
        private var oldY:Number;
        private var nowX:Number;
        private var nowY:Number;
        private var hand_var:Boolean = false;
        private var sc_mcX:Number 
        private var sc_mcY:Number
	    private var square:Sprite = new Sprite();
	    private var scale2:Number = 1;
	    private var sw:Number;
	    private var sh:Number;
		private var moveTween:Tween;
		private var click_zoom:Boolean=false  
		
		
		
		
		//------------------------------
		
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
			
			trace("ZoomInOutControl")
			
			//------------------------------------------Allen
			
			//loader_mc_w=sw=_sensor.width  //原始物件寬
            //loader_mc_h=sh=_sensor.height  //原始物件高

            
			sc_mcX = mouseX;
            sc_mcY = mouseY;
			addChild(square);
			
			//loader_mc_w=sw=_target.width  //原始物件寬
            //loader_mc_h=sh=_target.height  //原始物件高
			loader_mc_w=sw=1500  //原始物件寬
            loader_mc_h=sh=800  //原始物件高
			
			//trace("loader_mc_w:"+loader_mc_w)
			//trace("loader_mc_h:"+loader_mc_h)
			
			
			//-----------------------------------------
			
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
			trace("ZoomIn()")
			trace("_target.width:"+_target.width)
			//trace("mouseX:"+mouseX)
			//trace("mouseY:"+mouseY)
			
			
			/*
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
			*/
			
			//-----------------------------------Allen
			


			trace("_target.x:"+_target.x)
			trace("_target.y:"+_target.y)
			trace("_target.width:"+_target.width)
			trace("_target.height:"+_target.height)
			
			
			
			trace("square.width:"+square.width)		
			
			//sw=_target.width
			//sh=_target.height
			
			trace("sw:"+sw)
			
			
			if (square.width > square.height)
	        {
		         scale=sw/(square.width);
	        }
	        else
	        {
		         scale=sh/(square.height);
	        }
	    
		    if (scale==Infinity)
	        {
                 scale = 2;
				 click_zoom=true
				 trace("Infinity")
         	}


	        if (scale> 4)
	        {
		         scale = 4;
	        }


	        if(click_zoom){
				
				
				trace("_target.x - mouseX:"+(_target.x - mouseX))
				trace("_target.x - oldX:"+(_target.x - oldX))
				trace("_target.y - mouseY:"+(_target.y - mouseY))
				trace("_target.y - oldY:"+(_target.y - oldY))
				
				 nnx=_target.x+((_target.x - mouseX)/2)
				 nny=_target.y+((_target.y - mouseY)/2)
				
				
				click_zoom=false
				}else{
			
			if (oldX< mouseX)
	        {

		     nnx = (_target.x - oldX * scale * scale2) ;
	        }
	        else
	        {
		     nnx = (_target.x - mouseX * scale * scale2);
	        }

	        if (oldY < mouseY)
	        {
	       	 nny = (_target.y - oldY * scale * scale2);
	        }
	        else
	        {
		     nny = (_target.y - mouseY * scale * scale2);
	        } 
			
			}
			
			
			
			trace("scale:"+scale)
		    trace("scale2:"+scale2)
          			
			
			scale2 = scale * scale2;

		 

	      if (scale2 < 4.5  &&  int(scale2) >1 )
	      {
             
		     moveTween = new Tween( _target,"scaleX",Strong.easeIn, _target.scaleX, _target.scaleX * int(scale),0.5,true);
		     moveTween = new Tween( _target,"scaleY",Strong.easeIn, _target.scaleY, _target.scaleY * int(scale),0.5,true);

		     moveTween = new Tween( _target ,"x",Strong.easeIn, _target.x,int(nnx),0.5,true);
		     moveTween = new Tween( _target ,"y",Strong.easeIn, _target.y,int(nny),0.5,true);
			 
			
			
	      }
	      else
	      {

		   moveTween = new Tween( _target,"scaleX",Strong.easeIn, _target.scaleX, _target.scaleX * 1.2,0.5,true);
		   moveTween = new Tween( _target,"scaleY",Strong.easeIn, _target.scaleY, _target.scaleY * 1.2,0.5,true);

		   moveTween = new Tween( _target,"x",Strong.easeIn, _target.x,  _target.x+(( _target.width-( _target.width* 1.2))/2 ) ,0.5,true);
		   moveTween = new Tween( _target,"y",Strong.easeIn, _target.y,  _target.y+(( _target.height-( _target.height* 1.2))/2 ) ,0.5,true)
		
		    
	   
	      }
            trace("scale2aa:"+scale2)
        	isDown = false;
	        square.graphics.clear();
			
			trace("nnx:"+nnx)
			
			trace("_target.x2:"+_target.x)
			trace("_target.y2:"+_target.y)

	
			
			//-----------------------------------
			
		}
		
		private function ZoomOut():void
		{
			trace("ZoomOut()")
			/*
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
			*/
			
			_target.width=sw
			_target.height=sh
			_target.x=_target.y=0
			scale2=1
			
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
				oldX = mouseX;
			    oldY = mouseY;
				trace("_target.x:"+_target.x)
				trace("_target.y:"+_target.y)
			}
			
			
			trace("OnMouseUp")
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
			
			//--------------------------Allen
			trace("OnMouseDown")
			trace("_mode:"+_mode )
			if( _mode == MODE_ZOOM_IN){
			isDown = true;
			oldX = mouseX;
			oldY = mouseY;
			}
			//-----------------------------
		}
		
		private var _prevP:Point = new Point();
		
		private function OnMouseMove(e:MouseEvent):void 
		{
			CursorFollow();
			
			if ( _mode == MODE_DRAG && _isDraging ) 
			{
				DragTarget();
			}
			
			//-----------------------------------------------------------Allen


				if (isDown )
				{



					if (nowX < mouseX && nowY < mouseY)
					{
						square.graphics.clear();
						
					}
					if (nowX > mouseX || nowY > mouseY)
					{
						square.graphics.clear();
					}
                    
					
			
					
					
					square.graphics.beginFill(0x000000,0.2);
					
					square.graphics.drawRect(oldX, oldY, mouseX-oldX, mouseY-oldY);
					
					



					nowX = mouseX;
					nowY = mouseY;



				}
			
			//----------------------------------------------------------------------
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
			
			
			square.addEventListener( MouseEvent.MOUSE_UP , OnMouseUp ); // Allen
			
			
		}
		
		private function RemoveListener():void 
		{
			_sensor.removeEventListener( MouseEvent.MOUSE_DOWN , OnMouseDown );
			_sensor.removeEventListener( MouseEvent.MOUSE_UP , OnMouseUp );
			_sensor.removeEventListener( MouseEvent.MOUSE_MOVE , OnMouseMove );
			
			square.removeEventListener( MouseEvent.MOUSE_UP , OnMouseUp ); // Allen
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
