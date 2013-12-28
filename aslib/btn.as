import com.ouorange.toolbar.BrushPot;


var b1x:Number = btn1.x;
var b2x:Number = btn2.x;
var b3x:Number = btn3.x;
var b4x:Number = btn4.x;
var b5x:Number = btn5.x;
var b6x:Number = btn6.x;
var b7x:Number = btn7.x;
var b8x:Number = btn8.x;
var b9x:Number = btn9.x;
var b10x:Number = btn10.x;
var b11x:Number = btn11.x;

var b12x:Number = btn12.x;
var b13x:Number = btn13.x;

btn1.x = btn2.x = btn3.x = btn4.x = btn5.x = btn6.x = btn7.x = btn8.x = btn9.x = btn10.x = btn11.x = tool_btn.x;
btn13.x = btn12.x = tool_btn.x;


var toolmode:Boolean = false;

tool_btn.addEventListener(MouseEvent.MOUSE_DOWN, tool_btn_fn);

function tool_btn_fn(event:MouseEvent):void
{

	if (toolmode==false)
	{
		btn_bg.gotoAndPlay(2);
		toolmode = true;
		btn_x_reset()
		
		draw_btn_control.visible=true
	}
	else
	{
		btn_bg.gotoAndPlay(7);
		toolmode=false
		;
		//pan_close();
		//pan_close2();
		moveTween = new Tween(btn1,"x",Strong.easeIn,btn1.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn2,"x",Strong.easeIn,btn2.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn3,"x",Strong.easeIn,btn3.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn4,"x",Strong.easeIn,btn4.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn5,"x",Strong.easeIn,btn5.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn6,"x",Strong.easeIn,btn6.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn7,"x",Strong.easeIn,btn7.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn8,"x",Strong.easeIn,btn8.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn9,"x",Strong.easeIn,btn9.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn10,"x",Strong.easeIn,btn10.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn11,"x",Strong.easeIn,btn11.x,tool_btn.x,0.2,true);

		moveTween = new Tween(btn12,"x",Strong.easeIn,btn12.x,tool_btn.x,0.2,true);
		moveTween = new Tween(btn13,"x",Strong.easeIn,btn13.x,tool_btn.x,0.2,true);
		
		draw_btn_control.visible=false

		btn_reset();
	}

}


//------------------------------ x of btn is reset on open type
function btn_x_reset(){
	
	    moveTween = new Tween(btn1,"x",Strong.easeIn,btn1.x,b1x,0.2,true);
		moveTween = new Tween(btn2,"x",Strong.easeIn,btn2.x,b2x,0.2,true);
		moveTween = new Tween(btn3,"x",Strong.easeIn,btn3.x,b3x,0.2,true);
		moveTween = new Tween(btn4,"x",Strong.easeIn,btn4.x,b4x,0.2,true);
		moveTween = new Tween(btn5,"x",Strong.easeIn,btn5.x,b5x,0.2,true);
		moveTween = new Tween(btn6,"x",Strong.easeIn,btn6.x,b6x,0.2,true);
		moveTween = new Tween(btn7,"x",Strong.easeIn,btn7.x,b7x,0.2,true);
		moveTween = new Tween(btn8,"x",Strong.easeIn,btn8.x,b8x,0.2,true);
		moveTween = new Tween(btn9,"x",Strong.easeIn,btn9.x,b9x,0.2,true);
		moveTween = new Tween(btn10,"x",Strong.easeIn,btn10.x,b10x,0.2,true);
		moveTween = new Tween(btn11,"x",Strong.easeIn,btn11.x,b11x,0.2,true);

		moveTween = new Tween(btn12,"x",Strong.easeIn,btn12.x,b12x,0.2,true);
		moveTween = new Tween(btn13,"x",Strong.easeIn,btn13.x,b13x,0.2,true);
	
	
	
	
	}


//---------------------------------------------------------------------roll



btn1.addEventListener(MouseEvent.ROLL_OVER, btn1_over);

function btn1_over(event:MouseEvent):void
{
	trace( "開啟形狀按鈕");
	if (toolmode==true)
	{

		if (pan_m_s3.visible == false)
		{
			btn1.gotoAndPlay(2);
		}


		if (open_obj==false)
		{
			moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x + 5,0.2,true);
		}
	}
}

btn1.addEventListener(MouseEvent.ROLL_OUT, btn1_out);

