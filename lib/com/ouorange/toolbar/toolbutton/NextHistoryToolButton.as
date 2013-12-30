package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class NextHistoryToolButton extends ToolButton 
	{
		public function NextHistoryToolButton(asset:MovieClip) 
		{
			this.isSingleClick = true;
			this.name = ToolBarButtonControl.TOOL_NEXT_HISTORY;
			super(asset);
		}
	}

}