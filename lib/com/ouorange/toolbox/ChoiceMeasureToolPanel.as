package com.ouorange.toolbox
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class ChoiceMeasureToolPanel
	{
		private var _assets:MovieClip;
		
		private var _visible:Boolean;
		
		public function ChoiceMeasureToolPanel( assets:DisplayObject )
		{
			_assets = assets;
			init();
		}
		
		public function init():void
		{
			initMeasureTool();
		}
		
		public function initMeasureTool():void
		{
			
		}
		
		public function setVisible( vis:Boolean ):void
		{
			if( _assets ) _assets.visible = vis;
		}
	}
}