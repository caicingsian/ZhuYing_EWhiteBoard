package com.utils 
{
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Joe
	 */
	public class DisplayObjectUtil 
	{
		public static function ShowDisplayObjectHirachy( d:DisplayObject ):void
		{
			var tree:Array = new Array();
			tree.push( d.name );
			while ( d.parent ) {
				tree.unshift( d.parent.name );
				d = d.parent;
			}
			trace( tree.join("->") );
		}	
	}

}