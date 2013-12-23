package com.ouorange.toolbar.measuretool
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	public class ChoiceMeasureToolPanel
	{
		private var _assets:MovieClip;
		
		private var _visible:Boolean;
		
		public function ChoiceMeasureToolPanel( assets:DisplayObject )
		{
			_assets = assets as MovieClip;
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