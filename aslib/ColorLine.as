var mycolor:Array= new Array();//顏色
mycolor[0] = "0x3E3A39";

var linesize2:Number=5 //粗細


var my_alpha:Number=1 //筆刷透明度



//---------------------------------------------------------------------   color2

pan_m2.color1.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0x3E3A39",1)});

pan_m2.color2.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0xE60012",2)});

pan_m2.color3.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0xEB6100",3)});

pan_m2.color4.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0xF8B62D",4)});

pan_m2.color5.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0x009A3E",5)});

pan_m2.color6.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0x00A29A",6)});

pan_m2.color7.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0x036EB8",7)});

pan_m2.color8.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0x0B318F",8)});

pan_m2.color9.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent4(e, "0x7E318E",9)});
			
function handleClickEvent4(e:MouseEvent,dstr:String,dstr2:Number)
	{
		trace("dstr2:"+dstr2)
		mycolor[0] = dstr
        pan_m2.pcmc.gotoAndStop(dstr2)
		
    }
	
	
	
//-------------------------------------------------------------------------  line2

pan_m2.line_mc.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent3(e, 1)});

pan_m2.line_mc2.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent3(e, 2)});

pan_m2.line_mc3.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent3(e, 3)});

pan_m2.line_mc4.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent3(e, 4)});

pan_m2.line_mc5.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent3(e, 5)});

pan_m2.line_mc6.addEventListener(MouseEvent.CLICK,function(e:MouseEvent){

handleClickEvent3(e, 6)});


function handleClickEvent3(e:MouseEvent,dstr2:Number)
	{
        linesize2  =dstr2
       
    }
