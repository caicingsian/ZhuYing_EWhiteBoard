package com.ouorange.toolbox
{
	import com.ouorange.debug.Logger;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.printing.PrintJob;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;

	public class MeasureToolManager extends Sprite
	{
		public function MeasureToolManager()
		{
			init();
		}
		
		private var _enable:Boolean = false;
			
		private var _swithToolButton:MovieClip;
				
		private var _measurePanel:ChoiceMeasureToolPanel;
		
		private var _toolContainer:Sprite;
				
		public function get enable():Boolean
		{
			return _enable;
		}
		
		public function set enable(value:Boolean):void
		{
			_enable = value;
			setMeasurePanelVisible(value);
		}
		
		public function init()
		{
			try
			{   
				//get MainTimeline
				var mainTimeLine:MovieClip = ToolBox.stageRef.getChildAt(0) as MovieClip;
				_swithToolButton = mainTimeLine.getChildByName("btn3");
				_measurePanel = new ChoiceMeasureToolPanel( mainTimeLine.getChildByName("ruler_mc") );
				_swithToolButton.buttonMode = true;
				_toolContainer = new Sprite();
				addChild( _toolContainer );				
				addBtnListener();
				enable = false;
				testMeasureTool();
			} 
			catch(error:Error) 
			{
				trace( "Measure Tool init Error:" + error.getStackTrace() );
			}
		}
		
		public function setAllMeasureToolUnselect():void
		{
			for (var i:int = 0; i < _toolContainer.numChildren ; i++) 
			{
				var tool:CommonMeasureTool = _toolContainer.getChildAt(i) as CommonMeasureTool;
				tool.setUnselect();
			}
		}
		
		public function testMeasureTool():void
		{
			placeMeasureToolToStage( new StraightedgeMeasureTool() );
		}
		
		public function placeMeasureToolToStage( tool:CommonMeasureTool ):void
		{
			_toolContainer.addChild( tool );
			tool.init();
		}
		
		public function setMeasurePanelVisible(vis:Boolean):void
		{
			_measurePanel.setVisible(vis);
		}
		
		public function switchToolEnable():void
		{
			enable = !_enable;
		}
		
		private function addBtnListener():void
		{
			if( _swithToolButton != null ) _swithToolButton.addEventListener( MouseEvent.CLICK , onSwithToolButtonClick );
		}
		
		private function onSwithToolButtonClick(e:MouseEvent):void
		{
			switchToolEnable();
		}
	}
}