package com.ouorange.toolbar.chart 
{
	import com.greensock.TweenMax;
	import com.ouorange.component.CalculatorComponent;
	import com.ouorange.component.DragHelpComponent;
	import com.ouorange.toolbar.Canvas;
	import com.ouorange.toolbar.CanvasManager;
	import com.ouorange.toolbar.ChartComponent;
	import com.utils.MathUtil;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import temple.ui.slider.SliderEvent;
	import temple.ui.slider.StepSlider;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class XYChart extends ChartComponent 
	{	
		private var _chartOpened:Boolean;
		
		private var _settingOpened:Boolean;
		
		private var _toggleBtn:MovieClip; //顯示按鈕
		
		private var _delBtn:MovieClip; //關閉按鈕
		
		private var _calculator:CalculatorComponent;
		
		private var _scaleBtn:MovieClip;
		
		private var _settingBtn:MovieClip;
		
		private var _settingPanel:Sprite;
		
		private var _isOpened:Boolean = true;
		
		private var _chartContent:MovieClip;
		
		private var _colorBar:ColorMarkerBar;
		
		private var _board:MovieClip;
		
		private var _minBorderWidth:Number;
		
		private var _minBorderHeight:Number;
		
		private var _xyAxis:MovieClip;
		
		private var _regP:Point = new Point(42.9, 251.8);
		
		//x軸數量
		private var _columnCount:int = 10;
		//y軸數量
		private var _rowCount:int = 10;
		
		private var _gapX:Number = 10;
		
		private var _gapY:Number = 10;
		
		private var _columnSlider:StepSlider;
		
		private var _rowSlider:StepSlider;
		
		//圖表的大小定義
		private var _chartSize:Rectangle;
		
		private var _chartSensor:Sprite;
		
		private var _curtXYGapTarget:MovieClip;
		
		private const _minGap:Number = 0.1;
		
		private const _maxGap:Number = 99;
		
		override public function get chart_type():String 
		{
			return ChartComponent.CHART_XY;
		}

		public function XYChart() 
		{
			_asset = new XYChartAsset();
			InitComponent();
			CloseSettingOption();
			
			this.x = 900;
			this.y = 100;
			RefreshXYAxis();
			//SetChartSize( _board.width , _board.height );
		}
		
		private function InitComponent():void 
		{
			var dragComponet:DragHelpComponent;
			var tmpSpr:Sprite;
			
			_calculator = new CalculatorComponent( new CalculatorAsset() );
			
			_toggleBtn = _asset["xy_btn1"];
			_delBtn = _asset["xy_close"];
			
			_chartContent = _asset["__Content"];
			
			_board = _chartContent["__Board"];
			_xyAxis = _chartContent["__XYAxis"];
			_chartSensor = _chartContent["__Sensor"];
			
			//新增畫布
			_canvas = new Canvas( _chartSensor.width , _chartSensor.height , 10 );
			_canvas.x = _chartSensor.x;
			_canvas.y = _chartSensor.y;
			CanvasManager.Instance.AppendCanvas( _canvas );
			
			_chartSize = _chartSensor.getRect(_chartContent);
			
			_minBorderWidth = _board.width * 0.5;
			_minBorderHeight = _board.height * 0.5;
			
			_scaleBtn = _chartContent["jjbtn"];
			_scaleBtn.addEventListener( MouseEvent.MOUSE_DOWN , OnScaleDragHandler );
			
			//屬性面板
			_settingBtn = _chartContent["set_btn"];
			_settingPanel = new Sprite();
			_settingPanel.addChild( _asset["__Setting"] );
			
			tmpSpr = _asset["__Setting"]["__XColumn"];
			_columnSlider = new StepSlider( tmpSpr["__thumb"] , tmpSpr.getRect(tmpSpr["__Track"]), 1, 10, 1);
			_columnSlider.value = 10;
			tmpSpr = _asset["__Setting"]["__YColumn"];
			_rowSlider = new StepSlider( tmpSpr["__thumb"] , tmpSpr.getRect(tmpSpr["__Track"]), 1, 10, 1);
			_rowSlider.value = 10;
			
			_asset["__Setting"]["__GapX"].addEventListener(MouseEvent.MOUSE_DOWN, OnXYGapClick );
			_asset["__Setting"]["__GapY"].addEventListener(MouseEvent.MOUSE_DOWN, OnXYGapClick );
			
			_columnSlider.addEventListener(SliderEvent.SLIDING, HandleSliding);
			_rowSlider.addEventListener(SliderEvent.SLIDING, HandleSliding);
			
			InitSettingButton();
			
			_toggleBtn["open_btn"].addEventListener(MouseEvent.MOUSE_DOWN, OnToggleClickHanlder);
			
			//這種方式會被回收掉
			dragComponet = new DragHelpComponent( _toggleBtn , this );
			dragComponet.enable = true;
			
			_colorBar = new ColorMarkerBar( _asset["__Setting"] , _chartContent );
			
			CloseSettingOption();
			
			addChild( _asset );
			addChild( _settingPanel );
			addChild( _calculator );
			
			_chartContent.addChild( _canvas );
		}
		
		//xy單位設定事件
		private function OnXYGapClick(e:MouseEvent):void 
		{
			trace( "OnXYGapClick:",_calculator );
			//要設定的
			_curtXYGapTarget = e.currentTarget;
			_calculator.addEventListener( CalculatorComponent.UPDATE , OnXYGapChange );
			_calculator.Open();
			var p:Point = new Point( e.stageX , e.stageY );
			p = globalToLocal( p );
			_calculator.x = p.x + 50;
			_calculator.y = p.y + 50;
		}
		
		private function OnXYGapChange(e:Event):void 
		{
			var n:Number = _calculator.curNum;
			if ( n == 0 ) return;
			//小數點後一位
			n = uint( n * 10 ) / 10;
			n = MathUtil.Clamp( n , _minGap , _maxGap );	
			_curtXYGapTarget["txt"].text = n;
			if ( _curtXYGapTarget.name == "__GapX" && _gapX != n) {
				_gapX = n;
			} else if ( _curtXYGapTarget.name == "__GapY" && _gapY != n) {
				_gapY = n;
			}
			RefreshXYAxis();
		}
		
		//設定圖表的寬高
		private function SetChartSize( width:uint , height:uint ):void
		{
			width = width < _minBorderWidth ? _minBorderWidth : width;
			height = height < _minBorderHeight ? _minBorderHeight : height;
			
			var ox:int = width - _board.width;
			var oy:int = height - _board.height;
			
			var i:int;
			var line:MovieClip;
			
			if ( ox == 0 && oy == 0 ) return;
			
			_chartSize.width += ox;
			_chartSize.height += oy;
			
			_board.width = width;
			_board.height = height;
			
			_canvas.width += ox;
			_canvas.height += oy;
			
			_xyAxis.width += ox;
			_xyAxis.height += oy;
			
			_chartSensor.width += ox;
			_chartSensor.height += oy;
			
			//0的文字框
			_chartContent["__Zero"].y += oy;
			
			//根據Board的大小、改變UI的位置
			_settingBtn.x = _board.width - 35;
			_delBtn.x = _board.width - 90;
			_scaleBtn.x = _board.width - 25;
			_scaleBtn.y = _board.height - 25;
			
			_colorBar.ShiftMarker( ox , oy );
			//改變線的位置
			for ( i = 1 ; i <= 10 ; i++ ) 
			{
				line = _chartContent["xline" + i];
				line.height += oy;
				line.x += (ox / 10);
				
				line = _chartContent["yline" + i];
				line.width += ox;
			}
			_regP.y += oy;
			
			RefreshXYAxis();
		}
		
		//重新排xy的位置
		private function RefreshXYAxis():void 
		{
			var line:MovieClip;
			var txt:TextField;
			var ox:Number = _chartSize.width / _columnCount;
			var oy:Number = _chartSize.height / _rowCount;
			for ( i = 1 ; i <= 10 ; i++ ) 
			{
				line = _chartContent["xline" + i];
				txt = _chartContent["__Xtxt_" + i];
				if ( i <= _columnCount ) {					
					line.x = _chartSize.x + (i * ox);
					txt.x = line.x - 20;
					txt.y = line.y + line.height;
					txt.visible = true;
					txt.text = FixGapNumber(_gapX * i);
					line.visible = true;
				} else {
					line.visible = false;
					txt.visible = false;
				}
				
				line = _chartContent["yline" + i];
				txt = _chartContent["__Ytxt_" + i];
				if ( i <= _rowCount ) {
					line.y = _chartSize.bottom - (i * oy);
					txt.y = line.y - 10;
					line.visible = true;
					txt.visible = true;
					txt.text = FixGapNumber(_gapY * i);
				} else {
					line.visible = false;
					txt.visible = false;
				}
			}
		}
		
		private function FixGapNumber(n:Number):Number
		{
			n = uint( n * 10 ) / 10;
			//trace( n );
			return n;
		}
		
		private function HandleSliding(e:Event):void 
		{
			_columnCount = _columnSlider.value;
			_rowCount = _rowSlider.value;
			RefreshXYAxis();
		}
		
		private var _scaleDragStart:Boolean;
		private var _dragPrevPoint:Point = new Point();
		private var _bufferP:Point = new Point();
		private var _beginDragWidth:Number;
		private var _beginDragHeight:Number;
		
		private function OnScaleDragHandler(e:MouseEvent):void 
		{
			_bufferP.x = e.stageX;
			_bufferP.y = e.stageY;
			var p:Point;
			if ( e.type == MouseEvent.MOUSE_DOWN ) {
				_scaleDragStart = true;
				stage.addEventListener( MouseEvent.MOUSE_MOVE , OnScaleDragHandler );
				stage.addEventListener( MouseEvent.MOUSE_UP , OnScaleDragHandler );
				_dragPrevPoint = _bufferP;
				_beginDragWidth = _board.width;
				_beginDragHeight = _board.height;
			} else if ( e.type == MouseEvent.MOUSE_MOVE ) {
				//trace( "move" );
				_bufferP = _bufferP.subtract( _dragPrevPoint );
				SetChartSize( _beginDragWidth + _bufferP.x , _beginDragHeight + _bufferP.y );
			} else if ( e.type == MouseEvent.MOUSE_UP ) {
				_scaleDragStart = false;
				stage.removeEventListener( MouseEvent.MOUSE_MOVE , OnScaleDragHandler );
				stage.removeEventListener( MouseEvent.MOUSE_UP , OnScaleDragHandler );
			}
		}
		
		private function OnToggleClickHanlder(e:MouseEvent):void 
		{
			//trace( "_isOpened:" + _isOpened );
			if ( _isOpened ) CloseChart();
			else OpenChart();
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
			CanvasManager.Instance.RemoveCanvas( _canvas );
			RemoveChart();
		}
		
		override public function set sn(value:Number):void 
		{
			super.sn = value;
			_toggleBtn["__ChartSN"].text = value.toString();
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
			_colorBar.SetEnable(true);
		}
		
		private function CloseSettingOption():void
		{
			_settingOpened = false;
			_settingPanel.visible = false;
			_calculator.Close();
			_colorBar.SetEnable(false);
		}
		
		override public function CloseChart():void 
		{
			CloseSettingOption();
			_isOpened = false;
			_chartContent.visible = false;
			_delBtn.visible = false;
		}
		
		override public function OpenChart():void 
		{
			//trace( "OpenChart" );
			_isOpened = true;
			_chartContent.visible = true;
			_delBtn.visible = true;
		}
	}
}
import com.greensock.TweenLite;
import com.greensock.TweenMax;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;

