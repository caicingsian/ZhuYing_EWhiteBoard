package com.ouorange.toolbar
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Pen extends Sprite
	{
		private var _penAsset:Sprite;
		
		//一般來說筆頭會跟随著筆移動、但是如果
//		private var _penDrawHead:Sprite;
		
		private var _drawPoint:Point;
		
		private var _drawPointTexture:Sprite;
		
		public function Pen()
		{
			super();
//			createPenHead();
			_drawPointTexture = new Sprite();
			_drawPointTexture.graphics.lineStyle( 1 , 0 );
			_drawPointTexture.graphics.drawCircle( 0, 0 , 3 );
			_drawPointTexture.graphics.endFill();
			addChild( _drawPointTexture );
		}
		
		public function get drawPoint():Point
		{
			return _drawPoint;
		}

		public function setDrawPoint(p:Point):void
		{
			_drawPoint = p;
			_drawPointTexture.x = _drawPoint.x;
			_drawPointTexture.y = _drawPoint.y;
		}
		
		private function createPenHead():void
		{
			//_penDrawHead = new Sprite();
			//addChild( _penAsset 
		}
	}
}