package 
{

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.BitmapData;
	import flash.display.Bitmap;

	public class Draw_tab2 extends Sprite
	{
        
		public var mc:Sprite= new Sprite()
		
		public var content:BitmapData = new BitmapData(300,300,true,0x00FFFFFF)
		 
		public  var show:Bitmap= new Bitmap(content)
		
		public function Draw_tab2()
		{
			// constructor code

			mouseEnabled=false
			
			addChild(mc)
			
			
			addChildAt(show,0)
			
			
			
			;
		}

	}

}