class ColorMarkerBar
{
	private var _enable:Boolean;
	
	private var _activeColorIdx:int = 1;
	
	private var _markers:Array;
	
	private var _holder:MovieClip;
	
	private var _markerCls:Class = __ColorMarker;
	
	private var _chartSize:Rectangle;
	
	private var _chartBound:Rectangle;
	
	private var _chartSensor:MovieClip;
	
	public function ColorMarkerBar( asset:MovieClip, holder:MovieClip ):void
	{
		_markers = new Array();
		var c:MovieClip;
		for (var i:int = 1 ; i <= 6; i++) 
		{
			c = MovieClip(asset["__C" + i]);
			c.addEventListener( MouseEvent.MOUSE_DOWN , OnColorSelect );
			c.gotoAndStop(i);
			c.mouseChildren = false;
		}
		
		_holder = holder;
		_chartSensor = _holder["__Sensor"];
		_chartSize = _chartSensor.getRect(_holder);
		_chartBound = _chartSize.clone();
		_chartBound.width += 30;
		_chartBound.height += 30;
		SetEnable(true);
	}
	
	public function ShiftMarker( vx:Number , vy:Number ):void
	{
		_chartSize.width += vx;
		_chartSize.height += vy;
		
		_chartBound.width += vx;
		_chartBound.height += vy;
		
		var len:int = _markers.length;
		var marker:MovieClip;
		var w:Number = _chartSize.width;
		var h:Number = _chartSize.height;
		for (var i:int = 0; i < len; i++) 
		{
			marker = _markers[i];
			marker.x = _chartSize.x + marker.ratioX * w;
			marker.y = _chartSize.y + marker.ratioY * h;
		}
	}
	
