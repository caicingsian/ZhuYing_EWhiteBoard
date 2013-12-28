package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class TrashCanToolButton extends ToolButton 
	{
		public function TrashCanToolButton(asset:MovieClip) 
		{
			this.name = ToolBarButtonControl.TOOL_TRASHCAN
			isSingleClick = true;
			super(asset);		
		}
	}

}