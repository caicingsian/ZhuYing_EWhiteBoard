package com.ouorange.toolbar 
{
	/**
	 * ...
	 * @author Joe
	 */
	public class SelectedTool 
	{
		public static const TYPE_MEASURE:String = "TYPE_MEASURE";
		
		public static const TYPE_SHAPE:String = "TYPE_SHAPE";
		
		private var _type:String;
		
		private var _name:String;
		
		private var _props:Object;
		
		public function SelectedTool( type:String , name:String = null, _props:Object = null) 
		{
			this._type = type;
			this._name = name;
			this._props = _props;
		}	
		
		public function get type():String 
		{
			return _type;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get props():Object 
		{
			return _props;
		}
	}
}