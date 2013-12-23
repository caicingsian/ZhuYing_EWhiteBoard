
//-------------------------------------圖形繪製

//var drawing_var:Boolean=false  //判斷是否有圖形

var draw_obj_record:Array= new Array()  //圖型繪製陣列

var record_nn:Number=0  //圖型繪製陣列編號


var mycolor2:Array=new Array();
mycolor2[0] = 0x000000

ffff="0x000000";


var squ_b:Boolean = false;
var squ_b2:Boolean = false;

//-
var squ_x:Number;
var squ_y:Number;

//-

var sqi:Number = 1;
var sqi_arry:Array=new Array();

var my_pan_dra= new pan_dra();

pan_m3.sq_btn.addEventListener(MouseEvent.CLICK ,sq_btn_fn_l);


function sq_btn_fn_l(event:MouseEvent):void
{
	 ffff3=1
	
	 _ruler5 =new draw_square()
	
	
	
	
	trace("_ruler5:"+_ruler5)

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	//-----------------------record
	
	 	 
	 draw_obj_record[record_nn]=_ruler5.name="draw" + sqi
	 
	 record_nn++ 	
	 
	 trace("draw_obj_record:"+draw_obj_record)
	 
	 
	  
	 
	 trace(" _ruler5.name:"+ _ruler5.name)
	
	record_draw()
		
	//---------------------------
	
	
	
	
    
	
	}



pan_m3.sq_btn2.addEventListener(MouseEvent.CLICK ,sq_btn_fn);

function sq_btn_fn(event:MouseEvent):void
{
	/*
	squ_b=true
	addChild(my_pan_dra);
	my_pan_dra.x = mouseX;
	my_pan_dra.y = mouseY;
	*/



	//Mouse.hide();

	//--------------------------
     ffff3=2
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
      _ruler5.y= _ruler5.x=200
	
	
	//-----------------------record
	
	 draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	 
	 record_nn++ 
	
	record_draw()
		
	//---------------------------

	//_ruler5.x=100
	  ;
	//_ruler5.y=100
	  ;
	
	/*
	if (line_var)
	{
		_ruler5._t_mc.alpha=0
		  ;
	}
	else
	{

		_ruler5._t_mc.alpha=100
		   ;
	}*/

	//----color
	
	/*
	var colorInfo:ColorTransform = _ruler5.transform.colorTransform;
	//var colorInfo2:ColorTransform = my_square.line_mc.transform.colorTransform;
    colorInfo.color = mycolor2[0];
	_ruler5.transform.colorTransform = colorInfo;
	//my_square.line_mc.transform.colorTransform = colorInfo2;
	*/
	//----------


	//----------------------------

}

function sq_btn_fn_c()
{

	var my_square= new draw_square();
	addChild(my_square);
	my_square.name = "square" + sqi;
	//-----------------------

	/*  紀錄
	cre_obj[cre_nn] = "square" + sqi;
	cre_nn++;
	
	*/

	//-------------------------record
	record[cn] = new Array(2);
	record[cn][0] = 1;
	record[cn][1] = "square" + sqi;
	cn++;
	trace("record:"+record);


	//-----------------------


	getChildByName(("square" + sqi)).addEventListener(MouseEvent.MOUSE_DOWN, square_fn);
	getChildByName(("square" + sqi)).addEventListener(MouseEvent.MOUSE_UP, square_fn2);


	
	if (line_var)
	{
		getChildByName("square"+sqi).t_mc.alpha=0
		  ;
	}
	else
	{

		getChildByName("square"+sqi).t_mc.alpha=100
		   ;
	}


	//

	//----color
	var colorInfo:ColorTransform = my_square.t_mc.transform.colorTransform;
	var colorInfo2:ColorTransform = my_square.line_mc.transform.colorTransform;
	colorInfo2.color = colorInfo.color = mycolor2[0];
	my_square.t_mc.transform.colorTransform = colorInfo;
	my_square.line_mc.transform.colorTransform = colorInfo2;
	//----------
	trace("square"+sqi);
}


function square_fn(event:MouseEvent):void
{


	if (eraser_var)
	{
		removeChild(event.target.parent);
	}
	else
	{
		event.target.parent.startDrag();
	}


	trace("event.target:"+event.target);
}


function square_fn2(event:MouseEvent):void
{

	event.target.parent.stopDrag();
}

function square_fn3(event:MouseEvent):void
{

	//event.target.parent.visible=false
	removeChild(event.target.parent);
}



//-----------------------------------------------------------------------------------------------------------circle
var cir_b:Boolean = false;

var cir_b2:Boolean = false;

