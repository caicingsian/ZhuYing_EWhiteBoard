package 
{

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.BitmapData;
	import flash.display.Bitmap;

	public class Draw_tab extends Sprite
	{
        
		public var mc:Sprite= new Sprite()
		
		 public var content:BitmapData = new BitmapData(1500,844,true,0x00FFFFFF)
		 
		public  var show:Bitmap= new Bitmap(content)
		
		public function Draw_tab()
		{
			// constructor code

			this.mouseEnabled=false
			
			this.addChild(mc)
			
			
			this.addChildAt(show,0)
			
			
			
			;
		}

	}

}



