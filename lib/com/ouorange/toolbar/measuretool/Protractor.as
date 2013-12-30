package com.ouorange.toolbar.measuretool
{
	import com.senocular.display.TransformTool;
	import com.utils.Trigonometric;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	

	public class Protractor extends MeasureTool
	{
		public function Protractor()
		{
			init();
		}
		
		private var _assets:DisplayObject;
		
		private var _centorPoint:Sprite;
		
		private var _edgePoint:Sprite;
		
		override public function init():void
		{
			_asset = new ProtractorAsset();
			_centorPoint = _asset["p1"];
			_edgePoint = _asset["p2"];
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
				var p1:Point = _centorPoint.localToGlobal( tmpPoint );
				var p2:Point = _edgePoint.localToGlobal( tmpPoint );
				
				//求斜率
				var radian:Number = Trigonometric.getAngle( p1 , p );
				
				//求距離
				var distance:Number = Point.distance( p1 , p2 );
				
				//計算邊界上的點
				p = Trigonometric.radianEdge2Point( radian , distance );
				
				p = p.add( p1 );				
			}
			super.adjustDrawPostion(p);
			return p;
		}
	}
}