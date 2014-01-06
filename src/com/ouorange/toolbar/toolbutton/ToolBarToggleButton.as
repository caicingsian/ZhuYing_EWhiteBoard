package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ToolBarToggleButton extends ToolButton 
	{
		public function ToolBarToggleButton(asset:MovieClip) 
		{
			this.name = ToolBarButtonControl.TOOL_TOGGLE;
			super(asset);
			isSingleClick = true;
		}	
	}
}