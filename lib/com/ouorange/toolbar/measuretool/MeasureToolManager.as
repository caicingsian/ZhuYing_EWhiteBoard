package com.ouorange.toolbar.measuretool 
{
	import com.ouorange.toolbar.CommonMeasureTool;
	import com.ouorange.toolbar.GlobalConst;
	import com.ouorange.toolbar.ShapeTool;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class MeasureToolManager extends Sprite 
	{		
		private static var instance:MeasureToolManager;
		
		public var allowMultiSelect:Boolean = false;
		
		//private var assets:MovieClip;
		
		private var toolCls:Array;
		
		private var enable:Boolean;
		
		private var measureTools:Vector.<CommonMeasureTool>;
		
		private var measureToolLayer:Sprite;
		
		private var interactiveSensor:Sprite;
		
		public static function get Instatnce():MeasureToolManager 
		{
			return instance;	
		}
		
		public function MeasureToolManager() 
		{
			instance = this;
			//這個方法在處理左右白板的時候會失效.
			interactiveSensor = GlobalConst.APP_INTERACTIVE_SENSOR;
			
			toolCls = new Array();
			toolCls["ruler_btn1"] = RightAngleSetSquare;
			toolCls["ruler_btn2"] = EquilateralSetSquare;
			toolCls["ruler_btn3"] = Ruler;
			toolCls["ruler_btn4"] = Protractor;
			
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
			
			super();
		}
		
		public function SetEnable( enable:Boolean ):void
		{
			//trace( "enable:" , enable );
			this.enable = enable;
			this.mouseChildren = this.enable;
			if ( this.enable == false )
			{
				UnseletAllTool();
				interactiveSensor.removeEventListener( MouseEvent.CLICK , OnSensorClick );
			}
			else
			{
				interactiveSensor.addEventListener( MouseEvent.CLICK , OnSensorClick );
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
		public function AddMeasureToolByName(toolName:String):void 
		{
			//trace( "AddMeasureToolByName:" + toolName );
			var cls:Class = toolCls[toolName];
			if ( cls )
			{
				AddMeasureTool( new cls() );
			}
		}
		
		//新增一個圖形工具
		public function AddShapeToolByName(toolName:String,color:uint,type:String):void
		{
			var cls:Class = toolCls[toolName];
			if ( cls )
			{
				var s:MovieClip = new cls();
				s.stop();
				var ct:ColorTransform = new ColorTransform();
				ct.color = color;
				s.transform.colorTransform = ct;
				if ( type == ShapeTool.TYPE_EMPTY ) s.gotoAndStop(2);
				var st:ShapeTool = new ShapeTool( s );
				AddMeasureTool( st );
			}
		}
		
		//增加一個測量工具到場景
		public function AddMeasureTool( tool:CommonMeasureTool )
		{
			//trace( "AddMeasureTool" );
			tool.addEventListener(CommonMeasureTool.TOOL_SELECTED,OnToolSelected);
			measureTools.push( tool );
			measureToolLayer.addChild( tool );
			tool.x = mouseX;
			tool.y = mouseY;
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
			measureToolLayer.addChild( selectedTool );
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
			measureTools = new Vector.<CommonMeasureTool>();
			while ( measureToolLayer.numChildren )
			{
				measureToolLayer.removeChildAt(0);
			}
		}
		
		public function get MeasureTools():Vector.<CommonMeasureTool> 
		{
			return measureTools;
		}
	}
}