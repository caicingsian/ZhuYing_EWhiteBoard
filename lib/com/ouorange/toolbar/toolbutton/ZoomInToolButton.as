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
		
		public function ZoomInToolButton(asset:MovieClip) 
		{
			this.name = ToolBarButtonControl.TOOL_ZOOM_IN
			super(asset);
		}
		
	}

}