pan_m3.cri_btn.addEventListener(MouseEvent.CLICK ,cri_btn_fn);

function cri_btn_fn(event:MouseEvent):void
{
	 ffff3=3
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	
	//-----------------------record
	
	draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	
	record_nn++ 
	
	record_draw()
		
	//---------------------------
	
	
	// _ruler5.name="ss1"
	 
	// getChildByName("ss1").x=400
	 
	 //trace("ssss")
	
	
	}


pan_m3.cri_btn2.addEventListener(MouseEvent.CLICK ,cri_btn_fn_l);

function cri_btn_fn_l(event:MouseEvent):void
{

   	 ffff3=4
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	//-----------------------record
	
	draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	
	record_nn++ 
	
	record_draw()
		
	//---------------------------

	/*
	cir_b=true
	;
	addChild(my_pan_dra);
	my_pan_dra.x = mouseX;
	my_pan_dra.y = mouseY;
	*/
	//Mouse.hide()
}

function cir_btn_fn_c()
{

	var my_circle_mc= new circle_mc();
	addChild(my_circle_mc);
	my_circle_mc.name="circle"+sqi
	;
	//-----------------------
	//cre_obj[cre_nn]="circle"+sqi
	//cre_nn++
	//--------------
	//-------------------------record
	record[cn] = new Array(2);
	record[cn][0] = 1;
	record[cn][1] = "circle" + sqi;
	cn++;
	trace("record:"+record);


	//-----------------------


	getChildByName(("circle" + sqi)).addEventListener(MouseEvent.MOUSE_DOWN, square_fn);
	getChildByName(("circle" + sqi)).addEventListener(MouseEvent.MOUSE_UP, square_fn2);
	//getChildByName("circle"+sqi).xx_b.addEventListener(MouseEvent.MOUSE_UP, square_fn3;//----color;

	if (line_var)
	{
		getChildByName("circle"+sqi).t_mc.alpha=0
		  ;
	}
	else
	{

		getChildByName("circle"+sqi).t_mc.alpha=100
		   ;
	}


	var colorInfo:ColorTransform = my_circle_mc.t_mc.transform.colorTransform;
	var colorInfo2:ColorTransform = my_circle_mc.line_mc.transform.colorTransform;
	colorInfo2.color = colorInfo.color = mycolor2[0];
	my_circle_mc.t_mc.transform.colorTransform = colorInfo;
	my_circle_mc.line_mc.transform.colorTransform = colorInfo2;
	//----------

}



//----------------------------------------------------------------------------------------------------------------------  triangle

var tra_b:Boolean = false;

var tra_b2:Boolean = false;

pan_m3.tra_btn.addEventListener(MouseEvent.CLICK ,tra_btn_fn);

function tra_btn_fn(event:MouseEvent):void
{
		 ffff3=5
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	 	//-----------------------record
	
	 draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	 
	 record_nn++ 
	
	record_draw()
		
	//---------------------------
	
	}


pan_m3.tra_btn2.addEventListener(MouseEvent.CLICK ,tra_btn_fn_l);

function tra_btn_fn_l(event:MouseEvent):void
{

		 ffff3=6
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	 	//-----------------------record
	
	 draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	 
	 record_nn++ 
	
	record_draw()
		
	//---------------------------
	
	
	/*
	tra_b=true
	;
	addChild(my_pan_dra);
	my_pan_dra.x = mouseX;
	my_pan_dra.y = mouseY;
	*/
	//Mouse.hide()
}

function tra_btn_fn_c()
{

	var my_triangle_mc= new triangle_mc();
	addChild(my_triangle_mc);
	my_triangle_mc.name="triangle"+sqi
	;
	//-----------------------
	//cre_obj[cre_nn]="triangle"+sqi
	//cre_nn++
	//--------------

	//-------------------------record
	record[cn] = new Array(2);
	record[cn][0] = 1;
	record[cn][1] = "triangle" + sqi;
	cn++;
	trace("record:"+record);


	//-----------------------


	getChildByName(("triangle" + sqi)).addEventListener(MouseEvent.MOUSE_DOWN, square_fn);
	getChildByName(("triangle" + sqi)).addEventListener(MouseEvent.MOUSE_UP, square_fn2);
	//getChildByName("triangle"+sqi).xx_b.addEventListener(MouseEvent.MOUSE_UP, square_fn3;//----color;


	if (line_var)
	{
		getChildByName("triangle"+sqi).t_mc.alpha=0
		  ;
	}
	else
	{

		getChildByName("triangle"+sqi).t_mc.alpha=100
		   ;
	}

	var colorInfo:ColorTransform = my_triangle_mc.t_mc.transform.colorTransform;
	var colorInfo2:ColorTransform = my_triangle_mc.line_mc.transform.colorTransform;
	colorInfo2.color = colorInfo.color = mycolor2[0];
	my_triangle_mc.t_mc.transform.colorTransform = colorInfo;
	my_triangle_mc.line_mc.transform.colorTransform = colorInfo2;
	//----------

}


