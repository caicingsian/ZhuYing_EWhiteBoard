package 
{



	import com.ouorange.toolbar.Pen;
	import com.ouorange.toolbar.PenControl;
	import com.ouorange.toolbar.measuretool.CommonMeasureTool;
	import com.ouorange.toolbar.measuretool.RightAngleSetSquare;
	import com.ouorange.toolbar.measuretool.Protractor; //量角器
	import com.ouorange.toolbar.measuretool.EquilateralSetSquare; //等邊三角板
	import com.ouorange.toolbar.measuretool.RightAngleSetSquare; //銳角三角板
	import com.ouorange.toolbar.measuretool.Ruler; //直尺
	
	import com.ouorange.toolbar.measuretool.draw_square; //直尺
	import com.ouorange.toolbar.measuretool.draw_square_l; //直尺
	

	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;





	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.events.MouseEvent;
	import fl.transitions.easing.*;
	import fl.transitions.Tween;
	import flash.geom.ColorTransform;
	import flash.events.Event;


	import fl.controls.Slider;
	import fl.events.SliderEvent;
	import fl.controls.Label;
	import fl.containers.UILoader;

	//---------------------------

	import flash.display.BitmapData;
	import flash.display.Bitmap;

	import flash.geom.Matrix;

	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import flash.display.BlendMode;
	import flash.display.Graphics;

    import flash.display.Stage;
	//--------------------------


	public class main extends MovieClip
	{

        public static var stageRef:Stage;
		
		public var ffff:String //圖形顏色
		
		public var ffff2:Boolean //框線判斷
		
		public var ffff3:Number //圖形判斷
		
		public var xy_nn:Number  //座標圖數量
		
		public var pen_tool_var:Boolean=false  //鉛筆開啟狀態辦別
		
		private static var _instance:main;		
		
		public static function get instance():main
		{
			if( _instance == null ) _instance = new main();
			return _instance;
		}
		
		public function main()
		{
			_instance = this;
			
			var tt:Number=1
			//----------
			
			line_btn.visible=false
			
			//-----------------------------------------xy 座標圖
			var _xyMC1:MovieClip= new xy_object()
			var _xyMC2:MovieClip= new xy_object()
			var _xyMC3:MovieClip= new xy_object()
			
			include "aslib/xy_mc_icon.as"

			//================================================   量尺畫線  ======================================================
			_ruler = new Protractor();
			_ruler2 =new EquilateralSetSquare();
			_ruler3 =new RightAngleSetSquare();
			_ruler4 =new Ruler();
			
			_ruler.x=_ruler2.x=_ruler3.x=_ruler4.x=300
			_ruler.y=_ruler2.y=_ruler3.y=_ruler4.y=300

			_pen = new Pen();
			addChild( _pen );

			_penControl = new PenControl(stage);
			_penControl.setCurrentPen( _pen );
			_penControl.appendMeasureTool( _ruler );
			_penControl.appendMeasureTool( _ruler2 );
			_penControl.appendMeasureTool( _ruler3 );
			_penControl.appendMeasureTool( _ruler4 );

			stage.addEventListener( KeyboardEvent.KEY_UP , onKeyDown );
			
			//======================================================================================================= 筆刷
            include "aslib/ColorLine.as"

			//主容器(主要內容)
			
			//---------------class import
			
			var main_tab:Sprite= new Draw_tab()
			var main_tab2:Sprite= new Draw_tab()
			var main_tab3:Sprite= new Draw_tab()
			var main_tab4:Sprite= new Draw_tab()
			var main_tab5:Sprite= new Draw_tab()
			//trace("main_tab.x:"+main_tab.x)
				
			mc_move.addChild(main_tab)			

			//主容器(上方)			
			broad_t_obj.mc.addChild(main_tab2);
			
			//主容器(左方)
        	broad_l_obj.mc.addChild(main_tab3);

			//主容器(右方)
			broad_r_obj.mc.addChild(main_tab4);

			//主容器(下方)			
			broad_b_obj.mc.addChild(main_tab5);
			
			

			//--------------座標圖白板
			
		    addChild(_xyMC1)
			_xyMC1.visible=false
			
			addChild(_xyMC2)
			_xyMC2.visible=false
			
			addChild(_xyMC3)
			_xyMC3.visible=false
			
			//_xyMC1.x=_xyMC1.y=_xyMC2.x=_xyMC2.y=_xyMC3.x=_xyMC3.y=-500
			

			
			var _xyMC1_size:Number=_xyMC1.width  //預設座標圖尺寸
			trace("_xyMC1_size:"+_xyMC1_size)
			
			var  _xyMC1_adjust:Number  //放大值
			var  _xyMC_adjust2:Number  //放大值
            			
			
			var main_tab6:Sprite= new Draw_tab2()
			var main_tab7:Sprite= new Draw_tab2()
			var main_tab8:Sprite= new Draw_tab2()
			
			//_xyMC1.bg.addChild(main_tab6)
			_xyMC1.addChild(main_tab6)
			_xyMC2.addChild(main_tab7)
			_xyMC3.addChild(main_tab8)
			
			trace("main_tab6:"+main_tab6.content.width)
			
			
			
			
			
		  
		  
		  //-----------------------------------
		  
		  var ss:MovieClip= new _ss()
			addChild(ss)
			ss.alpha=0
		  
		  
		  //----------
		  
		   draw_btn_control.visible=false
		   
		   draw_btn_control.addEventListener(MouseEvent.MOUSE_DOWN,draw_btn_control_f);


			function draw_btn_control_f(e:MouseEvent):void
			{
				if(mc_move.visible==true)
				  {
					  mc_move.visible=false
					   draw_btn_control.gotoAndStop(2)
					   trace("c1")
					  
					  }else{
						  
					   mc_move.visible=true
					   draw_btn_control.gotoAndStop(1)
						 trace("c2") 
						  }
				  
				}
		  
		  
		  //----------------------直線與曲線
		  
		  var line_draw:Boolean=false  //直線執行判斷
		  
		  var line_draw2:Boolean=false  //曲線執行判斷
		  
		  line_btn.addEventListener(MouseEvent.MOUSE_DOWN,line_btn_f);


			function line_btn_f(e:MouseEvent):void
			{
				line_draw=true
				}
				
		/*s_line_btn.addEventListener(MouseEvent.MOUSE_DOWN,s_line_btn_f);
				
			function s_line_btn_f(e:MouseEvent):void
			{
				line_draw2=true
				}*/
				
			var lineX:Number
			var lineY:Number
			
		  
			 
			
			//---------------------------------------------------------;
			var pen_target:Number = 0;//  鉛筆目前作用面板  ( 0.中間  1.上方  2.左方 3.右方  4.下方 )
			//默认选中画笔
			var action:Number = 0;
			trace("筆畫");

			//broad_t_obj.addChild(mc_move)
			
			
			mc_move.addEventListener(MouseEvent.MOUSE_DOWN,startDraw);

			broad_t_obj.mc.addEventListener(MouseEvent.MOUSE_DOWN,startDraw);
			broad_l_obj.mc.addEventListener(MouseEvent.MOUSE_DOWN,startDraw);
			broad_r_obj.mc.addEventListener(MouseEvent.MOUSE_DOWN,startDraw);
			broad_b_obj.mc.addEventListener(MouseEvent.MOUSE_DOWN,startDraw);
			
			//-----------
			
			_xyMC1.addEventListener(MouseEvent.MOUSE_DOWN,startDraw);
			_xyMC2.addEventListener(MouseEvent.MOUSE_DOWN,startDraw);
			_xyMC3.addEventListener(MouseEvent.MOUSE_DOWN,startDraw);
			
			
			
			
			
			
			//-----------
			var startDraw_c:Boolean=false //判斷是否執行筆畫


			function startDraw(e:MouseEvent):void
			{
				
				if(startDraw_c){
				
				//trace("_xyMC1.width:"+_xyMC1.width)
				
				//trace(" _xyMC1.width- _xyMC1_size:"+ (_xyMC1.width- _xyMC1_size))
				
				_xyMC1_adjust=int(((_xyMC1.width- _xyMC1_size)* 0.5))
				
				_xyMC1_adjust2=int(((_xyMC1.width- _xyMC1_size) * 0.5))
				
				_xyMC2_adjust=int(((_xyMC2.width- _xyMC1_size)* 0.5))
				
				_xyMC2_adjust2=int(((_xyMC2.width- _xyMC1_size) * 0.5))
				
				_xyMC3_adjust=int(((_xyMC3.width- _xyMC1_size)* 0.5))
				
				_xyMC3_adjust2=int(((_xyMC3.width- _xyMC1_size) * 0.5))

				trace("_xyMC1_adjust:"+_xyMC1_adjust)
				

                 trace("ddddd")
				if (ss.hitTestObject(broad_t_obj))
				{
					trace("top");
					pen_target = 1;

					main_tab2.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
					ss.x = _pen.drawPoint.x;
					ss.y = _pen.drawPoint.y;
					if (action==0)
					{

						//------------------------------------
						if(line_draw){
							lineX=mouseX
							lineY=mouseY-(broad_t_obj.y)
							}
						//-------------------------------------

						main_tab2.mc.graphics.moveTo(ss.x,ss.y-(broad_t_obj.y));	
						//mc2.graphics.moveTo(mouseX,mouseY-(broad_t_obj.y));	

					}
					else
					{
						main_tab2.mc.graphics.moveTo(mouseX,mouseY-(broad_t_obj.y));
					}


					broad_t_obj.mc.addEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.addEventListener(MouseEvent.MOUSE_UP,stopDraw);


				}
				else if (ss.hitTestObject(broad_l_obj)){
					
					trace("left")
					
					pen_target = 2

					main_tab3.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
					ss.x = _pen.drawPoint.x;
					ss.y = _pen.drawPoint.y;
					if (action==0)
					{
						//------------------------------------
						if(line_draw){
							lineX=mouseX-(broad_l_obj.x)
							lineY=mouseY
							}
						//-------------------------------------
						
						main_tab3.mc.graphics.moveTo(ss.x-(broad_l_obj.x),ss.y);

					}
					else
					{
						main_tab3.mc.graphics.moveTo(mouseX-(broad_l_obj.x),mouseY);
					}


					broad_l_obj.mc.addEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.addEventListener(MouseEvent.MOUSE_UP,stopDraw);
					
					
					
					
					}
				
				else if (ss.hitTestObject(broad_r_obj)){
					
					trace("right")
					
					pen_target =3

					main_tab4.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
					ss.x = _pen.drawPoint.x;
					ss.y = _pen.drawPoint.y;
					if (action==0)
					{
                                         
						//------------------------------------
						if(line_draw){
							lineX=mouseX-(broad_l_obj.x)
							lineY=mouseY
							}
						//-------------------------------------						
						main_tab4.mc.graphics.moveTo(ss.x-(broad_r_obj.x),ss.y);

					}
					else
					{
						main_tab4.mc.graphics.moveTo(mouseX-(broad_r_obj.x),mouseY);
					}


					broad_r_obj.mc.addEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.addEventListener(MouseEvent.MOUSE_UP,stopDraw);
					
					}
				
				else if (ss.hitTestObject(broad_b_obj)){
					
					trace("botton")
					
					pen_target =4

					main_tab5.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
					ss.x = _pen.drawPoint.x;
					ss.y = _pen.drawPoint.y;
					if (action==0)
					{

						//------------------------------------
						if(line_draw){
							lineX=mouseX
							lineY=mouseY-(broad_b_obj.y)
							}
						//-------------------------------------


						main_tab5.mc.graphics.moveTo(ss.x,ss.y-(broad_b_obj.y));

					}
					else
					{
						main_tab5.mc.graphics.moveTo(mouseX,mouseY-(broad_b_obj.y));
					}


					broad_b_obj.mc.addEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.addEventListener(MouseEvent.MOUSE_UP,stopDraw);
					
					
					}
					
					
			else if (ss.hitTestObject(_xyMC1)){
						
					
					
					
					
					trace("_xyMC1 hit")
						
						pen_target = 5
					//-------------------
					main_tab6.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
					
					ss.x = _pen.drawPoint.x;
					ss.y = _pen.drawPoint.y;
					if (action==0)
					{
						//------------------------------------
						if(line_draw){
							lineX=mouseX
							lineY=mouseY
							}
						//-------------------------------------

						main_tab6.mc.graphics.moveTo(ss.x-(_xyMC1.x)-_xyMC1_adjust  ,ss.y-(_xyMC1.y)-_xyMC1_adjust2);

					}
					else
					{
						main_tab6.mc.graphics.moveTo(mouseX-(_xyMC1.x)-_xyMC1_adjust  ,mouseY-(_xyMC1.y)-_xyMC1_adjust2);
					}


					_xyMC1.addEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.addEventListener(MouseEvent.MOUSE_UP,stopDraw);

					
					
					
					
					
					}
					
					else if(ss.hitTestObject(_xyMC2)){
						
						
						
						trace("_xyMC1 hit")
						
						pen_target = 6
					//-------------------
					main_tab7.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
					
					ss.x = _pen.drawPoint.x;
					ss.y = _pen.drawPoint.y;
					if (action==0)
					{
						//------------------------------------
						if(line_draw){
							lineX=mouseX
							lineY=mouseY
							}
						//-------------------------------------

						main_tab7.mc.graphics.moveTo(ss.x-(_xyMC2.x)-_xyMC2_adjust  ,ss.y-(_xyMC2.y)-_xyMC2_adjust2);

					}
					else
					{
						main_tab7.mc.graphics.moveTo(mouseX-(_xyMC2.x)-_xyMC2_adjust  ,mouseY-(_xyMC2.y)-_xyMC2_adjust2);
					}


					_xyMC2.addEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.addEventListener(MouseEvent.MOUSE_UP,stopDraw);
						
						
						
						}else if(ss.hitTestObject(_xyMC3)){
							
							
							
							trace("_xyMC1 hit")
						
						pen_target = 7
					//-------------------
					main_tab8.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
					
					ss.x = _pen.drawPoint.x;
					ss.y = _pen.drawPoint.y;
					if (action==0)
					{
						//------------------------------------
						if(line_draw){
							lineX=mouseX
							lineY=mouseY
							}
						//-------------------------------------

						main_tab8.mc.graphics.moveTo(ss.x-(_xyMC3.x)-_xyMC3_adjust  ,ss.y-(_xyMC3.y)-_xyMC3_adjust2);

					}
					else
					{
						main_tab8.mc.graphics.moveTo(mouseX-(_xyMC3.x)-_xyMC3_adjust  ,mouseY-(_xyMC3.y)-_xyMC3_adjust2);
					}


					_xyMC3.addEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.addEventListener(MouseEvent.MOUSE_UP,stopDraw);
							
							
							
							}
								
				else  
				{
					trace("org");
					pen_target = 0;
					//-------------------
					main_tab.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
					
					ss.x = _pen.drawPoint.x;
					ss.y = _pen.drawPoint.y;
					if (action==0)
					{
						//------------------------------------
						if(line_draw){
							lineX=mouseX
							lineY=mouseY
							}
						//-------------------------------------

						main_tab.mc.graphics.moveTo(ss.x,ss.y);

					}
					else
					{
						main_tab.mc.graphics.moveTo(mouseX,mouseY);
					}


					mc_move.addEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.addEventListener(MouseEvent.MOUSE_UP,stopDraw);

					//------------------
				}



				}
					
					
					trace("control bar reset")
					
					_ruler.setToolUnselect()
	                _ruler2.setToolUnselect()
	                _ruler3.setToolUnselect()
	                _ruler4.setToolUnselect()
	             
	                  // _ruler5.setToolUnselect()
					   //getChildByName("draw1").setToolUnselect()
					   
					   trace("draw_obj_record.length:"+draw_obj_record.length)
					   
					   for (var ii:Number=1 ; ii<= draw_obj_record.length ; ii++ )
					        {
								 getChildByName("draw"+ii).setToolUnselect()
								
								}
					   
	               
						 
					
					
					

              

			}
			
			
			
			function stopDraw(e:MouseEvent):void
			{
				if (pen_target==1)
				{
					if (action!=1)
					{
						main_tab2.content.draw(main_tab2.mc,new Matrix(),new ColorTransform(),BlendMode.NORMAL,new Rectangle(0,0,1500,844));
					}
					main_tab2.mc.graphics.clear();
					broad_t_obj.mc.removeEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.removeEventListener(MouseEvent.MOUSE_UP,stopDraw);
					
					
				}  else if(pen_target==2){
					
					
					if (action!=1)
					{
						main_tab3.content.draw(main_tab3.mc,new Matrix(),new ColorTransform(),BlendMode.NORMAL,new Rectangle(0,0,1500,844));
					}
					main_tab3.mc.graphics.clear();
					broad_l_obj.mc.removeEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.removeEventListener(MouseEvent.MOUSE_UP,stopDraw);
					
					
					
					
					
					}else if(pen_target==3){
						
					if (action!=1)
					{
						main_tab4.content.draw(main_tab4.mc,new Matrix(),new ColorTransform(),BlendMode.NORMAL,new Rectangle(0,0,1500,844));
					}
					main_tab4.mc.graphics.clear();
					broad_r_obj.mc.removeEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.removeEventListener(MouseEvent.MOUSE_UP,stopDraw);
						

						}else if(pen_target==4){
							
						if (action!=1)
					{
						main_tab5.content.draw(main_tab5.mc,new Matrix(),new ColorTransform(),BlendMode.NORMAL,new Rectangle(0,0,1500,844));
						
					}
					main_tab5.mc.graphics.clear();
					broad_b_obj.mc.removeEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.removeEventListener(MouseEvent.MOUSE_UP,stopDraw);
							
							
						} 
						
			
			
			        else if(pen_target==5){
						
						
					if (action!=1)
					{
						//trace("content2:"+content)
						
						
						
						main_tab6.content.draw(main_tab6.mc,new Matrix(),new ColorTransform(),BlendMode.NORMAL,new Rectangle(0,0,300,300));
						
					}
					main_tab6.mc.graphics.clear();
					_xyMC1.removeEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.removeEventListener(MouseEvent.MOUSE_UP,stopDraw);

							
						} else if(pen_target==6){
							
							
							if (action!=1)
					{
						//trace("content2:"+content)
						
						
						
						main_tab7.content.draw(main_tab7.mc,new Matrix(),new ColorTransform(),BlendMode.NORMAL,new Rectangle(0,0,300,300));
						
					}
					main_tab7.mc.graphics.clear();
					_xyMC2.removeEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.removeEventListener(MouseEvent.MOUSE_UP,stopDraw);
							
							
							
							
							}else if(pen_target==7){
								
								
								if (action!=1)
					{
						//trace("content2:"+content)
						
						
						
						main_tab8.content.draw(main_tab8.mc,new Matrix(),new ColorTransform(),BlendMode.NORMAL,new Rectangle(0,0,300,300));
						
					}
					main_tab8.mc.graphics.clear();
					_xyMC3.removeEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.removeEventListener(MouseEvent.MOUSE_UP,stopDraw);
																

								}else{
					
					
					if (action!=1)
					{
						//trace("content2:"+content)
						
						
						
						main_tab.content.draw(main_tab.mc,new Matrix(),new ColorTransform(),BlendMode.NORMAL,new Rectangle(0,0,1500,844));
						
					}
					main_tab.mc.graphics.clear();
					mc_move.removeEventListener(MouseEvent.MOUSE_MOVE,drawing);
					stage.removeEventListener(MouseEvent.MOUSE_UP,stopDraw);

				}
				
			}
			function drawing(e:MouseEvent):void
			{

				if (pen_target==1)
				{

					ss.x = _pen.drawPoint.x;
					ss.y=_pen.drawPoint.y
					
					;
					if (action==0)
					{
						
						if(line_draw){
							
							main_tab2.mc.graphics.clear() 
							main_tab2.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
                            main_tab2.mc.graphics.moveTo(lineX,lineY);
                            main_tab2.mc.graphics.lineTo(mouseX,mouseY-(broad_t_obj.y));
							
							}else{
						
						
						main_tab2.mc.graphics.lineTo(ss.x,ss.y-(broad_t_obj.y));}


					}
					else
					{
						main_tab2.mc.graphics.lineTo(mouseX,mouseY-(broad_t_obj.y));
					}
					
					
					if (action==1)
					{
						main_tab2.content.draw(main_tab2.mc,new Matrix(),new ColorTransform(),BlendMode.ERASE);
					}
					e.updateAfterEvent();



				}else if(pen_target==2){
					
					
					ss.x = _pen.drawPoint.x;
					ss.y=_pen.drawPoint.y
					
					;
					if (action==0)
					{
						
					  if(line_draw){
							
							main_tab3.mc.graphics.clear() 
							main_tab3.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
                            main_tab3.mc.graphics.moveTo(lineX,lineY);
                            main_tab3.mc.graphics.lineTo(mouseX-(broad_l_obj.x) ,mouseY);
							
							}else{
						
						
						main_tab3.mc.graphics.lineTo(ss.x-(broad_l_obj.x),ss.y);}


					}
					else
					{
						main_tab3.mc.graphics.lineTo(mouseX-(broad_l_obj.x),mouseY);
					}
					
					
					if (action==1)
					{
						main_tab3.content.draw(main_tab3.mc,new Matrix(),new ColorTransform(),BlendMode.ERASE);
					}
					e.updateAfterEvent();
					
					
					
					
					
					
					}else if(pen_target==3){
						
						
					ss.x = _pen.drawPoint.x;
					ss.y=_pen.drawPoint.y
					
					;
					if (action==0)
					{
						
					  if(line_draw){
							
							main_tab4.mc.graphics.clear() 
							main_tab4.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
                            main_tab4.mc.graphics.moveTo(lineX,lineY);
                            main_tab4.mc.graphics.lineTo(mouseX-(broad_l_obj.x) ,mouseY);
							
							}else{
						
						main_tab4.mc.graphics.lineTo(ss.x-(broad_r_obj.x),ss.y);}


					}
					else
					{
						main_tab4.mc.graphics.lineTo(mouseX-(broad_r_obj.x),mouseY);
					}
					
					
					if (action==1)
					{
						main_tab4.content.draw(main_tab4.mc,new Matrix(),new ColorTransform(),BlendMode.ERASE);
					}
					e.updateAfterEvent();
					
						
						
						
						
						}else if(pen_target==4){
							
					ss.x = _pen.drawPoint.x;
					ss.y=_pen.drawPoint.y
					
					;
					if (action==0)
					{
					  if(line_draw){
							
							main_tab5.mc.graphics.clear() 
							main_tab5.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
                            main_tab5.mc.graphics.moveTo(lineX,lineY);
                            main_tab5.mc.graphics.lineTo(mouseX ,mouseY-(broad_b_obj.y));
							
							}else{
						main_tab5.mc.graphics.lineTo(ss.x,ss.y-(broad_b_obj.y));}


					}
					else
					{
						main_tab5.mc.graphics.lineTo(mouseX,mouseY-(broad_b_obj.y));
					}
					
					
					if (action==1)
					{
						main_tab5.content.draw(main_tab5.mc,new Matrix(),new ColorTransform(),BlendMode.ERASE);
					}
					e.updateAfterEvent();
							
							
							
							}
										
				
				else if(pen_target==5){
					
					//trace("drawing")
					
					ss.x = _pen.drawPoint.x;
					ss.y=_pen.drawPoint.y
					
					;
					if (action==0)
					{
					    if(line_draw){
							
							main_tab6.mc.graphics.clear() 
							main_tab6.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
                            main_tab6.mc.graphics.moveTo(lineX,lineY);
                            main_tab6.mc.graphics.lineTo(mouseX-(_xyMC1.x)-_xyMC1_adjust,mouseY-(_xyMC1.y)-_xyMC1_adjust2);
							
							}else{
						
						
						main_tab6.mc.graphics.lineTo(ss.x-(_xyMC1.x)-_xyMC1_adjust , ss.y-(_xyMC1.y)-_xyMC1_adjust2 );}


					}
					else
					{
						main_tab6.mc.graphics.lineTo(mouseX-(_xyMC1.x)-_xyMC1_adjust ,mouseY-(_xyMC1.y)-_xyMC1_adjust2 );
					}
					if (action==1)
					{
						//trace("mc:"+mc)
						main_tab6.content.draw(main_tab6.mc,new Matrix(),new ColorTransform(),BlendMode.ERASE);
						
					}
					e.updateAfterEvent();
			}
				else if(pen_target==6){
					
					
					//trace("drawing")
					
					ss.x = _pen.drawPoint.x;
					ss.y=_pen.drawPoint.y
					
					;
					if (action==0)
					{
					    if(line_draw){
							
							main_tab7.mc.graphics.clear() 
							main_tab7.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
                            main_tab7.mc.graphics.moveTo(lineX,lineY);
                            main_tab7.mc.graphics.lineTo(mouseX-(_xyMC2.x)-_xyMC2_adjust,mouseY-(_xyMC2.y)-_xyMC2_adjust2);
							
							}else{
						
						
						main_tab7.mc.graphics.lineTo(ss.x-(_xyMC2.x)-_xyMC2_adjust , ss.y-(_xyMC2.y)-_xyMC2_adjust2 );}


					}
					else
					{
						main_tab7.mc.graphics.lineTo(mouseX-(_xyMC2.x)-_xyMC2_adjust ,mouseY-(_xyMC2.y)-_xyMC2_adjust2 );
					}
					if (action==1)
					{
						//trace("mc:"+mc)
						main_tab7.content.draw(main_tab7.mc,new Matrix(),new ColorTransform(),BlendMode.ERASE);
						
					}
					e.updateAfterEvent();
					
					
					
					
					
					}else if(pen_target==7){
						
						
						//trace("drawing")
					
					ss.x = _pen.drawPoint.x;
					ss.y=_pen.drawPoint.y
					
					;
					if (action==0)
					{
					    if(line_draw){
							
							main_tab8.mc.graphics.clear() 
							main_tab8.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
                            main_tab8.mc.graphics.moveTo(lineX,lineY);
                            main_tab8.mc.graphics.lineTo(mouseX-(_xyMC3.x)-_xyMC3_adjust,mouseY-(_xyMC3.y)-_xyMC3_adjust2);
							
							}else{
						
						
						main_tab8.mc.graphics.lineTo(ss.x-(_xyMC3.x)-_xyMC3_adjust , ss.y-(_xyMC3.y)-_xyMC3_adjust2 );}


					}
					else
					{
						main_tab8.mc.graphics.lineTo(mouseX-(_xyMC3.x)-_xyMC3_adjust ,mouseY-(_xyMC3.y)-_xyMC3_adjust2 );
					}
					if (action==1)
					{
						//trace("mc:"+mc)
						main_tab8.content.draw(main_tab8.mc,new Matrix(),new ColorTransform(),BlendMode.ERASE);
						
					}
					e.updateAfterEvent();
						
						
						
						
						
						
						}else
				{
                   // trace("mc")
					ss.x = _pen.drawPoint.x;
					ss.y=_pen.drawPoint.y
					
					;
					if (action==0)
					{
					    if(line_draw){
							
							main_tab.mc.graphics.clear() 
							main_tab.mc.graphics.lineStyle(linesize2,mycolor[0],my_alpha);
                            main_tab.mc.graphics.moveTo(lineX,lineY);
                            main_tab.mc.graphics.lineTo(mouseX ,mouseY);
							
							}else{
						
						
						main_tab.mc.graphics.lineTo(ss.x,ss.y);}


					}
					else
					{
						main_tab.mc.graphics.lineTo(mouseX,mouseY);
					}
					if (action==1)
					{
						//trace("mc:"+mc)
						main_tab.content.draw(main_tab.mc,new Matrix(),new ColorTransform(),BlendMode.ERASE);
						
					}
					e.updateAfterEvent();
				}
			}


			//========================================================================================================

			//------loading

			//import com.ouorange.toolbox.*;
			//var toolBox:ToolBox = new ToolBox();
			//addChild(toolBox);

			var moveTween:Tween;


			//--------------------------------------------------------------------
			var request:URLRequest = new URLRequest("mc.swf");
			var loader:Loader = new Loader  ;
			loader.load(request);
			loader_mc.addChild(loader);

			//---------------;

			var sw:Number;
			var sh:Number;

			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onSwfLoaderComplete);

			function onSwfLoaderComplete(e:Event):void
			{

				sw = loader.width;
				sh = loader.height;

				loader_mc.width = sw;
				loader_mc.height = sh;

				trace("sw==:"+sw);

				//----------------

				//rec_whxy()
				//----------------
			}


			//-----------------------------------------------------------

			var eraser_var:Boolean = false;

			include "aslib/btn.as"
			include "aslib/draw_pic.as"
			//include "aslib/xy_mc.as"
			//include "aslib/pen.as"


			//---------------------------------------- 放大鏡矩形物件
			var square:Sprite = new Sprite();
			addChild(square);
			//var dsquare:Sprite = new Sprite();
			//addChild(dsquare);

			var scale2:Number = 1;
			sc_mc.visible = false;
			sc_mc_s.visible = false;
			//----------------------------------------拖曳物件
			hand.visible = false;
			var handX:Number = hand.x;
			var handY:Number = hand.y;
			//-----------------------------------------------

			//-----------------紀錄(1.製造圖形  2.放大鏡  3.縮小鏡  4.拖曳主畫面  )

			var record:Array = new Array(2);

			var cn:Number = 0;

			var cs:String;


			var record2:Array = new Array(2);//放大後定位

			//-------------------------------------------------------------------  onMove

			//----------------------------------------------------   stage.addEventListener



			var mmX:Number;
			var mmY:Number;

			stage.addEventListener(MouseEvent.MOUSE_DOWN ,onDown);

			function onDown(event:MouseEvent):void
			{

				
				//----------------------------------scale
				if (sc_ojb)
				{

					isDown = true;
					oldX = mouseX;
					oldY = mouseY;
				}
				if (sc_ojb_s)
				{

					onReset();
				}


				//--------------------------------------

			}

			stage.addEventListener(MouseEvent.MOUSE_MOVE ,onMove);

			function onMove(event:MouseEvent):void
			{
				//trace("move")
				//if(ss.hitTestObject(_xyMC1)){trace("_xyMC1")}
				
				if(mc_move.visible==true){
				ss.x=mouseX+5
				ss.y=mouseY+5}
				
				//-------------------------------scale
				if (sc_ojb)
				{
					sc_mc.x = mouseX;
					sc_mc.y = mouseY;
				}

				if (isDown &&  sc_ojb)
				{



					if (nowX < mouseX && nowY < mouseY)
					{
						square.graphics.clear();
					}
					if (nowX > mouseX || nowY > mouseY)
					{
						square.graphics.clear();
					}


					square.graphics.beginFill(0x000000,0.2);
					square.graphics.drawRect(oldX, oldY, mouseX-oldX, mouseY-oldY);



					nowX = mouseX;
					nowY = mouseY;



				}

				if (sc_ojb_s)
				{
					sc_mc_s.x = mouseX;
					sc_mc_s.y = mouseY;
				}

				if (hand_var)
				{
					hand.x = mouseX- 10; ;
					hand.y = mouseY- 10; ;


				}

				//------------
			}

			stage.addEventListener(MouseEvent.MOUSE_UP ,onUp);

			function onUp(event:MouseEvent):void
			{
				

				//--------------------------------------------------------------scale

				if (sc_ojb)
				{
					rec_whxy();
					onRollin();
				}


				//------------------------------------------------------------
			}

			btn13.addEventListener(MouseEvent.MOUSE_DOWN ,btn13_Down);

			function btn13_Down(event:MouseEvent):void
			{
				tool_reset()
				record_ac_b();
			}

			btn12.addEventListener(MouseEvent.MOUSE_DOWN ,btn12_Down);

			function btn12_Down(event:MouseEvent):void
			{
				tool_reset()
				record_ac_n();
			}

			//-------------------------------------------------------------------------------------- drag stage

			loader_mc.addEventListener(MouseEvent.MOUSE_DOWN ,loader_down_fn);

			function loader_down_fn(event:MouseEvent):void
			{


				if (hand_var)
				{

					rec_whxy2();
					loader_mc.startDrag();
				}
			}


			loader_mc.addEventListener(MouseEvent.MOUSE_UP ,loader_up_fn);

			function loader_up_fn(event:MouseEvent):void
			{

				if (hand_var)
				{
					loader_mc.stopDrag();

					
					record2[cn-1] = new Array(2)
					record2[cn-1][0]= loader_mc.x
					record2[cn-1][1]= loader_mc.y
					
				}
			}

			//-------------------------------------------------------------------------------------------

			//---------------------------------------------------------------由 scale 移出

			btn9.addEventListener(MouseEvent.CLICK ,sc_fn);

			function sc_fn(event:MouseEvent):void
			{
				tool_reset()
				
				trace("sc_ojb:"+sc_ojb);
				if (sc_ojb==false )
				{
					sc_mc.visible = true;
					//nowmode = 2;
					//modechange();

					sc_ojb = true;
					//this.addEventListener(Event.ENTER_FRAME, EnterFrame);
				}
			}





			btn7.addEventListener(MouseEvent.CLICK ,sc_fn_s);

			function sc_fn_s(event:MouseEvent):void
			{
				tool_reset()
				
				if (sc_ojb_s==false )
				{
					sc_mc_s.visible = true;
					//nowmode=4
					//modechange()
					sc_ojb_s = true;
				}
				else
				{

					sc_ojb_s = false;
					sc_mc_s.visible = false;
				}
			}

			//-----------------------------------------------------------------由 drag.as 移出

			btn8.addEventListener(MouseEvent.CLICK ,hand_fn);

			function hand_fn(event:MouseEvent):void
			{
				tool_reset()
				
				if (hand.visible == true)
				{


					hand.x = handX;
					hand.y = handY;
					hand_var = false;
					hand.visible = false;

				}
				else
				{

					if (hand_var==false)
					{

						hand.visible = true;
						hand_var = true;

					}
				}
			}





			//-----------------------------------------------------------------


			include "aslib/broad.as"
			include "aslib/scale.as"
			include "aslib/record.as"





			//---------------------------------------------------------------  由 btn.as 移出

			btn10.addEventListener(MouseEvent.MOUSE_DOWN ,btn10_Down);

			function btn10_Down(event:MouseEvent):void
			{

                tool_reset()

				if (broad_m.visible == false)
				{

					open_obj = true;
					btn10.gotoAndStop(1);
					broad_m.visible = true;

					broad_m.gotoAndPlay(2);

					//moveTween = new Tween(btn11,"x",Regular.easeIn,btn11.x,b11x + 20,0.2,true);

				}

			}






		}





		//=============================    量尺畫線   ==========================================================================================




		private var _ruler:CommonMeasureTool;
		private var _ruler2:CommonMeasureTool;
		private var _ruler3:CommonMeasureTool;
		private var _ruler4:CommonMeasureTool;

		private var _pen:Pen;

		private var _penControl:PenControl;

		private var _isDrawable:Boolean;

		
		
		protected function onKeyDown(e:KeyboardEvent):void
		{
			
                    trace("key")

		}






		//=======================================================================================================================
		
		
		
		//--------------------------------------------
	}

}