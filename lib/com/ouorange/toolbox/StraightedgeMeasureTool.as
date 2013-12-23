package com.ouorange.toolbox
{
	import com.ouorange.debug.Logger;
	import com.senocular.display.TransformTool;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;

	public class StraightedgeMeasureTool extends CommonMeasureTool
	{
		public function StraightedgeMeasureTool()
		{
			super();
		}
		
		private var _assets:DisplayObject;
		
		override public function init():void
		{
			var cls:Class = getDefinitionByName("StraightedgeAsset");
			_asset = new cls();
			_asset.x = _asset.y = 200;
			addChild( _asset );
			super.init();
		}
		
		override protected function setupTransformToolSkin():void
		{
			transformTool.setSkin( TransformTool.REGISTRATION , _asset['center_mc'] );
			super.setupTransformToolSkin();
		}
	}
}