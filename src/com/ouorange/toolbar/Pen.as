﻿package com.ouorange.toolbar
{
	import com.nocircleno.graffiti.tools.BrushTool;
	import com.nocircleno.graffiti.tools.ITool;
	import com.nocircleno.graffiti.tools.LineTool;
	import com.ouorange.toolbar.measuretool.PenProp;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import starling.utils.Color;
	
	public class Pen extends Sprite
	{
		public static const BRUSH_STYLE_UPDATE:String = "BRUSH_STYLE_UPDATE";
		
		private var _penAsset:Sprite;
		
		private var _drawPoint:Point;
		
		private var _drawPointTexture:Sprite;
		
		private var _penProp:PenProp;
		
		private var _brushTool:ITool;
		
		private var _brushFree:BrushTool;
		
		private var _brushLine:LineTool = new LineTool();
		
		private var _enable:Boolean;
		
		public function Pen()
		{
			super();
			createNib();
		}
		
		public function get drawPoint():Point
		{
			return _drawPoint;
		}
		
		public function get enable():Boolean 
		{
			return _enable;
		}
		
		public function set enable(value:Boolean):void 
		{
			_enable = value;
			_enable ? ShowNib() : HideNib();
		}
		
		public function get brushTool():ITool 
		{
			return _brushTool;
		}
		
		public function set brushTool(value:ITool):void 
		{
			_brushTool = _brushFree = value;
		}
		
		public function get penProp():PenProp 
		{
			return _penProp;
		}
	
		//設定筆頭位置
		public function setDrawPoint(p:Point):void
		{
			_drawPoint = p;
			p = globalToLocal(p);
			_drawPointTexture.x = p.x;
			_drawPointTexture.y = p.y;
		}
		
		//產生筆頭圖像
		private function createNib():void
		{
			if ( _drawPointTexture == null )
			{
				_drawPointTexture = new Sprite();
				addChild( _drawPointTexture );
			}
		}
		
		//隱藏筆頭
		private function ShowNib():void
		{
			_drawPointTexture.visible = true;
		}
		
		//顯示筆頭
		public function HideNib():void
		{
			_drawPointTexture.visible = false;
		}
		
		//更新筆頭
		private function UpdateNibStyle()
		{
			_drawPointTexture.graphics.clear();
			_drawPointTexture.graphics.lineStyle( 1 , _penProp.color );
			_drawPointTexture.graphics.drawCircle( 0, 0 , _penProp.size * 0.5);
			_drawPointTexture.graphics.endFill();
		}
		
		//更新Brush屬性
		public function UpdateBrushStyle( penProp:PenProp ):void
		{
			this._penProp = penProp;
			trace( penProp.drawType );
			//檢查是否換筆
			if ( penProp.drawType == PenProp.DRAW_FREE ) _brushTool = _brushFree;
			else if ( penProp.drawType == PenProp.DRAW_LINE ) _brushTool = _brushLine;
			
			if ( _brushTool is BrushTool ) UpdateBrushToolProp();
			if ( _brushTool is LineTool ) UpdateLineToolProp();
			
			UpdateNibStyle();
		}
		
		//更新畫線筆刷屬性
		private function UpdateLineToolProp():void 
		{
			var brush:LineTool = _brushTool as LineTool;
			brush.alpha = _penProp.alpha;
			brush.color = _penProp.color;
			brush.lineWidth = _penProp.size;
			brush.type = _penProp.type;
			brush.mode = _penProp.mode;
			this.dispatchEvent( new Event( BRUSH_STYLE_UPDATE ) );
		}
		
		//更新BrushTool的屬性.
		private function UpdateBrushToolProp():void
		{
			var brush:BrushTool = _brushTool as BrushTool;
			brush.alpha = _penProp.alpha;
			brush.color = _penProp.color;
			brush.size = _penProp.size;
			brush.blur = _penProp.blur;
			brush.type = _penProp.type;
			brush.mode = _penProp.mode;
			this.dispatchEvent( new Event( BRUSH_STYLE_UPDATE ) );
		}
	}
}