	public function SetEnable( enable:Boolean  ):void
	{
		_enable = enable;
		if ( _enable ) {
			_holder["__Sensor"].addEventListener(MouseEvent.MOUSE_DOWN , OnHolderClick , false , 0 , true);
		} else {
			_holder["__Sensor"].removeEventListener(MouseEvent.MOUSE_DOWN , OnHolderClick );
		}
	}
	
	private function OnHolderClick(e:MouseEvent):void 
	{
		//trace( "OnHolderClick" );
		if ( _markerCls ) 
		{
			var marker:MovieClip = new _markerCls();
			var p:Point = _holder.globalToLocal( new Point(e.stageX, e.stageY) );
			marker.x = p.x;
			marker.y = p.y;
			TweenMax.to( marker , 0.15 , { scaleX:1.5 , scaleY:1.5 , yoyo:true , repeat:1 } );
			marker.ratioX = ( marker.x - _chartSize.x ) / _chartSize.width;
			marker.ratioY = ( marker.y - _chartSize.y ) / _chartSize.height;
			marker.addEventListener(MouseEvent.MOUSE_DOWN, OnMarkerDrag,false,0,true);
			marker.addEventListener(MouseEvent.MOUSE_UP, OnMarkerDrag,false,0,true);
			//trace( "a" , marker.ratioX , marker.ratioY );
			//trace( marker.x , _chartSize.x , _chartSize.width );
			marker.gotoAndStop(_activeColorIdx);
			//_holder.addChildAt( marker , _holder.numChildren-1);
			_holder.addChildAt( marker , _holder.numChildren);
			_markers.push( marker );
		}
	}
	
