package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ZoomInToolButton extends ToolButton
	{
		private var _activeMC:MovieClip;
		
		public function ZoomInToolButton(asset:MovieClip) 
		{
			super(asset);
			this.name = ToolBarButtonControl.TOOL_ZOOM_IN
			_activeMC = asset["__ActiveMC"];
			DisActiveTool();
		}
		
		override public function ActiveTool():void 
		{
			super.ActiveTool();
			_activeMC.visible = true;
		}
		
		override public function DisActiveTool():void 
		{
			super.DisActiveTool();
			_activeMC.visible = false;
		}
	}
}