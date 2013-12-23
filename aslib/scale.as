import flash.display.Sprite;

sc_mc.visible = false;

sc_mc_s.visible = false;

var scale:Number;

var nnx:Number;
var nny:Number;


//var sc_mc= new _sc_mc()
//addChild(sc_mc)

var loader_mc_w:Number=loader_mc.width  //原始物件寬

var loader_mc_h:Number=loader_mc.height  //原始物件高




//------------

var isDown:Boolean = false;
var oldX:Number;
var oldY:Number;
var nowX:Number;
var nowY:Number;


var sc_ojb:Boolean = false;

var hand_var:Boolean = false;

var sc_mcX:Number = sc_mc.x;
var sc_mcY:Number = sc_mc.y;
//-----------------------------------------放大

function onRollin()
{


	
	//--------------------------------
	
	trace("sw:"+sw);
	trace("sh:"+sh);
	//
	sc_mc.x = sc_mcX;
	sc_mc.y = sc_mcY;
	sc_ojb = false;
	//this.removeEventListener(Event.ENTER_FRAME, EnterFrame);
	//Mouse.show();
	//trace("Mouse.show()");
	//

	if (square.width > square.height)
	{
		scale=sw/(square.width);
	}
	else
	{
		scale=sh/(square.height)
		;
	}
	if (scale==Infinity)
	{

		scale = 2;
	}


	if (scale> 4)
	{
		scale = 4;
	}


	if (oldX< mouseX)
	{

		nnx = loader_mc.x - oldX * scale * scale2;
	}
	else
	{
		nnx = loader_mc.x - mouseX * scale * scale2;
	}

	if (oldY < mouseY)
	{
		nny = loader_mc.y - oldY * scale * scale2;
	}
	else
	{

		nny = loader_mc.y - mouseY * scale * scale2;
	}



	//-------------
	scale2 = scale * scale2;
	trace(" scale2:"+ scale2);

	trace(" scale:"+ scale);
	

	if (scale2 < 4.5  &&  int(scale2) >1 )
	{

		moveTween = new Tween(loader_mc,"scaleX",Strong.easeIn,loader_mc.scaleX,loader_mc.scaleX * int(scale),0.5,true);
		moveTween = new Tween(loader_mc,"scaleY",Strong.easeIn,loader_mc.scaleY,loader_mc.scaleY * int(scale),0.5,true);

		moveTween = new Tween(loader_mc,"x",Strong.easeIn,loader_mc.x,nnx,0.5,true);
		moveTween = new Tween(loader_mc,"y",Strong.easeIn,loader_mc.y,nny,0.5,true);
		
		//-----------------縮放後記錄
		
		record2[cn-1] = new Array(4)
		
		record2[cn-1][0]= loader_mc.scaleX * int(scale)
		record2[cn-1][1]= loader_mc.scaleY * int(scale)
		record2[cn-1][2]= nnx
		record2[cn-1][3]= nny
		
		//-------------------
		
	}
	else
	{

		moveTween = new Tween(loader_mc,"scaleX",Strong.easeIn,loader_mc.scaleX,loader_mc.scaleX * 1.2,0.5,true);
		moveTween = new Tween(loader_mc,"scaleY",Strong.easeIn,loader_mc.scaleY,loader_mc.scaleY * 1.2,0.5,true);

		moveTween = new Tween(loader_mc,"x",Strong.easeIn,loader_mc.x, loader_mc.x+((loader_mc.width-(loader_mc.width* 1.2))/2 ) ,0.5,true);
		moveTween = new Tween(loader_mc,"y",Strong.easeIn,loader_mc.y, loader_mc.y+((loader_mc.height-(loader_mc.height* 1.2))/2 ) ,0.5,true)
		
		
	    //-----------------縮放後記錄
		
		record2[cn-1] = new Array(4)
		
		record2[cn-1][0]= loader_mc.scaleX * 1.2
		record2[cn-1][1]= loader_mc.scaleY * 1.2
		record2[cn-1][2]= loader_mc.x+((loader_mc.width-(loader_mc.width* 1.2))/2 )
		record2[cn-1][3]= loader_mc.y+((loader_mc.height-(loader_mc.height* 1.2))/2 )
		
		//-------------------
		;
	}



	trace("nnx:"+nnx);
	trace("nny:"+nny);
	isDown = false;
	square.graphics.clear();
	//;

	sc_mc.visible = false;
	




}

