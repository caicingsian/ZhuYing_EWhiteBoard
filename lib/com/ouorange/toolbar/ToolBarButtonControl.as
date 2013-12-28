package com.ouorange.toolbar 
{
	import adobe.utils.CustomActions;
	import com.ouorange.toolbar.toolbutton.DragToolButton;
	import com.ouorange.toolbar.toolbutton.DrawShapeToolButton;
	import com.ouorange.toolbar.toolbutton.EraseToolButton;
	import com.ouorange.toolbar.toolbutton.HighLightToolButton;
	import com.ouorange.toolbar.toolbutton.MeasureToolButton;
	import com.ouorange.toolbar.toolbutton.NextHistoryToolButton;
	import com.ouorange.toolbar.toolbutton.PencilToolButton;
	import com.ouorange.toolbar.toolbutton.PrevHistoryToolButton;
	import com.ouorange.toolbar.toolbutton.ToolBarToggleButton;
	import com.ouorange.toolbar.toolbutton.ToolButton;
	import com.ouorange.toolbar.toolbutton.TrashCanToolButton;
	import com.ouorange.toolbar.toolbutton.WhiteBoardToolButton;
	import com.ouorange.toolbar.toolbutton.ChartToolButton;
	import com.ouorange.toolbar.toolbutton.ZoomInToolButton;
	import com.ouorange.toolbar.toolbutton.ZoomOutToolButton;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ToolBarButtonControl extends Sprite
	{
		public static const TOOL_TOGGLE:String = "TOOL_TOGGLE";
		public static const TOOL_DRAW_SHAPE:String = "TOOL_DRAW_SHAPE";
		public static const TOOL_XYCOMPOMENT:String = "TOOL_XYCOMPOMENT";
		public static const TOOL_MEASURE:String = "TOOL_MEASURE";
		public static const TOOL_PENCIL:String = "TOOL_PENCIL";
		public static const TOOL_HIGHLIGHT:String = "TOOL_HIGHLIGHT";
		public static const TOOL_ERASE:String = "TOOL_ERASE";
		public static const TOOL_ZOOM_OUT:String = "TOOL_ZOOM_OUT";
		public static const TOOL_DRAG:String = "TOOL_DRAG";
		public static const TOOL_ZOOM_IN:String = "TOOL_ZOOM_IN";
		public static const TOOL_PREV_HISTORY:String = "TOOL_PREV_HISTORY";
		public static const TOOL_NEXT_HISTORY:String = "TOOL_NEXT_HISTORY";
		public static const TOOL_WHITEBOARD:String = "TOOL_WHITEBOARD";
		public static const TOOL_TRASHCAN:String = "TOOL_TRASHCAN";
		
		private var _asset:MovieClip;
		
		private var _activeToolButton:Sprite;
		
		private var _toolButtons:Vector.<ToolButton>;
		
		private var _prevActiveTool:ToolButton;
		
		public function ToolBarButtonControl( asset:MovieClip ) 
		{
			_asset = asset;			
			_toolButtons = new Vector.<ToolButton>();
			AppendToolButton( new ToolBarToggleButton(_asset["tool_btn"]) );
			AppendToolButton( new DrawShapeToolButton(_asset["btn1"]) );
			AppendToolButton( new ChartToolButton(_asset["btn2"]) );
			AppendToolButton( new MeasureToolButton(_asset["btn3"]) );
			AppendToolButton( new PencilToolButton(_asset["btn4"]) );
			AppendToolButton( new HighLightToolButton(_asset["btn5"]) );
			AppendToolButton( new EraseToolButton(_asset["btn6"]) );
			AppendToolButton( new ZoomOutToolButton(_asset["btn7"]) );
			AppendToolButton( new DragToolButton(_asset["btn8"]) );
			AppendToolButton( new ZoomInToolButton(_asset["btn9"]) );
			AppendToolButton( new PrevHistoryToolButton(_asset["btn12"]) );
			AppendToolButton( new NextHistoryToolButton(_asset["btn13"]) );
			AppendToolButton( new WhiteBoardToolButton(_asset["btn10"]) );
			AppendToolButton( new TrashCanToolButton(_asset["btn11"]) );
		}
		
		public function AppendToolButton( button:ToolButton ):void
		{
			addChild( button );
			button.addEventListener( ToolButton.TOOL_ACTIVED , OnToolActived );
			_toolButtons.push( button );
		}
		
		private function OnToolActived(e:Event):void 
		{
			var tool:ToolButton = e.target;
			if ( _prevActiveTool && _prevActiveTool != tool )
			{
				_prevActiveTool.DisActiveTool();
			}
			_prevActiveTool = tool;
			addChild( tool );
		}
		
		public function ArrangeToolButton():void
		{
			
		}
	}
}