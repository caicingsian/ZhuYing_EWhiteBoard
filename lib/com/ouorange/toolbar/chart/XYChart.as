package com.ouorange.toolbar.chart 
{
	import com.greensock.TweenMax;
	import com.ouorange.component.DragableComponent;
	import com.ouorange.toolbar.Canvas;
	import com.ouorange.toolbar.CanvasManager;
	import com.ouorange.toolbar.ChartComponent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class XYChart extends ChartComponent 
	{	
		private var _chartOpened:Boolean;
		
		private var _settingOpened:Boolean;
		
		//顯示按鈕
		private var _showBtn:MovieClip;
		
		//關閉按鈕
		private var _delBtn:MovieClip;
		
		private var _calculator:MovieClip;
		
		private var _scaleBtn:MovieClip;
		
		private var _dragBoard:MovieClip;
		
		private var _settingBtn:MovieClip;
		
		private var _settingPanel:Sprite;
		
		override public function get chart_type():String 
		{
			return ChartComponent.CHART_XY;
		}

		public function XYChart() 
		{
			_asset = new XYChartAsset();
			InitComponent();
			CloseSetting();
			PlayCreatFirstShowFx();
		}
		
		private function PlayCreatFirstShowFx():void
		{
			this.x = 300;
			this.y = 300;
			TweenMax.to( this , 0.5 , { scaleX:1.5, scaleY:1.5 } );
		}
		
		private function InitComponent():void 
		{
			_canvas = new Canvas( 220 , 220 , 10 );
			_canvas.x = 45;
			_canvas.y = 50;
			
			CanvasManager.Instance.AppendCanvas( _canvas );
			
			_showBtn = _asset["xy_btn1"];
			_delBtn = _asset["xy_close"];
			_calculator = _asset["computer"];
			_scaleBtn = _asset["jjbtn"];
			_dragBoard = _asset["__Board"];
			_settingBtn = _asset["set_btn"];
			
			_settingPanel = new Sprite();
			_settingPanel.addChild( _asset["bar_bg"] );
			_settingPanel.addChild( _asset["bar_bg2"] );
			_settingPanel.addChild( _asset["xy_close"] );
			
			//_asset.addChild( _canvas );
			
			InitSettingButton();
			
			var dragComponet:DragableComponent = new DragableComponent( _dragBoard , this );
			dragComponet.enable = true;
			
			CloseSettingOption();
			CloseCalculator();
			
			addChild( _asset );
			addChild( _settingPanel );
			addChild( _canvas );
			
			_dragBoard.addEventListener(MouseEvent.CLICK, function(e):void { trace(2) } );
		}
		
		private function InitSettingButton():void 
		{
			_settingBtn.buttonMode = true;
			_settingBtn.addEventListener(MouseEvent.MOUSE_DOWN, OnSettingTouchHandler);
			
			_delBtn.buttonMode = true;
			_delBtn.addEventListener(MouseEvent.MOUSE_DOWN, OnDeleteTouchHandler);
		}
		
		private function OnDeleteTouchHandler(e:MouseEvent):void 
		{
			RemoveChart();
		}
		
		override public function set sn(value:Number):void 
		{
			super.sn = value;
			_showBtn["__ChartSN"].text = value.toString();
		}
		
		//設定鈕按開關事件
		private function OnSettingTouchHandler(e:MouseEvent):void 
		{
			_settingOpened ? CloseSettingOption() : OpenSettingOption();
		}
		
		private function OpenSettingOption():void
		{
			_settingOpened = true;
			_settingPanel.visible = true;
		}
		
		private function CloseSettingOption():void
		{
			_settingOpened = false;
			_settingPanel.visible = false;
			_calculator.visible = false;
		}
		
		private function OepnCalculator():void 
		{
			_calculator.visible = true;
		}
		
		private function CloseCalculator():void
		{
			_calculator.visible = false;
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