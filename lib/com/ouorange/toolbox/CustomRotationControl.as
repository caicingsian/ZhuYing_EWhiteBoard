package com.ouorange.toolbox
{
	import com.senocular.display.TransformTool;
	import com.senocular.display.TransformToolControl;
	import com.senocular.display.TransformToolCursor;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.utils.setInterval;
	
	public class CustomRotationControl extends TransformToolControl {
		
		private var length:Number = 20;
		private var circle:ScaleCircle;
		
		public function CustomRotationControl() {
			addEventListener(TransformTool.CONTROL_INIT, init, false, 0, true);
			circle = new ScaleCircle();
			addChild(circle);
		}
		
		private function init(event:Event):void {
			
			// add event listeners 
			transformTool.addEventListener(TransformTool.NEW_TARGET, update, false, 0, true);
			transformTool.addEventListener(TransformTool.TRANSFORM_TOOL, update, false, 0, true);
			transformTool.addEventListener(TransformTool.CONTROL_TRANSFORM_TOOL, update, false, 0, true);
			transformTool.addEventListener(TransformTool.CONTROL_DOWN, controlMouseDown, false, 0, true);
			transformTool.addEventListener(TransformTool.CONTROL_MOVE, controlMove, false, 0, true);
			
			// set this as a reference for the rotation cursor
			var cursor:TransformToolCursor = transformTool.rotationCursor;
			cursor.addReference(this);
			
			// initial positioning
			update();
			
			if( transformTool.target )
			{
				tailCanvas = new Sprite();
				var dpc:DisplayObjectContainer = DisplayObjectContainer( transformTool.target );
				dpc.parent.addChild( tailCanvas );
				//dpc.addChild( tailCanvas );				
				tailTextrue = new BitmapData(dpc.width,dpc.height,true,0);
				tailTextrue.draw( dpc );
				
				tailCanvas.mouseEnabled = false;
				
				target = transformTool.target;
				
				setInterval( clearTail , 5 );
			}
		}
		
		private function clearTail():void
		{
			if( tailCanvas.numChildren > 0 ) tailCanvas.removeChildAt(0);
		}
		
		private var tailCanvas:Sprite;
		
		private var tailTextrue:BitmapData;
		
		private var target:DisplayObject;
		
		private function update(event:Event = null):void {
			if (transformTool.target) {
				
				// move circle to point
				var top:Point = transformTool.boundsTop;
				var bottom:Point = transformTool.boundsBottom;
				var diff = top.subtract(bottom);
				var angle = Math.atan2(diff.y, diff.x);
				circle.x = top.x + length * Math.cos(angle);
				circle.y = top.y + length * Math.sin(angle);
				
				// draw connecting line
				graphics.clear();
				graphics.lineStyle(0,0);
				// draw from top of top ScaleCircle
				var offset:Number = circle.height/2;
				graphics.moveTo(top.x + offset * Math.cos(angle), top.y + offset * Math.sin(angle));
				graphics.lineTo(circle.x, circle.y);
				
//				dd();
			}
		}
		
		public function dd():void
		{
			if( tailCanvas )
			{
				//var d:BitmapData = new BitmapData( 200 , 200 , true , 0 );
				var t:Bitmap = new Bitmap( tailTextrue );
				t.transform.matrix = target.transform.matrix;
				t.alpha = 0.5;
				tailCanvas.addChild( t );
			}
		}
		
		private function controlMouseDown(event:Event):void {
			if (transformTool.currentControl == this) {
				// if this tool is being clicked, set
				// the reference point to be the mouse location
				_referencePoint = transformTool.mouse;
			}
		}
		
		private function controlMove(event:Event):void {
			if (transformTool.currentControl == this) {
				// use default tool rotation if this tool is being used
				transformTool.rotationInteraction();
			}
		}
	}
}