	private function OnMarkerDrag(e:MouseEvent):void 
	{
		if ( !_enable ) return;
		var marker:MovieClip = e.currentTarget;
		if ( e.type == MouseEvent.MOUSE_DOWN ) {
			marker.startDrag();
		} else {
			//trace( "OnMarkerDrag" );
			marker.stopDrag();
			//trace( "b" , marker.ratioX , marker.ratioY );
			//trace( marker.x , _chartSize.x , _chartSize.width );
			if ( _chartBound.contains( marker.x , marker.y ) ) {
				marker.ratioX = ( marker.x - _chartSize.x ) / _chartSize.width;
				marker.ratioY = ( marker.y - _chartSize.y ) / _chartSize.height;
			} else {
				DestoryMarker(marker);
			}
		}
	}
	
	private function DestoryMarker(marker:MovieClip):void 
	{
		marker.removeEventListener(MouseEvent.MOUSE_DOWN, OnMarkerDrag);
		marker.removeEventListener(MouseEvent.MOUSE_UP, OnMarkerDrag);
		var idx:int = _markers.indexOf( marker );
		if ( idx >= 0 ) _markers.splice(idx, 1);
		TweenLite.to( marker , 0.3 , { alpha:0 , visible:false } );
	}
	
	private function OnColorSelect(e:MouseEvent):void 
	{
		_activeColorIdx = String(e.target.name).replace("__C", "");
	}
}