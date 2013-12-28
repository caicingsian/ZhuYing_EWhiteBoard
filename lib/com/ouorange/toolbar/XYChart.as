package com.ouorange.toolbar 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class XYChart extends ChartComponent 
	{	
		public static var total:Number = 0;
		
		//編號
		private var sn:int;
		
		private var _chartOpened:Boolean;
		
		private var _settingOpened:Boolean;
		
		public function XYChart() 
		{
			total++;
			sn = total;
			_asset = new XYChartAsset();
			addChild( _asset );
			
			InitComponent();
			CloseSetting();
		}
		
		private function InitComponent():void 
		{
				
		}
		
		override public function CloseChart():void 
		{
			
		}
		
		override public function OpenChart():void 
		{
			
		}
		
		public function OpenSetting():void
		{
			
		}
		
		public function CloseSetting():void
		{
			
		}
	}
}