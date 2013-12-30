package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.GlobalConst;
	import com.ouorange.toolbar.measuretool.MeasureTool;
	import com.ouorange.toolbar.measuretool.MeasureToolManager;
	import com.ouorange.toolbar.SelectedTool;
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class MeasureToolButton extends ToolButton 
	{
		private var measureToolMgr:MeasureToolManager;
		
		private var _selectedTool:SelectedTool;
		
		private var _toolNameMapping:Array;
		
		public function MeasureToolButton(asset:MovieClip) 
		{
			super(asset);
			this.name = ToolBarButtonControl.TOOL_MEASURE
			measureToolMgr = MeasureToolManager.Instatnce;
			
			_selectedTool = new SelectedTool( SelectedTool.TYPE_MEASURE );
			
			_toolNameMapping = new Array();
			_toolNameMapping["ruler_btn1"] = MeasureTool.MEASURE_RIGHTANGLESETSQUARE;
			_toolNameMapping["ruler_btn2"] = MeasureTool.MEASURE_EQUILATERALSETSQUARE;
			_toolNameMapping["ruler_btn3"] = MeasureTool.MEASURE_RULER;
			_toolNameMapping["ruler_btn4"] = MeasureTool.MEASURE_PROTRACTOR;
			
			InitToolButtonEvent();
		}	
		
		//初始化測量工具的按鈕
		private function InitToolButtonEvent():void 
		{
			var btn:MovieClip;
			for (var i:int = 1; i <= 4; i++) 
			{	
				btn = _asset["panel"]["panel"]["ruler_btn" + i];
				if ( btn != null )
				{
					btn.addEventListener( MouseEvent.CLICK , OnAddToolClick );
					btn.buttonMode = true;
				}
			}
		}
		
		override public function ActiveTool():void 
		{
			super.ActiveTool();
		}
		
		override public function DisActiveTool():void 
		{
			super.DisActiveTool();
			measureToolMgr.SetSelectTool( null );
		}
		
		//新增工具按鈕按下
		private function OnAddToolClick( e:MouseEvent ):void
		{
			if ( _toolNameMapping[e.target.name] ) 
			{
				_selectedTool.name = _toolNameMapping[e.target.name];
				measureToolMgr.SetSelectTool( _selectedTool );	
			}
		}
	}
}