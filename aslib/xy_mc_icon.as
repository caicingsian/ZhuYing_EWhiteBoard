


var  icon_location:Array = new Array()  //座標位置紀錄



//-----------------------------------------------小圖示1



xy_btn1.visible=false

xy_btn1.open_btn.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f) 

function xy_btn_f(event:MouseEvent):void {
	
	
	_xyMC1.visible=true
	xy_btn1.visible=false
	
	_xyMC1.x=xy_btn1.x
	_xyMC1.y=xy_btn1.y
	
	xy_btn1.stopDrag()
	
	
	}


xy_btn1.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f_d) 

function xy_btn_f_d(event:MouseEvent):void {
	  
	xy_btn1.startDrag()
	
	}
	

xy_btn1.addEventListener(MouseEvent.MOUSE_UP, xy_btn_f_ds) 


function xy_btn_f_ds(event:MouseEvent):void {
	  
	xy_btn1.stopDrag()
	
	}



_xyMC1.visible_btn.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f_v) 

function xy_btn_f_v(event:MouseEvent):void {
	
	    icon_location[0]=_xyMC1.x
		
		
		
		_xyMC1.visible=false
		xy_btn1.visible=true
	    xy_btn1.x=_xyMC1.x
		xy_btn1.y=_xyMC1.y
		xy_btn1.stopDrag()
	
	}
	
//-----------------------------------------------小圖示2



xy_btn2.visible=false

xy_btn2.open_btn.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f2) 

function xy_btn_f2(event:MouseEvent):void {
	
	
	_xyMC2.visible=true
	xy_btn2.visible=false
	
	_xyMC2.x=xy_btn2.x
	_xyMC2.y=xy_btn2.y
	
	xy_btn2.stopDrag()
	
	
	}


xy_btn2.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f_d2) 

function xy_btn_f_d2(event:MouseEvent):void {
	  
	xy_btn2.startDrag()
	
	}
	

xy_btn2.addEventListener(MouseEvent.MOUSE_UP, xy_btn_f_ds2) 


function xy_btn_f_ds2(event:MouseEvent):void {
	  
	xy_btn2.stopDrag()
	
	}



_xyMC2.visible_btn.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f_v2) 

function xy_btn_f_v2(event:MouseEvent):void {
	
	    _xyMC2.visible=false
		xy_btn2.visible=true
	    xy_btn2.x=_xyMC2.x
		xy_btn2.y=_xyMC2.y
		xy_btn2.stopDrag()
	
	}
	
//-----------------------------------------------小圖示1



xy_btn3.visible=false

xy_btn3.open_btn.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f3) 

function xy_btn_f3(event:MouseEvent):void {
	
	
	_xyMC3.visible=true
	xy_btn3.visible=false
	
	_xyMC3.x=xy_btn3.x
	_xyMC3.y=xy_btn3.y
	
	xy_btn3.stopDrag()
	
	
	}


xy_btn3.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f_d3) 

function xy_btn_f_d3(event:MouseEvent):void {
	  
	xy_btn3.startDrag()
	
	}
	

xy_btn3.addEventListener(MouseEvent.MOUSE_UP, xy_btn_f_ds3) 


function xy_btn_f_ds3(event:MouseEvent):void {
	  
	xy_btn3.stopDrag()
	
	}



_xyMC3.visible_btn.addEventListener(MouseEvent.MOUSE_DOWN, xy_btn_f_v3) 

function xy_btn_f_v3(event:MouseEvent):void {
	
	    _xyMC3.visible=false
		xy_btn3.visible=true
	    xy_btn3.x=_xyMC3.x
		xy_btn3.y=_xyMC3.y
		xy_btn3.stopDrag()
	
	}