//-----------------------------------------------------------------------------------------------------------star
var star_b:Boolean = false;

var star_b2:Boolean = false;

pan_m3.star_btn.addEventListener(MouseEvent.CLICK ,star_b_fn);

function star_b_fn(event:MouseEvent):void
{
	   		 ffff3=7
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	 	//-----------------------record
	
	 draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	 
	 record_nn++ 
	
	record_draw()
		
	//---------------------------
	}


pan_m3.star_btn2.addEventListener(MouseEvent.CLICK ,star_b_fn_l);

function star_b_fn_l(event:MouseEvent):void
{

   		 ffff3=8
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	 	//-----------------------record
	
	draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	
	 record_nn++ 
	
	record_draw()
		
	//---------------------------
	
	
	
	/*
	star_b=true
	;
	addChild(my_pan_dra);
	my_pan_dra.x = mouseX;
	my_pan_dra.y = mouseY;
	*/
	//Mouse.hide()
}


function star_btn_fn_c()
{

	var my_star_mc= new star_mc();
	addChild(my_star_mc);
	my_star_mc.name="star"+sqi
	;
	//-----------------------
	//cre_obj[cre_nn]="star"+sqi
	//cre_nn++
	//--------------

	//-------------------------record
	record[cn] = new Array(2);
	record[cn][0] = 1;
	record[cn][1] = "star" + sqi;
	cn++;
	trace("record:"+record);


	//-----------------------

	getChildByName(("star" + sqi)).addEventListener(MouseEvent.MOUSE_DOWN, square_fn);
	getChildByName(("star" + sqi)).addEventListener(MouseEvent.MOUSE_UP, square_fn2);
	//getChildByName("star"+sqi).xx_b.addEventListener(MouseEvent.MOUSE_UP, square_fn3;//----color;


	if (line_var)
	{
		getChildByName("star"+sqi).t_mc.alpha=0
		  ;
	}
	else
	{

		getChildByName("star"+sqi).t_mc.alpha=100
		   ;
	}

	var colorInfo:ColorTransform = my_star_mc.t_mc.transform.colorTransform;
	var colorInfo2:ColorTransform = my_star_mc.line_mc.transform.colorTransform;
	colorInfo2.color = colorInfo.color = mycolor2[0];
	my_star_mc.t_mc.transform.colorTransform = colorInfo;
	my_star_mc.line_mc.transform.colorTransform = colorInfo2;
	//----------

}


//-----------------------------------------------------------------------------------------------------------Polygon
var poly_b:Boolean = false;

var poly_b2:Boolean = false;

pan_m3.ploy_btn.addEventListener(MouseEvent.CLICK ,ploy_b_fn);


function ploy_b_fn(event:MouseEvent):void
{
	 ffff3=9
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	 	//-----------------------record
	
	draw_obj_record[record_nn]=  _ruler5.name="draw" + sqi
	
	record_nn++ 
	
	record_draw()
		
	//---------------------------
	
	}


pan_m3.ploy_btn2.addEventListener(MouseEvent.CLICK ,ploy_b_fn_l);


function ploy_b_fn_l(event:MouseEvent):void
{

	 ffff3=10
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
     
	 	//-----------------------record
	
	 draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	 
	 record_nn++ 
	
	record_draw()
		
	//---------------------------
	
	/*
	poly_b=true
	;
	addChild(my_pan_dra);
	my_pan_dra.x = mouseX;
	my_pan_dra.y = mouseY;
	*/
	
	//Mouse.hide()
}


