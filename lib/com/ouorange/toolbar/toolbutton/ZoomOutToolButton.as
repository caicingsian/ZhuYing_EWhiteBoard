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
		public function ZoomOutToolButton(asset:MovieClip) 
		{
			this.name = ToolBarButtonControl.TOOL_ZOOM_OUT
			super(asset);
			
		}	
	}
}