function btn1_out(event:MouseEvent):void
{
	if (toolmode==true)
	{

		if (pan_m_s3.visible == false)
		{
			btn1.gotoAndPlay(7);
		}

		if (open_obj==false)
		{
			moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x,0.2,true);
		}
	}
}


btn2.addEventListener(MouseEvent.ROLL_OVER, btn2_over);

function btn2_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn2.gotoAndPlay(2);
		if (open_obj==false)
		{
			moveTween = new Tween(btn1,"x",Regular.easeIn,btn1.x,b1x - 5,0.2,true);
			moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x + 5,0.2,true);
			

		}
	}
}

btn2.addEventListener(MouseEvent.ROLL_OUT, btn2_out);

function btn2_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn2.gotoAndPlay(7);
		if (open_obj==false)
		{
			moveTween = new Tween(btn1,"x",Regular.easeIn,btn1.x,b1x,0.2,true);
			moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x,0.2,true);
		}
	}
}

btn3.addEventListener(MouseEvent.ROLL_OVER, btn3_over);

function btn3_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn3.gotoAndPlay(2);
		if (open_obj==false)
		{
			moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x - 5,0.2,true);
			moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x + 5,0.2,true);
		}
	}
}

btn3.addEventListener(MouseEvent.ROLL_OUT, btn3_out);

function btn3_out(event:MouseEvent):void
{
	btn3.gotoAndPlay(7);
	if (toolmode==true)
	{

		if (open_obj==false)
		{
			
			moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x,0.2,true);

			moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x,0.2,true);
		}
	}
}


btn4.addEventListener(MouseEvent.ROLL_OVER, btn4_over);

function btn4_over(event:MouseEvent):void
{

	
	if (toolmode==true)
	{


		if (pan_m_s2.visible == false)
		{
			btn4.gotoAndPlay(2);
		}
		if (open_obj==false)
		{
			moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x - 5,0.2,true);
			moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x + 5,0.2,true);
			

		}
	}
}

btn4.addEventListener(MouseEvent.ROLL_OUT, btn4_out);

function btn4_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		if (pan_m_s2.visible == false)
		{
			btn4.gotoAndPlay(7);
		}
		if (open_obj==false)
		{
			moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x,0.2,true);
			moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x,0.2,true);
		}
	}
}


btn5.addEventListener(MouseEvent.ROLL_OVER, btn5_over);

function btn5_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		if (pan_m_s.visible == false)
		{
			btn5.gotoAndPlay(2);
		}
		if (open_obj==false)
		{
			moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x - 5,0.2,true);
			moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x + 5,0.2,true);
		}
	}
}

btn5.addEventListener(MouseEvent.ROLL_OUT, btn5_out);

function btn5_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		if (pan_m_s.visible == false)
		{
			btn5.gotoAndPlay(7);
		}
		if (open_obj==false)
		{
			moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x,0.2,true);
			moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x,0.2,true);
		}
	}
}

btn6.addEventListener(MouseEvent.ROLL_OVER, btn6_over);

function btn6_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn6.gotoAndPlay(2);
		if (open_obj==false)
		{
			moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x - 5,0.2,true);
			moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x + 5,0.2,true);
		}

	}
}

btn6.addEventListener(MouseEvent.ROLL_OUT, btn6_out);

function btn6_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn6.gotoAndPlay(7);
		if (open_obj==false)
		{
			moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x,0.2,true);
			moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x,0.2,true);
		}
	}
}

btn7.addEventListener(MouseEvent.ROLL_OVER, btn7_over);

function btn7_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn7.gotoAndPlay(2);
		if (open_obj==false)
		{
			moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x - 5,0.2,true);
			moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x + 5,0.2,true);
		}

	}
}

btn7.addEventListener(MouseEvent.ROLL_OUT, btn7_out);

function btn7_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn7.gotoAndPlay(7);
		if (open_obj==false)
		{
			moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x,0.2,true);
			moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x,0.2,true);
		}
	}
}

btn8.addEventListener(MouseEvent.ROLL_OVER, btn8_over);

function btn8_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn8.gotoAndPlay(2);
		if (open_obj==false)
		{
			moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x - 5,0.2,true);
			moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x + 5,0.2,true);
		}

	}
}

btn8.addEventListener(MouseEvent.ROLL_OUT, btn8_out);

function btn8_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn8.gotoAndPlay(7);
		if (open_obj==false)
		{
			moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x,0.2,true);
			moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x,0.2,true);
		}
	}
}

