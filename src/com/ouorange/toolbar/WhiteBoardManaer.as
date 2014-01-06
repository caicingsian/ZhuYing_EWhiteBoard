package com.ouorange.toolbar 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe&Allen
	 */
	public class WhiteBoardManaer extends Sprite 
	{	
		static private var instance:WhiteBoardManaer;
		
		private var _asset:MovieClip;
		
		static public function get Instance():WhiteBoardManaer { return instance; }
		
		private var whiteBoards:Array;
		
		public function WhiteBoardManaer( asset:MovieClip ) 
		{
			instance = this;
			_asset = asset;
			InitWhiteBoard();
		}
		
		public function GetWhiteBoard(name:String):WhiteBoard 
		{
			return whiteBoards[name];
		}
		
		public function ToggleWhiteboard(wname:String):void 
		{
			var whiteboard:WhiteBoard = whiteBoards[wname];
			if ( whiteboard )
			{
				whiteboard.ToggleWhiteboard();
			}
		}
		
		private function InitWhiteBoard():void 
		{
			whiteBoards = new Array();
			whiteBoards[WhiteBoardDirection.CENTER] = this.addChild( new WhiteBoard( _asset["broad_c_obj"] , WhiteBoardDirection.CENTER ) );
			whiteBoards[WhiteBoardDirection.TOP] = this.addChild( new WhiteBoard( _asset["broad_t_obj"] , WhiteBoardDirection.TOP ) );
			whiteBoards[WhiteBoardDirection.BOTTOM] = this.addChild( new WhiteBoard( _asset["broad_b_obj"] , WhiteBoardDirection.BOTTOM ) );
			whiteBoards[WhiteBoardDirection.LEFT] = this.addChild( new WhiteBoard( _asset["broad_l_obj"] , WhiteBoardDirection.LEFT ) );
			whiteBoards[WhiteBoardDirection.RIGHT] = this.addChild( new WhiteBoard( _asset["broad_r_obj"] , WhiteBoardDirection.RIGHT ) );	
		}
	}
}