function ploy_btn_fn_c()
{

	var my_polygon_mc= new polygon_mc();
	addChild(my_polygon_mc);
	my_polygon_mc.name="polygon"+sqi
	;
	//-----------------------
	//cre_obj[cre_nn]="polygon"+sqi
	//cre_nn++
	//--------------

	//-------------------------record
	record[cn] = new Array(2);
	record[cn][0] = 1;
	record[cn][1] = "polygon" + sqi;
	cn++;
	trace("record:"+record);


	//-----------------------

	getChildByName(("polygon" + sqi)).addEventListener(MouseEvent.MOUSE_DOWN, square_fn);
	getChildByName(("polygon" + sqi)).addEventListener(MouseEvent.MOUSE_UP, square_fn2);
	//getChildByName("polygon"+sqi).xx_b.addEventListener(MouseEvent.MOUSE_UP, square_fn3;//----color;

	if (line_var)
	{
		getChildByName("polygon"+sqi).t_mc.alpha=0
		  ;
	}
	else
	{

		getChildByName("polygon"+sqi).t_mc.alpha=100
		   ;
	}


	var colorInfo:ColorTransform = my_polygon_mc.t_mc.transform.colorTransform;
	var colorInfo2:ColorTransform = my_polygon_mc.line_mc.transform.colorTransform;
	colorInfo2.color = colorInfo.color = mycolor2[0];
	my_polygon_mc.t_mc.transform.colorTransform = colorInfo;
	my_polygon_mc.line_mc.transform.colorTransform = colorInfo2;
	//----------
	trace("polygon");
}



//-------------------------------------------------------------------------------------------------------------------rr square

var rpoly_b:Boolean = false;

var rpoly_b2:Boolean = false;

pan_m3.rploy_btn.addEventListener(MouseEvent.CLICK ,rploy_b_fn);

function rploy_b_fn(event:MouseEvent):void
{
	
		ffff3=11
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	 	//-----------------------record
	
	draw_obj_record[record_nn]=  _ruler5.name="draw" + sqi
	
	record_nn++ 	
	
	record_draw()
		
	//---------------------------
	
	}


pan_m3.rploy_btn2.addEventListener(MouseEvent.CLICK ,rploy_b_fn_l);

function rploy_b_fn_l(event:MouseEvent):void
{

	ffff3=12
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	 
	 	//-----------------------record
	
	 draw_obj_record[record_nn]=_ruler5.name="draw" + sqi
	 
	 record_nn++ 	
	
	record_draw()
		
	//---------------------------
	
	
	/*
	rpoly_b=true
	;
	addChild(my_pan_dra);
	my_pan_dra.x = mouseX;
	my_pan_dra.y = mouseY;
	*/
	//Mouse.hide()
}


function rploy_btn_fn_c()
{

	var my_rploy_mc= new rploy_mc();
	addChild(my_rploy_mc);
	my_rploy_mc.name="rpolygon"+sqi
	;
	//-----------------------
	//cre_obj[cre_nn]="rpolygon"+sqi
	//cre_nn++
	//--------------

	//-------------------------record
	record[cn] = new Array(2);
	record[cn][0] = 1;
	record[cn][1] = "rpolygon" + sqi;
	cn++;
	trace("record:"+record);


	//-----------------------

	getChildByName(("rpolygon" + sqi)).addEventListener(MouseEvent.MOUSE_DOWN, square_fn);
	getChildByName(("rpolygon" + sqi)).addEventListener(MouseEvent.MOUSE_UP, square_fn2);
	//getChildByName("rpolygon"+sqi).xx_b.addEventListener(MouseEvent.MOUSE_UP, square_fn3;//----color;


	if (line_var)
	{
		getChildByName("rpolygon"+sqi).t_mc.alpha=0
		  ;
	}
	else
	{

		getChildByName("rpolygon"+sqi).t_mc.alpha=100
		  ;
	}

	var colorInfo:ColorTransform = my_rploy_mc.t_mc.transform.colorTransform;
	var colorInfo2:ColorTransform = my_rploy_mc.line_mc.transform.colorTransform;
	colorInfo2.color = colorInfo.color = mycolor2[0];
	my_rploy_mc.t_mc.transform.colorTransform = colorInfo;
	my_rploy_mc.line_mc.transform.colorTransform = colorInfo2;
	//----------
	trace("polygon");
}


//-------------------------------------------------------------------------------------------------------------------love

var love_b:Boolean = false;

var love_b2:Boolean = false;

pan_m3.love_btn.addEventListener(MouseEvent.CLICK ,love_b_fn);

function love_b_fn(event:MouseEvent):void
{
			 ffff3=13
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	
		//-----------------------record
	
	draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	
	record_nn++ 	
	
	record_draw()
		
	//---------------------------
	
	}


pan_m3.love_btn2.addEventListener(MouseEvent.CLICK ,love_b_fn_l);

function love_b_fn_l(event:MouseEvent):void
{

		 ffff3=14
	
	_ruler5 =new draw_square()

     addChild(_ruler5)
	 
	 _ruler5.y= _ruler5.x=200
	
		//-----------------------record
	
	 draw_obj_record[record_nn]= _ruler5.name="draw" + sqi
	 
	 record_nn++
	
	record_draw()
		
	//---------------------------
	
	/*
	love_b=true
	;
	addChild(my_pan_dra);
	my_pan_dra.x = mouseX;
	my_pan_dra.y = mouseY;
	*/
	//Mouse.hide()
}


