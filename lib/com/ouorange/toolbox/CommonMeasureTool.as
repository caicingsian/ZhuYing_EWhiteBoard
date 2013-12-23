package com.ouorange.toolbox
{
	import com.senocular.display.TransformTool;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	
	import flashx.textLayout.debug.assert;
	
	public class CommonMeasureTool extends Sprite
	{
		public function CommonMeasureTool()
		{
			super();
		}
		
		protected var _asset:DisplayObject;
		
		protected var transformTool:TransformTool;
		
		public function init():void
		{
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
//			_asset.addEventListener( MouseEvent.MOUSE_DOWN , onMeasureToolClick );
			
			setupTransformToolSkin();
			setupTransformToolCustomProp();
			setupTransformToolCustomCtrl();
		}
		
		private function onMeasureToolClick(e:Event):void
		{
//			trace( "onMeasureToolClick" );
			if( e.type == TransformTool.CONTROL_UNFOCUS )
			{
				setToolUnselect();
			}
			else
			{
				setToolSelected();
			}
//			e.stopPropagation();
//			e.stopImmediatePropagation();
		}
		
		protected function setupTransformToolSkin():void
		{
			var circleCls:Class = getDefinitionByName("ScaleCircle");
			
			transformTool.setSkin(TransformTool.SCALE_TOP_LEFT, new circleCls());
			transformTool.setSkin(TransformTool.SCALE_TOP_RIGHT, new circleCls());
			transformTool.setSkin(TransformTool.SCALE_BOTTOM_RIGHT, new circleCls());
			transformTool.setSkin(TransformTool.SCALE_BOTTOM_LEFT, new circleCls());
			transformTool.setSkin(TransformTool.SCALE_TOP, new circleCls());
			transformTool.setSkin(TransformTool.SCALE_RIGHT, new circleCls());
			transformTool.setSkin(TransformTool.SCALE_BOTTOM, new circleCls());
			transformTool.setSkin(TransformTool.SCALE_LEFT, new circleCls());
		}
		
		protected function setupTransformToolCustomCtrl():void
		{
			transformTool.addControl(new CustomRotationControl());
		}
		
		protected function setupTransformToolCustomProp():void
		{
			transformTool.skewEnabled = false;
		}
	}
}