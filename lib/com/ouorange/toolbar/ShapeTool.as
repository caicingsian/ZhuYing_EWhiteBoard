package com.ouorange.toolbar
{
	import com.ouorange.toolbar.measuretool.CommonMeasureTool;
	import com.senocular.display.TransformTool;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;

	public class ShapeTool extends CommonMeasureTool
	{
		//圖形定義
		public static const SQUARE:String = "SQUARE";
		public static const CIRCLE:String = "CIRCLE";
		public static const TRIANGLE:String = "TRIANGLE";
		public static const STAR:String = "STAR";
		public static const POLYGON:String = "POLYGON";
		public static const ROUNDSQUARE:String = "ROUNDSQUARE";
		public static const HEARD:String = "HEARD";
		
		public static const TYPE_SOLID:String = "TYPE_SOLID";
		public static const TYPE_EMPTY:String = "TYPE_EMPTY";
		
		public function ShapeTool( asset:MovieClip )
		{
			this._asset = asset;
			addChild( _asset );
			init();
		}

		override protected function setupTransformToolSkin():void
		{
			transformTool.setSkin( TransformTool.REGISTRATION , _asset['center_mc'] );
			super.setupTransformToolSkin();
		}
	}
}