btn9.addEventListener(MouseEvent.ROLL_OVER, btn9_over);

function btn9_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn9.gotoAndPlay(2);
		if (open_obj==false)
		{
			moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x - 5,0.2,true);
		}
	}
}

btn9.addEventListener(MouseEvent.ROLL_OUT, btn9_out);

function btn9_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn9.gotoAndPlay(7);
		if (open_obj==false)
		{
			moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x,0.2,true);
		}
	}
}

//-------------------------------
btn10.addEventListener(MouseEvent.ROLL_OVER, btn10_over);

function btn10_over(event:MouseEvent):void
{
	if (toolmode==true )
	{

		if (broad_o.visible == false)
		{
			btn10.gotoAndPlay(2);
		}

		if (open_obj==false)
		{
			moveTween = new Tween(btn11,"x",Regular.easeIn,btn11.x,b11x + 5,0.2,true);
		}

	}
}

btn10.addEventListener(MouseEvent.ROLL_OUT, btn10_out);

function btn10_out(event:MouseEvent):void
{
	if (toolmode==true )
	{

		if (broad_o.visible == false)
		{
			btn10.gotoAndPlay(7);
		}
		if (open_obj==false)
		{
			moveTween = new Tween(btn11,"x",Regular.easeIn,btn11.x,b11x,0.2,true);
		}
	}
}

btn11.addEventListener(MouseEvent.ROLL_OVER, btn11_over);

function btn11_over(event:MouseEvent):void
{
	if (toolmode==true )
	{
		btn11.gotoAndPlay(2);
		if (open_obj==false)
		{
			moveTween = new Tween(btn10,"x",Regular.easeIn,btn10.x,b10x - 5,0.2,true);
		}
	}


}

btn11.addEventListener(MouseEvent.ROLL_OUT, btn11_out);

function btn11_out(event:MouseEvent):void
{
	if (toolmode==true  )
	{
		btn11.gotoAndPlay(7);
		if (open_obj==false)
		{
			moveTween = new Tween(btn10,"x",Regular.easeIn,btn10.x,b10x,0.2,true);
		}
	}

}

btn12.addEventListener(MouseEvent.ROLL_OVER, btn12_over);

function btn12_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn12.gotoAndPlay(2);
		moveTween = new Tween(btn13,"x",Regular.easeIn,btn13.x,b13x - 5,0.2,true);


	}
}

btn12.addEventListener(MouseEvent.ROLL_OUT, btn12_out);

function btn12_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn12.gotoAndPlay(7);
		moveTween = new Tween(btn13,"x",Regular.easeIn,btn13.x,b13x,0.2,true);
	}

}

btn13.addEventListener(MouseEvent.ROLL_OVER, btn13_over);

function btn13_over(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn13.gotoAndPlay(2);
		moveTween = new Tween(btn12,"x",Regular.easeIn,btn12.x,b12x + 5,0.2,true);


	}
}

btn13.addEventListener(MouseEvent.ROLL_OUT, btn13_out);

function btn13_out(event:MouseEvent):void
{
	if (toolmode==true)
	{
		btn13.gotoAndPlay(7);
		moveTween = new Tween(btn12,"x",Regular.easeIn,btn12.x,b12x,0.2,true);

	}
}


//------------------------------------------------------------------------click

var open_obj:Boolean = false;//開啟色盤

//------btn1

pan_m3.visible = false;

pan_m_s3.visible = false;

btn1.addEventListener(MouseEvent.MOUSE_DOWN, btn1_fn);

function btn1_fn(event:MouseEvent):void
{

    tool_reset()

	if (pan_m3.visible == false)
	{
		btn_reset();
		//pan_close2()
		//pan_m.visible=true

		open_obj=true
		;
		pan_m_s3.gotoAndPlay(2);
		pan_m_s3.visible=true
		;
		btn1.gotoAndStop(1);

		btn1.x = b1x;
		//---------------------
		//moveTween = new Tween(btn1, "x", Regular.easeIn, btn1.x, b1x-50 , 0.2, true);
		moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x + 50,0.2,true);
		moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x + 50,0.2,true);
		moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x + 50,0.2,true);
		moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x + 50,0.2,true);
		moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x + 50,0.2,true);
		moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x + 50,0.2,true);
		moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x + 50,0.2,true);
		moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x + 50,0.2,true);

	}

	//---------------------



}

