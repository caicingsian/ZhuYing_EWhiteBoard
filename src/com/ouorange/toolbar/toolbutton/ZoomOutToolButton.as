package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ZoomOutToolButton extends ToolButton 
	{
		private var _activeMC:MovieClip;
		
		public function ZoomOutToolButton(asset:MovieClip) 
		{
			super(asset);
			this.name = ToolBarButtonControl.TOOL_ZOOM_OUT
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