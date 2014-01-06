package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.ToolBarButtonControl;
	import com.ouorange.toolbar.WhiteBoardDirection;
	import com.ouorange.toolbar.WhiteBoardManaer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class WhiteBoardToolButton extends ToolButton 
	{
		private var whiteboardMgr:WhiteBoardManaer;
		
		private var whiteboardMaping:Array;
		
		public function WhiteBoardToolButton(asset:MovieClip) 
		{
			super(asset);
			this.name = ToolBarButtonControl.TOOL_WHITEBOARD
			
			whiteboardMgr = WhiteBoardManaer.Instance;
			
			this.name = ToolBarButtonControl.TOOL_MEASURE
			InitToolButtonEvent();
			
			whiteboardMaping = new Array();
			whiteboardMaping["broad_btn_t"] = WhiteBoardDirection.TOP;
			whiteboardMaping["broad_btn_l"] = WhiteBoardDirection.LEFT;
			whiteboardMaping["broad_btn_c"] = WhiteBoardDirection.CENTER;
			whiteboardMaping["broad_btn_r"] = WhiteBoardDirection.RIGHT;
			whiteboardMaping["broad_btn_b"] = WhiteBoardDirection.BOTTOM;
			
			_size = 30;
		}
		
		private function InitToolButtonEvent():void 
		{
			var btn:MovieClip;
			var bs:Array = ["broad_btn_t", "broad_btn_l", "broad_btn_c", "broad_btn_r", "broad_btn_b"];
			for (var i:int = 0; i < bs.length; i++) 
			{	
				btn = _asset["panel"]["panel"][bs[i]];
				if ( btn != null )
				{
					btn.addEventListener( MouseEvent.CLICK , OnWhiteBoardToggleClick );
					btn.buttonMode = true;
				}
			}
		}
		
		private function OnWhiteBoardToggleClick(e:Event):void 
		{
			var s:String = e.target.name;
			if ( whiteboardMgr )
			{
				whiteboardMgr.ToggleWhiteboard( whiteboardMaping[s] );
			}
		}
	}
}