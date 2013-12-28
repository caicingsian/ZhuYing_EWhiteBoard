package com.ouorange.toolbar 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class ChartManager extends Sprite 
	{
		static private var instance:ChartManager;
		
		static public function get Instance():ChartManager { return instance; }
		
		private var allChart:Vector.<ChartComponent>
		
		public function ChartManager() 
		{
			instance = this;
			allChart = new Vector.<ChartComponent>();
		}
		
		public function addChartByName( name:String ):void
		{ //工廠模式.
			if ( name == ChartComponent.CHART_XY )
			{
				AddChard( new XYChart() );
			}
		}
		
		public function AddChard( chart:ChartComponent ):void
		{
			allChart.push( chart );
			addChild( chart );
		}
	}
}