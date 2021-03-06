package com.ouorange.toolbar.measuretool
{
	import com.senocular.display.TransformTool;
	import com.utils.Trigonometric;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;

	public class EquilateralSetSquare extends MeasureTool
	{
		public function EquilateralSetSquare()
		{
			super();
			init();
		}
		
		private var _assets:DisplayObject;
		
		private var _pointStart:Sprite;
		
		private var _pointEnd:Sprite;
		
		override public function init():void
		{
			_asset = new EquilateralSetSquareAsset();
			_pointStart = _asset['p1'];
			_pointEnd = _asset['p2'];
			addChild( _asset );
			super.init();
		}
		
		override protected function setupTransformToolSkin():void
		{
			transformTool.setSkin( TransformTool.REGISTRATION , _asset['center_mc'] );
			super.setupTransformToolSkin();
		}
		
		override public function adjustDrawPostion(p:Point):Point
		{
			if( _asset.hitTestPoint( p.x , p.y , true ) )
			{
				var tmpPoint:Point = new Point();
				var p1:Point = _pointStart.localToGlobal( tmpPoint )
				var p2:Point = _pointEnd.localToGlobal( tmpPoint );
				p = Trigonometric.closePointFromPointToLine( p1 , p2 , p );
			}
			super.adjustDrawPostion(p);
			return p;
		}
	}
}