package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.ChartComponent;
	import com.ouorange.toolbar.ChartManager;
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ChartToolButton extends ToolButton 
	{
		private var _chartManager:ChartManager;
		
		public function ChartToolButton(asset:MovieClip) 
		{
			super(asset);
			this.name = ToolBarButtonControl.TOOL_XYCOMPOMENT;
			_chartManager = ChartManager.Instance;
			isSingleClick = true;
			_size = 0;
		}
		
		override public function ActiveTool():void 
		{
			super.ActiveTool();
			_chartManager.addChartByName( ChartComponent.CHART_XY );
		}
	}
}