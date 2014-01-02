package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.CanvasManager;
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class PrevHistoryToolButton extends ToolButton 
	{
		public function PrevHistoryToolButton(asset:MovieClip) 
		{
			this.isSingleClick = true;
			this.name = ToolBarButtonControl.TOOL_PREV_HISTORY;
			super(asset);		
		}
		
		override public function ActiveTool():void 
		{
			CanvasManager.Instance.PrevHistory();
		}
	}
}