pan_m3.center_btn.addEventListener(MouseEvent.MOUSE_DOWN, btn1_fn_c);

function btn1_fn_c(event:MouseEvent):void
{
	open_obj=false
	;
	pan_m_s3.gotoAndStop(1);
	pan_m_s3.visible=false
	;
	pan_m3.visible=false
	;
	btn1.gotoAndPlay(2);
	//pan_close2()
	//---------------------
	//moveTween = new Tween(btn1, "x", Regular.easeIn, btn1.x, b1x-50 , 0.2, true);
	moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x,0.2,true);
	moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x,0.2,true);
	moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x,0.2,true);
	moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x,0.2,true);
	moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x,0.2,true);
	moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x,0.2,true);
	moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x,0.2,true);
	moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x,0.2,true);
}

//--btn4
pan_m_s2.visible = false;
pan_m2.visible = false;

btn4.addEventListener(MouseEvent.MOUSE_DOWN, btn4_fn);

function btn4_fn(event:MouseEvent):void
{	//鉛筆開
	trace( "鉛筆開" );
    tool_reset()

	if (pan_m2.visible == false)
	{
		btn_reset();
		
		//--
		line_btn.visible=true
		line_btn.x=pan_m2.x
		//---

		open_obj=true
		;
		//pan_m.visible=true
		pan_m_s2.gotoAndPlay(2);
		pan_m_s2.visible = true;
		//pan_m2.visible=true
		btn4.gotoAndStop(1);

		btn4.x = b4x;
		//---------------------
		moveTween = new Tween(btn1,"x",Regular.easeIn,btn1.x,b1x - 50,0.2,true);
		moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x - 50,0.2,true);
		moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x - 50,0.2,true);

		moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x + 50,0.2,true);
		moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x + 50,0.2,true);
		moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x + 50,0.2,true);
		moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x + 50,0.2,true);
		moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x + 50,0.2,true);


		//-----------------
		action = 0;
	
		main_tab6.mc.visible = true;
		main_tab7.mc.visible = true;
		main_tab8.mc.visible = true;

		
		
		//_penControl.enable=false
		
		//pan_control();

		my_alpha = 1;
		
		pen_tool_open( BrushPot.PENCIL );
		//-------------------
	}

}

pan_m2.center_btn.addEventListener(MouseEvent.MOUSE_DOWN, btn4_fn_c);

function btn4_fn_c(event:MouseEvent):void
{	//鉛筆關
	trace( "鉛筆關" );
	open_obj = false;

	pan_m_s2.gotoAndStop(1);
	pan_m_s2.visible = false;
	pan_m2.visible = false;

	btn4.gotoAndPlay(2);


	moveTween = new Tween(btn1,"x",Regular.easeIn,btn1.x,b1x,0.2,true);
	moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x,0.2,true);
	moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x,0.2,true);

	moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x,0.2,true);
	moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x,0.2,true);
	moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x,0.2,true);
	moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x,0.2,true);
	moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x,0.2,true);


	//------
	//_penControl.enable = true;
	//pan_control();
	//-----
	//pen_tool_var=false
	
	//trace("pen_tool_var:"+pen_tool_var)
	//-----
	pen_tool_close()
}



//--btn5

pan_m_s.visible = false;

pan_m.visible = false;

btn5.addEventListener(MouseEvent.MOUSE_DOWN, btn5_fn);

function btn5_fn(event:MouseEvent):void
{	//淫光筆
	trace("淫光筆開");
    tool_reset()

	if (pan_m.visible == false)
	{
		btn_reset();
		
		//--
		line_btn.visible=true
		line_btn.x=pan_m.x
		//---

		open_obj=true
		;
		//pan_close2()
		//pan_m.visible=true
		pan_m_s.gotoAndPlay(2);
		pan_m_s.visible = true;
		//pan_mc.visible=true
		btn5.gotoAndStop(1);

		btn5.x = b5x;
		//---------------------
		moveTween = new Tween(btn1,"x",Regular.easeIn,btn1.x,b1x - 50,0.2,true);
		moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x - 50,0.2,true);
		moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x - 50,0.2,true);
		moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x - 50,0.2,true);

		moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x + 50,0.2,true);
		moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x + 50,0.2,true);
		moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x + 50,0.2,true);
		moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x + 50,0.2,true);


		//---------------------

		action = 0;
		
		main_tab6.mc.visible = true;
		main_tab7.mc.visible = true;
		main_tab8.mc.visible = true;

		_penControl.enable=false
		;
		//pan_control();

		my_alpha = 0.5;
		//------------------------
		pen_tool_open( BrushPot.HIGHLIGHTER )

	}
}