function love_btn_fn_c()
{

	var my_love_mc= new love_mc();
	addChild(my_love_mc);
	my_love_mc.name="love"+sqi
	;
	//-----------------------
	//cre_obj[cre_nn]="love"+sqi
	//cre_nn++
	//--------------

	//-------------------------record
	record[cn] = new Array(2);
	record[cn][0] = 1;
	record[cn][1] = "love" + sqi;
	cn++;
	trace("record:"+record);


	//-----------------------

	getChildByName(("love" + sqi)).addEventListener(MouseEvent.MOUSE_DOWN, square_fn);
	getChildByName(("love" + sqi)).addEventListener(MouseEvent.MOUSE_UP, square_fn2);
	//getChildByName("love"+sqi).xx_b.addEventListener(MouseEvent.MOUSE_UP, square_fn3;//----color;


	if (line_var)
	{
		getChildByName("love"+sqi).t_mc.alpha=0
		  ;
	}
	else
	{

		getChildByName("love"+sqi).t_mc.alpha=100
		   ;
	}

	var colorInfo:ColorTransform = my_love_mc.t_mc.transform.colorTransform;
	var colorInfo2:ColorTransform = my_love_mc.line_mc.transform.colorTransform;
	colorInfo2.color = colorInfo.color = mycolor2[0];
	my_love_mc.t_mc.transform.colorTransform = colorInfo;
	my_love_mc.line_mc.transform.colorTransform = colorInfo2;
	//----------
	trace("polygon");
}


//---------------------------------------------------   color

pan_m3.color1.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0x3E3A39",1)});

pan_m3.color2.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0xE60012",2)});

pan_m3.color3.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0xEB6100",3)});

pan_m3.color4.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0xF8B62D",4)});

pan_m3.color5.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0x009A3E",5)});

pan_m3.color6.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0x00A29A",6)});

pan_m3.color7.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0x036EB8",7)});

pan_m3.color8.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0x0B318F",8)});

pan_m3.color9.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent5(e, "0x7E318E",9)});

function handleClickEvent5(e:MouseEvent,dstr:String,dstr2:Number)
{
	trace("dstr2:"+dstr2);
	mycolor2[0] = dstr;
	ffff=dstr
	pan_m3.pcmc.gotoAndStop(dstr2);
}
//------------------------------------------------------------------------------;
var line_var:Boolean = false;//外框或矩形判斷
ffff2=line_var

pan_m3.love_btn2.visible = pan_m3.rploy_btn2.visible = pan_m3.cri_btn2.visible = pan_m3.sq_btn2.visible = pan_m3.tra_btn2.visible = pan_m3.ploy_btn2.visible = pan_m3.star_btn2.visible = false;

pan_m3.pancil.addEventListener(MouseEvent.CLICK ,pancil3_fn);

function pancil3_fn(event:MouseEvent):void
{


	pan_m3.love_btn.visible = pan_m3.rploy_btn.visible = pan_m3.cri_btn.visible = pan_m3.sq_btn.visible = pan_m3.tra_btn.visible = pan_m3.ploy_btn.visible = pan_m3.star_btn.visible = true;
	pan_m3.love_btn2.visible=pan_m3.rploy_btn2.visible=pan_m3.cri_btn2.visible=pan_m3.sq_btn2.visible=pan_m3.tra_btn2.visible=pan_m3.ploy_btn2.visible=pan_m3.star_btn2.visible=false
	;
	ffff2=line_var = false;
}

pan_m3.pancil2.addEventListener(MouseEvent.CLICK ,pancil3_fn2);

function pancil3_fn2(event:MouseEvent):void
{
	pan_m3.love_btn.visible = pan_m3.rploy_btn.visible = pan_m3.cri_btn.visible = pan_m3.sq_btn.visible = pan_m3.tra_btn.visible = pan_m3.ploy_btn.visible = pan_m3.star_btn.visible = false;
	pan_m3.love_btn2.visible=pan_m3.rploy_btn2.visible=pan_m3.cri_btn2.visible=pan_m3.sq_btn2.visible=pan_m3.tra_btn2.visible=pan_m3.ploy_btn2.visible=pan_m3.star_btn2.visible=true
	;
	ffff2=line_var = true;
}




//---------------------------record

function record_draw(){
	
	
	record[cn] = new Array(2);
	record[cn][0] = 1;
	record[cn][1] = "draw" + sqi;
	cn++;
	sqi++
	trace("record:"+record);
	
	}










