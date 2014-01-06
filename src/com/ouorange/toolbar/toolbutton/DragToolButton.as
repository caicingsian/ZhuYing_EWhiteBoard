package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class DragToolButton extends ToolButton 
	{
		private var _activeMC:MovieClip;
		
		public function DragToolButton(asset:MovieClip) 
		{
			super(asset);
			this.name = ToolBarButtonControl.TOOL_DRAG
			_activeMC = asset["__ActiveMC"];
			DisActiveTool();
			_size = 0;
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