pan_m.center_btn.addEventListener(MouseEvent.MOUSE_DOWN, btn5_fn_c);

function btn5_fn_c(event:MouseEvent):void
{	trace("淫光筆關");
	open_obj=false
	;
	pan_m_s.gotoAndStop(1);
	pan_m_s.visible = false;
	pan_m.visible = false;
	//pan_mc.visible=false

	btn5.gotoAndPlay(2);

	moveTween = new Tween(btn1,"x",Regular.easeIn,btn1.x,b1x,0.2,true);
	moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x,0.2,true);
	moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x,0.2,true);
	moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x,0.2,true);

	moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x,0.2,true);
	moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x,0.2,true);
	moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x,0.2,true);
	moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x,0.2,true);

	//------
	_penControl.enable = true;
	//pan_control();
	//-----
	//pen_tool_var=false
	
	pen_tool_close()


}
//--------------------------------------------------btn6

btn6.addEventListener(MouseEvent.MOUSE_DOWN, btn6_fn_c);

function btn6_fn_c(event:MouseEvent):void
{
	trace("橡皮開");
	btn_reset()
	tool_reset()
	btn_x_reset()
	
	action = 1;
	
	main_tab6.mc.visible = false;
	main_tab7.mc.visible = false;
	main_tab8.mc.visible = false;
	
	pen_tool_open( BrushPot.ERASER );
}

//----------------------------------------
//--btn10
broad_m.visible = false;
broad_o.visible = false;

broad_o.center_btn.addEventListener(MouseEvent.MOUSE_DOWN, btn10_fn_c);

function btn10_fn_c(event:MouseEvent):void
{

	btn_reset();
	open_obj=false
	;
	broad_m.gotoAndStop(1);
	broad_m.visible = false;
	broad_o.visible = false;
	//btn10_var=false
	//moveTween = new Tween(btn11,"x",Regular.easeIn,btn11.x,b11x,0.2,true);

}


//------------------------------------- btn3

broad_m2.visible = false;
broad_o2.visible = false;

btn3.addEventListener(MouseEvent.MOUSE_DOWN, btn3_fn_c);

function btn3_fn_c(event:MouseEvent):void
{
	trace("開啟測量工具");
    tool_reset()
	
	if (broad_m2.visible == false)
	{
       
		btn_reset()
		open_obj = true;
		btn3.gotoAndStop(1);
		broad_m2.visible = true;

		broad_m2.gotoAndPlay(2);

		
		
		//---------------------;
		moveTween = new Tween(btn1,"x",Regular.easeIn,btn1.x,b1x - 20,0.2,true);
		moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x - 20,0.2,true);
        
		moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x,0.2,true);
		
		moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x + 20,0.2,true);
		moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x + 20,0.2,true);
		moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x + 20,0.2,true);
		moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x + 20,0.2,true);
		moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x + 20,0.2,true);
		moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x + 20,0.2,true);


		//---------------------

	}
}


broad_o2.center_btn.addEventListener(MouseEvent.MOUSE_DOWN, btn3_fn_c2);

function btn3_fn_c2(event:MouseEvent):void
{

	btn_reset();
	open_obj=false
	;
	broad_m2.gotoAndStop(1);
	broad_m2.visible = false;
	broad_o2.visible = false;
	//btn10_var=false
	//moveTween = new Tween(btn11,"x",Regular.easeIn,btn11.x,b11x,0.2,true);

	moveTween = new Tween(btn1,"x",Regular.easeIn,btn1.x,b1x,0.2,true);
	moveTween = new Tween(btn2,"x",Regular.easeIn,btn2.x,b2x,0.2,true);
	//moveTween = new Tween(btn3,"x",Regular.easeIn,btn3.x,b3x,0.2,true);
	moveTween = new Tween(btn4,"x",Regular.easeIn,btn4.x,b4x,0.2,true);
	moveTween = new Tween(btn5,"x",Regular.easeIn,btn5.x,b5x,0.2,true);
	moveTween = new Tween(btn6,"x",Regular.easeIn,btn6.x,b6x,0.2,true);
	moveTween = new Tween(btn7,"x",Regular.easeIn,btn7.x,b7x,0.2,true);
	moveTween = new Tween(btn8,"x",Regular.easeIn,btn8.x,b8x,0.2,true);
	moveTween = new Tween(btn9,"x",Regular.easeIn,btn9.x,b9x,0.2,true);




}

