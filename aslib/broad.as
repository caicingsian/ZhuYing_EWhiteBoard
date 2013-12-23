import flash.geom.Rectangle;

//-------------------------------------------------------------------------------------------------  broad


//-------------botton


broad_o.broad_btn_b.addEventListener(MouseEvent.CLICK ,broad_btn_b_fn);
broad_b_obj.drag_btn.addEventListener(MouseEvent.MOUSE_DOWN, drag_fn);
broad_b_obj.addEventListener(MouseEvent.MOUSE_UP, drag_fn2);

function broad_btn_b_fn(event:MouseEvent):void
{

	//var broad_b_obj= new broad_b()
	//broad_b_obj.x = 0;
	broad_b_obj.y=640
	;
	//addChild(broad_b_obj)

}


function drag_fn(event:MouseEvent):void
{

	//trace("event.target.parent.parent.x:"+event.target.parent.parent.x)
	//trace("event.target.parent.parent.y:"+event.target.parent.parent.y)
	broad_b_obj.startDrag(false, new Rectangle(0, 0-100, 0, 1000));
}
//event.target.parent.parent.startDrag( );



function drag_fn2(event:MouseEvent):void
{

	broad_b_obj.stopDrag();
}


//---------------------------top;


broad_o.broad_btn_t.addEventListener(MouseEvent.CLICK ,broad_btn_t_fn);
broad_t_obj.drag_btn.addEventListener(MouseEvent.MOUSE_DOWN, drag_fn_t);
broad_t_obj.addEventListener(MouseEvent.MOUSE_UP, drag_fn2_t);

function broad_btn_t_fn(event:MouseEvent):void
{

	//var broad_t_obj= new broad_t()
	//broad_t_obj.x = 0;
	broad_t_obj.y=-800
	;
	//addChild(broad_t_obj)

}



function drag_fn_t(event:MouseEvent):void
{

	//trace("event.target.parent.parent.x:"+event.target.parent.parent.x);
	//trace("event.target.parent.parent.y:"+event.target.parent.parent.y);
	broad_t_obj.startDrag(false, new Rectangle(0, 0, 0, -900));
	

	//broad_t_obj.startDrag(false, new Rectangle(0, 1100, 0, 2000));
	//trace("dddd");
	//event.target.parent.parent.startDrag( );

}

function drag_fn2_t(event:MouseEvent):void
{

	broad_t_obj.stopDrag();
}
//broad_t_obj.stopDrag();



//---------------------------right


broad_o.broad_btn_r.addEventListener(MouseEvent.CLICK ,broad_btn_r_fn);
broad_r_obj.drag_btn.addEventListener(MouseEvent.MOUSE_DOWN, drag_fn_r);
broad_r_obj.addEventListener(MouseEvent.MOUSE_UP, drag_fn2_r);

function broad_btn_r_fn(event:MouseEvent):void
{

//var broad_r_obj= new broad_r()
broad_r_obj.x = 1300;
//broad_r_obj.y=0

//addChild(broad_r_obj)

}


function drag_fn_r(event:MouseEvent):void
{


broad_r_obj.startDrag(false, new Rectangle(0, 0 , 1600, 0));
}
//event.target.parent.parent.startDrag( );



function drag_fn2_r(event:MouseEvent):void
{

broad_r_obj.stopDrag();
}
//---------------------------left


broad_o.broad_btn_l.addEventListener(MouseEvent.CLICK ,broad_btn_l_fn);
broad_l_obj.drag_btn.addEventListener(MouseEvent.MOUSE_DOWN, drag_fn_l);
broad_l_obj.addEventListener(MouseEvent.MOUSE_UP, drag_fn2_l);

function broad_btn_l_fn(event:MouseEvent):void
{

//var broad_r_obj= new broad_r()
broad_l_obj.x = -1400;
//broad_r_obj.y=0

//addChild(broad_r_obj)

}


function drag_fn_l(event:MouseEvent):void
{


broad_l_obj.startDrag(false, new Rectangle(0, 0 , -1400, 0));
}
//event.target.parent.parent.startDrag( );



function drag_fn2_l(event:MouseEvent):void
{

broad_l_obj.stopDrag();
}

//--------------------------------------------------------center


broad_c_obj.visible=false

broad_o.broad_btn_c.addEventListener(MouseEvent.CLICK ,broad_btn_c_fn);


function broad_btn_c_fn(event:MouseEvent):void
{
  broad_c_obj.visible=true
}
broad_c_obj.close_btn.addEventListener(MouseEvent.CLICK ,broad_btn_c_fn2);


function broad_btn_c_fn2(event:MouseEvent):void
{
  broad_c_obj.visible=false
}













//----------------------------------------------------------------------------------------------------------------------------
broad_m.visible = false;
broad_o.visible = false;


var btn10_var:Boolean = false;

btn10.addEventListener(MouseEvent.MOUSE_DOWN ,btn10_Down);

function btn10_Down(event:MouseEvent):void
{


if (btn10_var==false)
{

	btn10.gotoAndStop(1);
	broad_m.visible = true;
	//broad_o.visible=true

	broad_m.play();
	btn10_var = true;
	moveTween = new Tween(btn11,"x",Regular.easeIn,btn11.x,b11x + 10,0.2,true);
}
}

broad_o.btn.addEventListener(MouseEvent.MOUSE_DOWN ,btn10s_Down);

function btn10s_Down(event:MouseEvent):void
{
broad_m.gotoAndStop(1);
broad_m.visible = false;
broad_o.visible = false;
btn10_var=false
;
}