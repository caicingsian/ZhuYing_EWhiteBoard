package com.ouorange.toolbar 
{
	import com.nocircleno.graffiti.tools.BrushTool;
	import com.nocircleno.graffiti.tools.BrushType;
	import com.nocircleno.graffiti.tools.ToolMode;
	import com.ouorange.toolbar.measuretool.PenProp;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class BrushPot 
	{	
		private static var instatnce:BrushPot;
		
		public static const PENCIL:String = "PENCIL";
		
		public static const HIGHLIGHTER:String = "HIGHLIGHTER";
		
		public static const ERASER:String = "ERASER";
		
		private var _brushPot:Array;
		
		public function BrushPot() 
		{
			_brushPot = new Array();
			
			var pen:Pen;
			var penProp:PenProp;
			
			pen = new Pen();
			pen.brushTool = new BrushTool();
			pen.name = PENCIL;
			penProp = new PenProp(10,0xFFFF00,1,0,BrushType.ROUND);
			pen.UpdateBrushStyle(penProp);
			_brushPot[PENCIL] = pen;
			
			pen = new Pen();
			pen.name = HIGHLIGHTER;
			pen.brushTool = new BrushTool();
			penProp = new PenProp(10,0xFFFF00,0.5,0,BrushType.DIAMOND);
			pen.UpdateBrushStyle(penProp);
			_brushPot[HIGHLIGHTER] = pen;
			
			pen = new Pen();
			pen.name = ERASER;
			pen.brushTool = new BrushTool();
			penProp = new PenProp(30,0x000000,1,0,BrushType.DIAMOND,ToolMode.ERASE);
			pen.UpdateBrushStyle(penProp);
			_brushPot[ERASER] = pen;
			
			instatnce = this;
		}
		
		public static function get Instance():BrushPot
		{
			return instatnce;
		}
		
		public function GetPen( name:String ):Pen
		{
			return _brushPot[name];
		}
	}
}