//-----------------------------------------縮小鏡

var sc_ojb_s:Boolean = false;

var reset_xy:Boolean=false


function onReset()
{
    
     if(scale2> 2){
		 
		 	 loader_mc.width = 3000
	 loader_mc.height = 1687
	 loader_mc.x=-400
	 loader_mc.y=-200
		 trace("set1")
		 
		 }else{
	 
	 loader_mc.width = sw;
	 loader_mc.height = sh;
	 loader_mc.x=loader_mc.y=0
	 
	  trace("set2")
	 }
	
	//w
	
	/*if (loader_mc.width > sw + 400)
	{
		moveTween = new Tween(loader_mc,"scaleX",Strong.easeIn,loader_mc.scaleX,loader_mc.scaleX * 0.5,0.5,true);
	}
	else
	{
		loader_mc.width = sw;
		
		loader_mc.x=loader_mc.y=0
		
		reset_xy=true
		
		trace("000w")
	}

	//h
	
	if (loader_mc.height > sh + 200)
	{
		moveTween = new Tween(loader_mc,"scaleY",Strong.easeIn,loader_mc.scaleY,loader_mc.scaleY * 0.5,0.5,true);
	}
	else
	{
		loader_mc.height = sh;

		
		loader_mc.x=loader_mc.y=0
		
		reset_xy=true
		
		trace("000h")
	}
    

	//trace("int(scale/2):"+int(scale/2));
	trace("loader_mc.x:"+loader_mc.x)
	
	trace("loader_mc.y:"+loader_mc.y)
	
	trace("loader_mc.width:"+loader_mc.width)
	
	trace("loader_mc.height:"+loader_mc.height)
	//x
	
	
	if(reset_xy==false){
	
	if (loader_mc.x < -400)
	{
		moveTween = new Tween(loader_mc, "x", Strong.easeIn, loader_mc.x, loader_mc.x+int(scale)*400 , 0.5, true);
	}
	else if (loader_mc.x > 400)
	{
		moveTween = new Tween(loader_mc, "x", Strong.easeIn, loader_mc.x, loader_mc.x-int(scale)*400 , 0.5, true);

	}
	else
	{
		moveTween = new Tween(loader_mc,"x",Strong.easeIn,loader_mc.x,0,0.5,true);
	}

	//y
	
	if (loader_mc.y < -200)
	{
		moveTween = new Tween(loader_mc, "y",Strong.easeIn, loader_mc.y, loader_mc.y+int(scale)*200  , 0.5, true);
	}
	else if ( loader_mc.x > 200 )
	{
		moveTween = new Tween(loader_mc, "y",Strong.easeIn, loader_mc.y, loader_mc.y-int(scale)*200  , 0.5, true);
	}
	else
	{
		moveTween = new Tween(loader_mc,"y",Strong.easeIn,loader_mc.y,0,0.5,true);
	}
	}
	
	//moveTween = new Tween(loader_mc, "x", Strong.easeIn, loader_mc.x, loader_mc.x * 0.5  , 0.5, true);
     //moveTween = new Tween(loader_mc, "y", Strong.easeIn, loader_mc.y, loader_mc.y * 0.5  , 0.5, true);
	 */
	scale2=1
	;

}



//-- 長 寬 座標紀錄
var crd_w:Number;
var crd_h:Number;
var crd_x:Number;
var crd_y:Number;


function rec_whxy()
{
	crd_w = loader_mc.width;
	crd_h = loader_mc.height;
	crd_x = loader_mc.x;
	crd_y=loader_mc.y
	  ;
	record[cn] = new Array(5);
	record[cn][0]=2
	  ;
	//-------縮放前
	record[cn][1] = crd_w;
	record[cn][2] = crd_h;
	record[cn][3] = crd_x;
	record[cn][4]=crd_y
	  
	  
	
	  
	  
	  ;
	cn++;
	trace("record:"+record);
}


function rec_whxy2()
{
	//crd_w=loader_mc.width
	//crd_h=loader_mc.height
	crd_x = loader_mc.x;
	crd_y=loader_mc.y
	  ;
	record[cn] = new Array(3);
	record[cn][0] = 4;
	//record[cn][1]=crd_w
	//record[cn][2]=crd_h
	record[cn][1] = crd_x;
	record[cn][2]=crd_y
	  
	  
	  ;
	cn++;
	trace("record:"+record);
}