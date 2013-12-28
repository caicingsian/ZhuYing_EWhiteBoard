package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.GlobalConst;
	import com.ouorange.toolbar.measuretool.MeasureToolManager;
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
		
		private var _selectedTool:String;
		
		private var _interactiveSensor:Sprite;
		
		public function MeasureToolButton(asset:MovieClip) 
		{
			super(asset);
			_interactiveSensor = GlobalConst.APP_INTERACTIVE_SENSOR;
			
			_asset = asset;
			measureToolMgr = MeasureToolManager.Instatnce;
			this.name = ToolBarButtonControl.TOOL_MEASURE
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
			_interactiveSensor.addEventListener( MouseEvent.CLICK , OnScreenClick );
		}
		
		override public function DisActiveTool():void 
		{
			super.DisActiveTool();
			_selectedTool = null;
			_interactiveSensor.removeEventListener( MouseEvent.CLICK , OnScreenClick );
		}
		
		private function OnScreenClick(e:MouseEvent):void 
		{
			trace( "OnScreenClick" );
			if( _selectedTool && measureToolMgr )
			{
				measureToolMgr.AddMeasureToolByName( _selectedTool );
			}
		}
		
		//新增工具按鈕按下
		private function OnAddToolClick( e:MouseEvent ):void
		{
			_selectedTool = e.target.name;
		}
	}
}