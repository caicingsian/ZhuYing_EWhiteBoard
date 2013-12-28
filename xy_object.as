package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.events.Event;


	public class xy_object extends MovieClip
	{


		public function xy_object()
		{
			// constructor code

			//--------------------------------------drag


			bg.addEventListener(MouseEvent.MOUSE_DOWN, bg1);

			function bg1(event:MouseEvent):void
			{
                trace("main.instance.pen_tool_var_bg:"+ZhuyingToolbar.instance.pen_tool_var)
                
				if(ZhuyingToolbar.instance.pen_tool_var==false){
				startDrag();}
			}

			bg.addEventListener(MouseEvent.MOUSE_UP, bg2);

			function bg2(event:MouseEvent):void
			{
				if(ZhuyingToolbar.instance.pen_tool_var==false){
				stopDrag();}
			}

			//---------------------數字鍵
			computer.n1.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 1)});

			computer.n2.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 2)});

			computer.n3.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 3)});

			computer.n4.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 4)});

			computer.n5.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 5)});

			computer.n6.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 6)});

			computer.n7.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 7)});

			computer.n8.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 8)});

			computer.n9.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 9)});

			computer.n0.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){
			
			xyMC_n(e, 0)});




			function xyMC_n(e:MouseEvent,txtn:Number)
			{
				trace("txtn:"+txtn);

				e.target.gotoAndPlay(2);
				if (x1.currentFrame == 2)
				{

					x1.txt.text = txtn.toString();

				}
				else if (x2.currentFrame==2)
				{

					x2.txt.text = txtn.toString();
				}
				else if (y1.currentFrame==2)
				{
					y1.txt.text = txtn.toString();
				}
				else
				{
					y2.txt.text = txtn.toString();
				}

				line_ac();

			}


			//----------預設
			var x_var:Number;// x 值
			var y_var:Number;// y 值


			x2.gotoAndStop(2);

			x2.txt.textColor = 0xFFFFFF;
			x1.txt.textColor = y1.txt.textColor = y2.txt.textColor = 0x595757;

			x1.txt.text = "1";

			x2.txt.text = "0";

			y1.txt.text = "1";

			y2.txt.text = "0";


			line_ac();

			function line_ac()
			{

				x_var=(x1.txt.text)+(x2.txt.text)
				;
				y_var=(y1.txt.text)+(y2.txt.text)
				;
				for (i=0; i <10; i++)
				{

					trace("i:"+i);
					getChildByName("xline"+(i+1)).txt.text=x_var*(i+1)
					 ;
					getChildByName("yline"+(i+1)).txt.text=y_var*(i+1)
					 ;
				}

			}


			//------*****

			//-----------------------------------------------------

			x1.addEventListener(MouseEvent.MOUSE_DOWN ,c_n1);




			function c_n1(event:MouseEvent):void
			{

				x1.gotoAndStop(2);
				x2.gotoAndStop(1);
				y1.gotoAndStop(1);
				y2.gotoAndStop(1);

				x1.txt.textColor = 0xFFFFFF;
				x2.txt.textColor = y1.txt.textColor = y2.txt.textColor = 0x595757;
			}

			x2.addEventListener(MouseEvent.MOUSE_DOWN ,c_n2);

			function c_n2(event:MouseEvent):void
			{
				x1.gotoAndStop(1);
				x2.gotoAndStop(2);
				y1.gotoAndStop(1);
				y2.gotoAndStop(1);

				x2.txt.textColor = 0xFFFFFF;
				x1.txt.textColor = y1.txt.textColor = y2.txt.textColor = 0x595757;
			}

			///------y


			y1.addEventListener(MouseEvent.MOUSE_DOWN ,c_n1y);

			function c_n1y(event:MouseEvent):void
			{
				x1.gotoAndStop(1);
				x2.gotoAndStop(1);
				y1.gotoAndStop(2);
				y2.gotoAndStop(1);

				y1.txt.textColor = 0xFFFFFF;
				x1.txt.textColor = x2.txt.textColor = y2.txt.textColor = 0x595757;
			}

			y2.addEventListener(MouseEvent.MOUSE_DOWN ,c_n2y);

			function c_n2y(event:MouseEvent):void
			{
				x1.gotoAndStop(1);
				x2.gotoAndStop(1);
				y1.gotoAndStop(1);
				y2.gotoAndStop(2);


				y2.txt.textColor = 0xFFFFFF;
				x1.txt.textColor = x2.txt.textColor = y1.txt.textColor = 0x595757;
			}


			//----------------------------------------------------------------  drag line

			var dis:Number = 20;//初始線段距

			var sy:Number = 271.6;//y:0

			var sx:Number = 111;//x:0

			var ddx:Number = drag_btn.x;
			var ddy:Number = drag_btn.y;

			var lnn:Number = 0;//線段數


			dll();

			drag_btn.addEventListener(MouseEvent.MOUSE_DOWN , drag_line);

			function drag_line(event:MouseEvent):void
			{

				drag_btn.startDrag(false, new Rectangle(ddx, ddy, 80,0));



			}

			drag_btn.addEventListener(MouseEvent.MOUSE_OUT , drag_line2);

			drag_btn.addEventListener(MouseEvent.MOUSE_UP , drag_line2);

			function drag_line2(event:MouseEvent):void
			{

				drag_btn.stopDrag();
				trace("xx:"+Math.ceil((drag_btn.x-ddx)/10));
				lnn=Math.ceil((drag_btn.x-ddx)/10)
				;
				dll();
			}


			function dll()
			{

				trace("dll()");
				for (i=0; i< 10; i++)
				{
					dis = 200 / (10 - lnn);
					getChildByName("yline"+(i+1)).y=sy-((i+1)*(dis));
					getChildByName("xline"+(i+1)).x=sx+((i+1)*(dis))
					;
					if ((getChildByName("yline"+(i+1)).y)<35)
					{
						getChildByName("yline"+(i+1)).y=35;
					}

					if ((getChildByName("xline"+(i+1)).x)>350)
					{

						getChildByName("xline"+(i+1)).x=350;
					}

				}
			}

			//--縮放
			var frist_x:Number;
			var frist_y:Number;
			var frist_w:Number;
			var frist_h:Number;



			trace("width:"+width);


			jjbtn.addEventListener(MouseEvent.MOUSE_DOWN, jj_fn);

			function jj_fn(event:MouseEvent):void
			{

				if(ZhuyingToolbar.instance.pen_tool_var==false){
				
				frist_x = stage.mouseX;
				frist_y = stage.mouseY;
				frist_w = width;
				frist_h=height
				  
				    ;
				addEventListener(Event.ENTER_FRAME, EnterFrame2);
				}
			}


			addEventListener(MouseEvent.MOUSE_UP, jj_fn2);
			
			ZhuyingToolbar.instance.stage.addEventListener(MouseEvent.MOUSE_UP, jj_fn2);
			
			//addEventListener(MouseEvent.ROLL_OVER, jj_fn2);

			function jj_fn2(event:MouseEvent):void
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame2);
				//sq_down=false
			}




			function EnterFrame2(event:Event):void
			{

				//--放大
				if ( (stage.mouseX-frist_x )>0 ||  (stage.mouseY-frist_y )>0 )
				{
					if ( (stage.mouseX-frist_x ) >  (stage.mouseY-frist_y )  )
					{
						width = frist_w + (stage.mouseX - frist_x);
						height=frist_h+(stage.mouseX-frist_x)
						   ;
					}
					else
					{

						width = frist_w + (stage.mouseY - frist_y);
						height = frist_h + (stage.mouseY - frist_y);

					}
				}
				else
				{

					//--縮小
					if ( (stage.mouseX-frist_x ) <  (stage.mouseY-frist_y )  )
					{
						width = frist_w + (stage.mouseX - frist_x);
						height=frist_h+(stage.mouseX-frist_x)
						   ;
					}
					else
					{

						width = frist_w + (stage.mouseY - frist_y);
						height = frist_h + (stage.mouseY - frist_y);

					}



				}
			}

			//---------------------------------------------------------彩色圓點


			var ccnn:Number = 0;

			color1.addEventListener(MouseEvent.MOUSE_DOWN, color1_fn);

			function color1_fn(event:MouseEvent):void
			{
				ccnn++;
				var mycolor1_mc=new color1_mc();
				addChild(mycolor1_mc);
				trace("123");
				mycolor1_mc.x = color1.x;
				mycolor1_mc.y=color1.y
				;
				mycolor1_mc.name="cc"+ccnn
				;
				mycolor1_mc.startDrag();
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_DOWN, cc_fn);
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_UP, cc_fn2);
			}

			color2.addEventListener(MouseEvent.MOUSE_DOWN, color2_fn);

			function color2_fn(event:MouseEvent):void
			{
				ccnn++;
				var mycolor2_mc=new color2_mc();
				xy_mc.addChild(mycolor2_mc);
				mycolor2_mc.x = xy_mc.color2.x;
				mycolor2_mc.y=xy_mc.color2.y
				;
				mycolor2_mc.name="cc"+ccnn
				;
				mycolor2_mc.startDrag();
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_DOWN, cc_fn);
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_UP, cc_fn2);
			}

			color3.addEventListener(MouseEvent.MOUSE_DOWN, color3_fn);

			function color3_fn(event:MouseEvent):void
			{
				ccnn++;
				var mycolor3_mc=new color3_mc();
				addChild(mycolor3_mc);
				mycolor3_mc.x = color3.x;
				mycolor3_mc.y=color3.y
				;
				mycolor3_mc.name="cc"+ccnn
				;
				mycolor3_mc.startDrag();
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_DOWN, cc_fn);
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_UP, cc_fn2);
			}

			color4.addEventListener(MouseEvent.MOUSE_DOWN, color4_fn);

			function color4_fn(event:MouseEvent):void
			{
				ccnn++;
				var mycolor4_mc=new color4_mc();
				addChild(mycolor4_mc);
				mycolor4_mc.x = color4.x;
				mycolor4_mc.y=color4.y
				;
				mycolor4_mc.name="cc"+ccnn
				;
				mycolor4_mc.startDrag();
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_DOWN, cc_fn);
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_UP, cc_fn2);
			}

			color5.addEventListener(MouseEvent.MOUSE_DOWN, color5_fn);

			function color5_fn(event:MouseEvent):void
			{
				ccnn++;
				var mycolor5_mc=new color5_mc();
				addChild(mycolor5_mc);
				mycolor5_mc.x = color5.x;
				mycolor5_mc.y=color5.y
				;
				mycolor5_mc.name="cc"+ccnn
				;
				mycolor5_mc.startDrag();
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_DOWN, cc_fn);
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_UP, cc_fn2);
			}

			color6.addEventListener(MouseEvent.MOUSE_DOWN, color6_fn);

			function color6_fn(event:MouseEvent):void
			{
				ccnn++;
				var mycolor6_mc=new color6_mc();
				addChild(mycolor6_mc);
				mycolor6_mc.x = color6.x;
				mycolor6_mc.y=color6.y
				;
				mycolor6_mc.name="cc"+ccnn
				;
				mycolor6_mc.startDrag();
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_DOWN, cc_fn);
				getChildByName(("cc" + ccnn)).addEventListener(MouseEvent.MOUSE_UP, cc_fn2);
			}

			function cc_fn(event:MouseEvent):void
			{

				event.target.startDrag();
			}


			function cc_fn2(event:MouseEvent):void
			{

				event.target.stopDrag();
			}


			//------------visible

			bar_bg.visible = false;
			bar_bg2.visible = false;
			drag_btn.visible = false;
			computer.visible = false;
			color1.visible = false;
			color2.visible = false;
			color3.visible = false;
			color4.visible = false;
			color5.visible = false;
			color6.visible = false;
			x1.visible = false;
			x2.visible = false;
			y1.visible = false;
			y2.visible=false
			
			
			;
			//----------------------

			set_btn.addEventListener(MouseEvent.MOUSE_DOWN, set_btn_fn);

			function set_btn_fn(event:MouseEvent):void
			{
				if (bar_bg.visible == true)
				{

					bar_bg.visible = false;
					bar_bg2.visible = false;
					drag_btn.visible = false;
					computer.visible = false;
					color1.visible = false;
					color2.visible = false;
					color3.visible = false;
					color4.visible = false;
					color5.visible = false;
					color6.visible = false;
					x1.visible = false;
					x2.visible = false;
					y1.visible = false;
					y2.visible = false;
				}
				else
				{
					bar_bg.visible = true;
					bar_bg2.visible = true;
					drag_btn.visible = true;
					computer.visible = true;
					color1.visible = true;
					color2.visible = true;
					color3.visible = true;
					color4.visible = true;
					color5.visible = true;
					color6.visible = true;
					x1.visible = true;
					x2.visible = true;
					y1.visible = true;
					y2.visible = true;
				}

			}
			//------------close
			/*
			xy_close.addEventListener(MouseEvent.MOUSE_DOWN, xy_close_fn);

			function xy_close_fn(event:MouseEvent):void
			{
				main.instance.xy_nn--
				trace("main.instance.xy_nn:"+main.instance.xy_nn)
				
				
				}*/

			//-------------------------------------------------------------------------------------------------------

		}
	}

}