package com.ouorange.toolbar.measuretool
{
	import com.senocular.display.TransformTool;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class CommonMeasureTool extends Sprite
	{
		public function CommonMeasureTool()
		{
			init();
		}
		
		protected var _asset:DisplayObject;
		
		
		
		protected var transformTool:TransformTool;
		
		protected var _drawHelper:MeasureToolDrawHelper;
		
		protected var _enable:Boolean;
		
		public function get enable():Boolean
		{
			return _enable;
		}

		public function set enable(value:Boolean):void
		{
			_enable = value;
			this.mouseEnabled = this.mouseChildren = _enable;
		}

		public function init():void
		{
			_drawHelper = new MeasureToolDrawHelper();
			
			initTransformTool();
			
			if( _asset ) _asset.addEventListener( MouseEvent.CLICK, onMeasureToolClick );
		}
		
		public function setToolUnselect():void
		{	
			transformTool.target = null;
		}
		
		public function setToolSelected():void
		{
			transformTool.target = _asset;
		}
		
		protected function initTransformTool():void
		{
			transformTool = new TransformTool();
			addChild( transformTool );
			
			transformTool.addEventListener( TransformTool.CONTROL_DOWN , onMeasureToolClick );
			transformTool.addEventListener( TransformTool.CONTROL_UNFOCUS , onMeasureToolClick );
			
			setupTransformToolSkin();
			setupTransformToolCustomProp();
			setupTransformToolCustomCtrl();
		}
		
		private function onMeasureToolClick(e:Event):void
		{
			if( e.type == TransformTool.CONTROL_UNFOCUS )
			{
				setToolUnselect();
			}
			else
			{
				setToolSelected();
			}
		}
		
		protected function setupTransformToolSkin():void
		{
			var circleCls:Class = TransformScaleCircleAsset;
			if( circleCls )
			{
				transformTool.setSkin(TransformTool.SCALE_TOP_LEFT, new circleCls());
				transformTool.setSkin(TransformTool.SCALE_TOP_RIGHT, new circleCls());
				transformTool.setSkin(TransformTool.SCALE_BOTTOM_RIGHT, new circleCls());
				transformTool.setSkin(TransformTool.SCALE_BOTTOM_LEFT, new circleCls());
				transformTool.setSkin(TransformTool.SCALE_TOP, new circleCls());
				transformTool.setSkin(TransformTool.SCALE_RIGHT, new circleCls());
				transformTool.setSkin(TransformTool.SCALE_BOTTOM, new circleCls());
				transformTool.setSkin(TransformTool.SCALE_LEFT, new circleCls());
			}
		}
		
		protected function setupTransformToolCustomCtrl():void
		{
			transformTool.addControl(new CustomRotationControl());
		}
		
		protected function setupTransformToolCustomProp():void
		{
			transformTool.skewEnabled = false;
			transformTool.constrainScale = true;
		}
		
		public function adjustDrawPostion( p:Point ):Point
		{
			return p;
		}
	}
}