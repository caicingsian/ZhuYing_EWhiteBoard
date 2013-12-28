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
		
		public function DragToolButton(asset:MovieClip) 
		{
			this.name = ToolBarButtonControl.TOOL_DRAG
			super(asset);
			
		}
		
	}

}