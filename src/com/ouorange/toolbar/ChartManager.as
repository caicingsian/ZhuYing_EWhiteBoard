package com.ouorange.toolbar 
{
	import com.greensock.TweenMax;
	import com.ouorange.toolbar.chart.XYChart;
	import flash.display.Sprite;
	import flash.sampler.NewObjectSample;
	
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
		{ 	//改用工廠模式.
			if ( name == ChartComponent.CHART_XY )
			{
				AddChard( new XYChart() );
			}
		}
		
		public function AddChard( chart:ChartComponent ):void
		{
			allChart.push( chart );
			addChild( chart );
			
			chart.sn = GetChartSN( chart );			
		}
		
		private function GetChartSN( chart:ChartComponent ):int
		{
			var sn:int = 1;
			var charts:Vector.<ChartComponent> = GetChartByType( chart );		
			
			for (var i:int = 0; i < charts.length; i++) 
			{
				if ( charts[i].sn == sn ) 
				{
					sn++;
					i = 0;
				}
			}
			return sn;
		}
		
		public function GetChartByType( chart:ChartComponent ):Vector.<ChartComponent>
		{
			var vec:Vector.<ChartComponent> = new Vector.<ChartComponent>();
			var len:int = allChart.length
			for (var i:int = 0; i < len; i++) 
			{
				if ( allChart[i].chart_type == chart.chart_type ) 
				{
					vec.push( allChart[i] );
				}
			}
			return vec;
		}
		
		public function RemoveChart(chart:ChartComponent):void 
		{
			var idx:int = allChart.indexOf( chart );
			if ( idx >= 0 )
			{
				allChart.splice(idx, 1);
				this.removeChild( chart );
			}
		}
	}
}