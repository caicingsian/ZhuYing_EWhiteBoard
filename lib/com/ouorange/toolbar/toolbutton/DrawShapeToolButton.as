package com.ouorange.toolbar.toolbutton 
{
	import com.ouorange.toolbar.GlobalConst;
	import com.ouorange.toolbar.measuretool.MeasureToolManager;
	import com.ouorange.toolbar.ShapeTool;
	import com.ouorange.toolbar.ToolBarButtonControl;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class DrawShapeToolButton extends ToolButton 
	{
		private var _colorPicker:ToolColorPicker;
		
		private var _selectedShape:String;
		
		private var _color:uint;
		
		private var _shapeType:String = ShapeTool.TYPE_SOLID;
		
		private var _content:MovieClip;
		
		private var _btnShapeNameMapping:Array;
		
		private var _shapeColorTransform:ColorTransform;
		
		private var _interactiveSensor:Sprite;
		
		private var _measureToolMgr:MeasureToolManager;
		
		public function DrawShapeToolButton(asset:MovieClip) 
		{
			super(asset);
			this.name = ToolBarButtonControl.TOOL_DRAW_SHAPE;

			var content:MovieClip;
			
			_measureToolMgr = MeasureToolManager.Instatnce;
			
			_interactiveSensor = GlobalConst.APP_INTERACTIVE_SENSOR;
			
			_content = _asset["panel"]["panel"];
			
			_content["pancil"].addEventListener(MouseEvent.MOUSE_DOWN, OnShapeTypeChange);
			_content["pancil2"].addEventListener(MouseEvent.MOUSE_DOWN, OnShapeTypeChange);
			_content["pancil"].buttonMode = _content["pancil2"].buttonMode = true;
			
			_colorPicker = new ToolColorPicker(_content);
			_colorPicker.addEventListener( ToolColorPicker.COLOR_UPDATE , OnColorChange );
			
			_btnShapeNameMapping = new Array();
			_btnShapeNameMapping["love_btn"] = ShapeTool.HEARD;
			_btnShapeNameMapping["rploy_btn"] = ShapeTool.ROUNDSQUARE;
			_btnShapeNameMapping["cri_btn"] = ShapeTool.CIRCLE;
			_btnShapeNameMapping["sq_btn"] = ShapeTool.SQUARE;
			_btnShapeNameMapping["tra_btn"] = ShapeTool.TRIANGLE;
			_btnShapeNameMapping["ploy_btn"] = ShapeTool.POLYGON;
			_btnShapeNameMapping["star_btn"] = ShapeTool.STAR;			
			
			_shapeColorTransform = new ColorTransform();
			
			UpdateColor();
			
			InitShapeButton();
		}	
		
		private function InitShapeButton():void 
		{
			var btn:MovieClip;
			for ( var k:String in _btnShapeNameMapping )
			{
				btn = _content[k];
				if ( btn )
				{
					btn.buttonMode = true;
					btn.addEventListener( MouseEvent.MOUSE_DOWN , OnShapeBtnClick );
				}
			}
		}
		
		private function OnShapeBtnClick(e:MouseEvent):void 
		{
			trace("OnShapeBtnClick:"+_btnShapeNameMapping[e.target.name]);
			if ( _btnShapeNameMapping[e.target.name] )
			{
				_selectedShape = _btnShapeNameMapping[e.target.name];
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
			_selectedShape = null;
			_interactiveSensor.removeEventListener( MouseEvent.CLICK , OnScreenClick );
		}
		
		private function OnScreenClick(e:MouseEvent):void 
		{
			trace( "OnScreenClick:" + _selectedShape );
			if( _selectedShape && _measureToolMgr )
			{
				_measureToolMgr.AddShapeToolByName(_selectedShape, _color, _shapeType);
			}
		}
		
		private function OnShapeTypeChange(e:MouseEvent):void 
		{
			//trace( "OnShapeTypeChange:" + e.target.name );
			if ( e.target.name == "pancil" ) {
				_shapeType = ShapeTool.TYPE_SOLID;
			} else {
				_shapeType = ShapeTool.TYPE_EMPTY;
			}
		}
		
		private function OnColorChange(e:Event):void 
		{
			_color = _colorPicker.curtColor;
			UpdateColor();
		}
		
		//更新研色
		private function UpdateColor():void
		{
			var btn:MovieClip;
			_shapeColorTransform.color = _color;
			for ( var k:String in _btnShapeNameMapping )
			{
				btn = _content[k];
				if ( btn )
				{
					btn.transform.colorTransform = _shapeColorTransform;
				}
			}
		}
	}
}