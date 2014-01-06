package com.ouorange.toolbar.measuretool 
{
	import com.ouorange.toolbar.CommonMeasureTool;
	import com.ouorange.toolbar.events.TouchSensorEvent;
	import com.ouorange.toolbar.GlobalConst;
	import com.ouorange.toolbar.SelectedTool;
	import com.ouorange.toolbar.ShapeTool;
	import com.ouorange.toolbar.TouchSensorManager;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class MeasureToolManager extends Sprite 
	{		
		private static var instance:MeasureToolManager;
		
		public var allowMultiSelect:Boolean = false;
		
		private var toolCls:Array;
		
		private var enable:Boolean;
		
		private var measureTools:Vector.<CommonMeasureTool>;
		
		private var measureToolLayer:Sprite;
		
		private var selectedTool:SelectedTool;
		
		//互動的面板.
		private var interactiveTarget:Sprite;
		
		public static function get Instatnce():MeasureToolManager 
		{
			return instance;	
		}
		
		public function MeasureToolManager() 
		{
			instance = this;
			
			TouchSensorManager.Instance.addEventListener( TouchSensorEvent.TOUCH_BEGIN , OnTouchHandler );
			
			toolCls = new Array();
			toolCls[MeasureTool.MEASURE_RIGHTANGLESETSQUARE] = RightAngleSetSquare;
			toolCls[MeasureTool.MEASURE_EQUILATERALSETSQUARE] = EquilateralSetSquare;
			toolCls[MeasureTool.MEASURE_RULER] = Ruler;
			toolCls[MeasureTool.MEASURE_PROTRACTOR] = Protractor;
			
			toolCls[ShapeTool.CIRCLE] = getDefinitionByName("circle_mc");
			toolCls[ShapeTool.HEARD] = getDefinitionByName("love_mc");
			toolCls[ShapeTool.POLYGON] = getDefinitionByName("polygon_mc");
			toolCls[ShapeTool.ROUNDSQUARE] = getDefinitionByName("rploy_mc");
			toolCls[ShapeTool.SQUARE] = getDefinitionByName("square_mc");
			toolCls[ShapeTool.STAR] = getDefinitionByName("star_mc");
			toolCls[ShapeTool.TRIANGLE] = getDefinitionByName("triangle_mc");
			
			measureTools = new Vector.<CommonMeasureTool>();
			measureToolLayer = new Sprite();
			addChild( measureToolLayer );
			
			//每個白板都有自已放東西的Layer、我們要能夠區分到底要放哪裏
		}
		
		private function OnTouchHandler(e:TouchSensorEvent):void 
		{
			interactiveTarget = e.sensor;
			UnseletAllTool();
			//trace( "OnTouchHandler:" , interactiveTarget );	
			if ( selectedTool )
			{
				switch (selectedTool.type) 
				{
					case SelectedTool.TYPE_MEASURE:
						AddMeasureToolByName();
					break;
					case SelectedTool.TYPE_SHAPE:
						AddShapeToolByName();
					break;
					default:
				}
			}
		}
		
		public function SetEnable( enable:Boolean ):void
		{
			this.enable = enable;
			this.mouseChildren = this.enable;
			if ( this.enable == false )
			{
				UnseletAllTool();		
			}
			else
			{
				
			}
		}
		
		//點擊到非工具的其它區塊
		private function OnSensorClick(e:MouseEvent):void 
		{
			UnseletAllTool();
		}
		
		//反選所有的測量工具
		public function UnseletAllTool()
		{
			var len = measureTools.length;
			var tool:CommonMeasureTool;
			for (var i:int = 0; i < len; i++) 
			{
				tool = measureTools[i];
				tool.setToolUnselect();
			}
		}
		
		//新增一個測量工具
		public function AddMeasureToolByName():void 
		{
			var toolName:String = selectedTool.name;
			var cls:Class = toolCls[toolName];
			if ( cls )
			{
				AddMeasureTool( new cls() );
			}
		}
		
		//新增一個圖形工具
		public function AddShapeToolByName():void
		{
			var st:ShapeTool;
			var ct:ColorTransform;
			var s:MovieClip;
			var toolName:String = selectedTool.name;
			var cls:Class = toolCls[toolName];
			var type:String = selectedTool.props.shapetype;
			if ( cls )
			{
				s = new cls();
				s.stop();
				ct = new ColorTransform();
				ct.color = selectedTool.props.color;
				s.transform.colorTransform = ct;
				if ( type == ShapeTool.TYPE_EMPTY ) s.gotoAndStop(2);
				st = new ShapeTool( s );
				AddMeasureTool( st );
			}
		}
		
		//增加一個測量工具到場景
		public function AddMeasureTool( tool:CommonMeasureTool )
		{
			tool.addEventListener(CommonMeasureTool.TOOL_SELECTED,OnToolSelected);
			measureTools.push( tool );
			if ( interactiveTarget != null ) 
			{
				interactiveTarget.addChild( tool );
				var p:Point = new Point( mouseX , mouseY );
				p = interactiveTarget.globalToLocal( p );
				tool.x = p.x;
				tool.y = p.y;
			}
		}
		
		//選定一個測量工具
		private function OnToolSelected( e:Event ):void
		{
			CheckMultiSelect( e.target );
			RaiseSelectedToolToTop( e.target );
		}
		
		//提升工具到最上層
		private function RaiseSelectedToolToTop( selectedTool:CommonMeasureTool ):void
		{
			selectedTool.parent.addChild( selectedTool );
			//measureToolLayer.addChild( selectedTool );
		}
		
		//取消其它選取的工具
		public function CheckMultiSelect( selectedTool:CommonMeasureTool ):void
		{
			var len = measureTools.length;
			var tool:CommonMeasureTool;
			if ( allowMultiSelect == false )
			{
				for (var i:int = 0; i < len; i++) 
				{
					tool = measureTools[i];
					if ( tool != selectedTool ) tool.setToolUnselect();
				}
			}
		}
		
		//移除一個測量工具
		public function RemoveMeasureTool( tool:CommonMeasureTool )
		{
			var idx = measureTools.indexOf( tool );
			if ( idx >= 0 )
			{
				measureTools.splice( idx , 1 );
				if ( measureToolLayer.contains( tool ) ) measureToolLayer.removeChild( tool );
			}
		}
		
		//清除全部
		public function ClearALL():void 
		{
			var len:int = measureTools.length;
			var tmpTool:CommonMeasureTool;
			for (var i:int = 0; i < len; i++) 
			{
				tmpTool = measureTools[i];
				tmpTool.parent.removeChild( tmpTool );
			}
			measureTools = new Vector.<CommonMeasureTool>();
		}
		
		//設定目前選用的工具
		public function SetSelectTool(selectedTool:SelectedTool):void 
		{
			this.selectedTool = selectedTool;
			if ( this.selectedTool ) {
				trace( "設定工具:", selectedTool.type , selectedTool.name );
			}
		}
		
		public function get MeasureTools():Vector.<CommonMeasureTool> 
		{
			return measureTools;
		}
	}
}