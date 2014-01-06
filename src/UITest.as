package  
{
	import com.bit101.components.HSlider;
	import com.ouorange.component.Slider;
	import flash.display.Sprite;
	import flash.events.Event;
	import temple.ui.slider.SliderEvent;
	import temple.ui.slider.StepSlider;
	
	/**
	 * ...
	 * @author Joe
	 */
	public class UITest extends Sprite 
	{
		private var myHSlider:HSlider;
		private var _slider:StepSlider;
		
		public function UITest() 
		{
			super();
			//trace( this["__YColumn"] );
			//addChild( new Slider() );
			
			_slider = 
			new StepSlider( this["__YColumn"]["__thumb"] , 
							Sprite(this["__YColumn"]).getRect(this["__YColumn"]["__Track"]) ,
							1, 10, 1);
							
			_slider.addEventListener(SliderEvent.SLIDING, handleSliding);
			
			//myHSlider = new HSlider(this, 70, 50, OnValueChange);
		}	
		
		private function handleSliding( e:SliderEvent ):void
		{
			
			//trace("b:");
			//trace( myHSlider.value );
		}
	}
}