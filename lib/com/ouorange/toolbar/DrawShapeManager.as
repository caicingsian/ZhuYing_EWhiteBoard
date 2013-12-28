package com.ouorange.toolbar 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class DrawShapeManager extends Sprite
	{
		static private var instance:DrawShapeManager;
		
		static public function get Instance():DrawShapeManager { return instance; }
		
		private var allShape:Vector.<ShapeTool>;
		
		private var shapeClsMapping:Array;
		
		public function DrawShapeManager() 
		{
			Init();
		}
		
		public function Init():void
		{
			allShape = new Vector.<ShapeTool>();
			shapeClsMapping = new Array();
			shapeClsMapping[ShapeTool.CIRCLE] = getDefinitionByName("circle_mc");
			//AddShapeByName( ShapeTool.CIRCLE , 0xFF0000 , ShapeTool.TYPE_EMPTY );
		}
		
		public function AddShapeByName( name:String , color:uint , type:String ):void
		{
			var cls:Class = shapeClsMapping[name];
			if ( cls )
			{
				var s:MovieClip = new cls();
				var ct:ColorTransform = new ColorTransform();
				ct.color = color;
				if ( type == ShapeTool.TYPE_EMPTY ) s.gotoAndStop(2);
				var st:ShapeTool = new ShapeTool( s );
				allShape.push( st );
				addChild( st );
				st.x = st.y = 300;
			}
		}
		//public function AppendShape
	}
}