//------------------------------------呼叫量尺

//broad_o2.ruler_btn4.addEventListener(MouseEvent.MOUSE_DOWN, broad_o2_fn1);
//
//function broad_o2_fn1(event:MouseEvent):void
//{
	//addChild( _ruler );
//
//}
//
//broad_o2.ruler_btn3.addEventListener(MouseEvent.MOUSE_DOWN, broad_o2_fn2);
//
//function broad_o2_fn2(event:MouseEvent):void
//{
	//addChild( _ruler4 );
//
//}
//
//
//broad_o2.ruler_btn2.addEventListener(MouseEvent.MOUSE_DOWN, broad_o2_fn3);
//
//function broad_o2_fn3(event:MouseEvent):void
//{
	//addChild( _ruler2 );
//
//}
//
//broad_o2.ruler_btn1.addEventListener(MouseEvent.MOUSE_DOWN, broad_o2_fn4);
//
//function broad_o2_fn4(event:MouseEvent):void
//{
	//addChild( _ruler3 );
//
//}


//-------------------------------------呼叫座標圖

xy_nn = 0;

btn2.addEventListener(MouseEvent.MOUSE_DOWN, btn2_fn_a);

function btn2_fn_a(event:MouseEvent):void
{
	trace("呼叫座標圖");
	
	trace("xy_nn:"+xy_nn)
	
	if (_xyMC1.visible == false  && xy_btn1.visible == false)
	{
		_xyMC1.visible = true;
		trace("a1")
	}
	else if (_xyMC2.visible == false   && xy_btn2.visible == false)
	{
		_xyMC2.visible = true;
		trace("a2")
	}
	else if (_xyMC3.visible == false   && xy_btn3.visible == false)
	{
		_xyMC3.visible =true;
		trace("a3")
	}
	else
	{

        trace("a4")
		if (xy_nn==0)
		{

			addChild(_xyMC1);
		}

		if (xy_nn==1)
		{

			addChild(_xyMC2);
		}

		if (xy_nn==2)
		{

			addChild(_xyMC3);
		}

		xy_nn++;
	}

}


_xyMC1.xy_close.addEventListener(MouseEvent.MOUSE_DOWN, xy_close_fn);

function xy_close_fn(event:MouseEvent):void
{
	_xyMC1.visible = false;
}

_xyMC2.xy_close.addEventListener(MouseEvent.MOUSE_DOWN, xy_close_fn2);

function xy_close_fn2(event:MouseEvent):void
{
	_xyMC2.visible = false;
}

_xyMC3.xy_close.addEventListener(MouseEvent.MOUSE_DOWN, xy_close_fn3);

function xy_close_fn3(event:MouseEvent):void
{
	_xyMC3.visible = false;
}


//--------btn reset
function btn_reset()
{

	//--色盤重設

	pan_m_s3.visible = false;
	pan_m_s3.stop();
	pan_m3.visible = false;
	pan_m_s2.visible = false;
	pan_m_s2.stop();
	pan_m2.visible = false;
	pan_m_s.visible = false;
	pan_m_s.stop();
	pan_m.visible = false;
	broad_m.visible = false;
	broad_m.stop();
	broad_o.visible = false;
	
	broad_m2.visible=false
	broad_m2.stop()
	broad_o2.visible=false
	
	line_btn.visible=false
	
	btn3.gotoAndStop(1)
	
	
	line_btn.visible=false
	

}




//----------
/*
btn1.x = b1x;
btn2.x = b2x;
btn3.x = b3x;
btn4.x = b4x;
btn5.x = b5x;
btn6.x = b6x;
btn7.x = b7x;
btn8.x = b8x;
btn9.x = b9x;
btn10.x = b10x;
btn11.x = b11x;*/


//---------------------------------


			//--
btn11.addEventListener(MouseEvent.MOUSE_DOWN, OnTrashCanClick);

//------------------------------
function tool_reset(){
	
	trace("tool_reset()")
	
	
	//-----------
	pen_tool_close()	
	//----------
	sc_ojb_s = false;
	sc_mc_s.visible = false;
	//-----
	hand_var = false;
	hand.visible = false;
	//------
	line_draw=false
	
	}
	




	
//-------------------------	







