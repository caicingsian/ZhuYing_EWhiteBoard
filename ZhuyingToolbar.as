﻿package 
{
	import com.ouorange.toolbar.BrushInspector;
	import com.ouorange.toolbar.BrushPot;
	import com.ouorange.toolbar.CanvasManager;
	import com.ouorange.toolbar.ChartManager;
	import com.ouorange.toolbar.DrawShapeManager;
	import com.ouorange.toolbar.GlobalConst;
	import com.ouorange.toolbar.measuretool.MeasureToolManager;
	import com.ouorange.toolbar.Pen;
	import com.ouorange.toolbar.PenControl;
	import com.ouorange.toolbar.ToolBarButtonControl;
	import com.ouorange.toolbar.toolbutton.ToolButton;
	import com.ouorange.toolbar.WhiteBoard;
	import com.ouorange.toolbar.WhiteBoardDirection;
	import com.ouorange.toolbar.WhiteBoardManaer;
	import fl.transitions.easing.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ZhuyingToolbar extends MovieClip
	{
		//筆刷控制
		private var penControl:PenControl;
		
		//白板Layer
		private var whitebaordManager:WhiteBoardManaer;
		
		//測量工具管理類別
		private var measureManager:MeasureToolManager;		
		
		//畫布管理類別
		private var canvasManager:CanvasManager;
		
		//畫筆屬性控制
		private var brushInspector:BrushInspector;
		
		//圖表管理
		private var chartManager:ChartManager;
		
		//工具列按鈕控制
		private var toolBarControl:ToolBarButtonControl;
		
		//工具列中間互動感應區塊
		private var interactiveSensor:Sprite;
		
		public function ZhuyingToolbar()
		{
			//git commit change
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
		}
		
		private function OnAddToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
			GlobalConst.APP_STAGE = this.stage;
			Init();
		}
		
		private function Init():void
		{
			//設定電子白板互動區塊、用來判斷是否點到工具以外的區域
			//但是因為有周圍白板的關係、會被擋到、就失效了.
			interactiveSensor = new Sprite();
			interactiveSensor.graphics.beginFill( 0x000000 , 0 );
			interactiveSensor.graphics.drawRect( 0 , 0 , 1500 , 750 );
			interactiveSensor.graphics.endFill();
			
			GlobalConst.APP_INTERACTIVE_SENSOR = interactiveSensor;
			
			//測量&圖形工具管理
			measureManager = new MeasureToolManager();
			
			//畫筆控制
			penControl = new PenControl(stage);
			penControl.measureTools = measureManager.MeasureTools;
			
			//畫布管理
			canvasManager = new CanvasManager(stage);
			canvasManager.penCtrl = penControl;
			
			//圖表管理
			chartManager = new ChartManager();
			
			//新增白板
			whitebaordManager = new WhiteBoardManaer(this);
			canvasManager.AppendCanvas( whitebaordManager.GetWhiteBoard(WhiteBoardDirection.CENTER).canvas );
			canvasManager.AppendCanvas( whitebaordManager.GetWhiteBoard(WhiteBoardDirection.TOP).canvas );
			canvasManager.AppendCanvas( whitebaordManager.GetWhiteBoard(WhiteBoardDirection.BOTTOM).canvas );
			canvasManager.AppendCanvas( whitebaordManager.GetWhiteBoard(WhiteBoardDirection.LEFT).canvas );
			canvasManager.AppendCanvas( whitebaordManager.GetWhiteBoard(WhiteBoardDirection.RIGHT).canvas );
			
			brushInspector = new BrushInspector(this["__BrushInspector"]);
		
			toolBarControl = new ToolBarButtonControl( this );
			toolBarControl.addEventListener( ToolButton.TOOL_ACTIVED , OnToolEventHandler , false , 0 , true);
			toolBarControl.addEventListener( ToolButton.TOOL_DISACTIVE , OnToolEventHandler , false , 0 , true);
			
			//測量工作平常是在白板下面、但是如果拖到白板上面、就會移到白板裏面
			addChild( interactiveSensor );
			addChild( measureManager );
			addChild( chartManager );//圖表應該也是點了哪裏就加在哪裏
			addChild( canvasManager );
			
			addChild( whitebaordManager );
			
			addChild( brushInspector );
			addChild( penControl );
			addChild( toolBarControl );
		}

		private function OnTrashCanClick(e:MouseEvent):void
		{
			trace("按下垃圾桶");
			//彈跳確認視窗.
			measureManager.ClearALL();
			canvasManager.ClearALL();
		}
		
		//開啟筆刷工具( 鉛筆、淫光筆、擦子 )
		private function OpenBrushTool( penName:String ):void
		{	
			trace("開啟畫筆工具:" + penName );
			var pen:Pen = penControl.GetPen( penName );
			if ( pen )
			{
				penControl.setCurrentPen(pen);
				//更新畫面屬性面板
				brushInspector.UpdateBrush( pen );
				//彈跳畫筆面板
				brushInspector.ShowInspector();
				//開啟畫筆控制
				penControl.enable = true;
				//開啟畫板
				canvasManager.enable = true;
				//停用測量工具
				measureManager.SetEnable( false );
			}
		}
		
		//關閉筆刷工具
		private function CloseBrushTool():void
		{
			trace("關閉畫筆工具");
			penControl.enable = false;
			canvasManager.enable = false;
			measureManager.SetEnable( true );
		}
		
		//=========================================
		// 	【工具列事件】
		//  想辨法處理過多的判斷
		//=========================================
		private function OnToolEventHandler(e:Event):void 
		{
			var toolName:String = e.target.name;
			trace( toolName , ":" , e.type );
			if ( e.type == ToolButton.TOOL_ACTIVED )
			{	//工具啟動
				if ( OpenBrushByToolName(toolName) == false )
				{
					CloseBrushTool();
				}
				if ( toolName == ToolBarButtonControl.TOOL_TRASHCAN )
				{
					OnTrashCanClick(null);
				}
			}
			else if ( e.type == ToolButton.TOOL_DISACTIVE )
			{	//工具關閉
				CloseBrushByToolName(toolName);
			}
		}
		
		private function CloseBrushByToolName(toolName:String):void 
		{
			if ( toolName == ToolBarButtonControl.TOOL_PENCIL ||
				 toolName == ToolBarButtonControl.TOOL_HIGHLIGHT ||
				toolName == ToolBarButtonControl.TOOL_ERASE )
			{
				CloseBrushTool();
			}
		}
		
		//筆刷開啟
		private function OpenBrushByToolName(toolName:String):Boolean 
		{
			var isOpen:Boolean;
			if ( toolName == ToolBarButtonControl.TOOL_PENCIL )
			{
				OpenBrushTool( BrushPot.PENCIL );
				isOpen = true;
			}
			else if ( toolName == ToolBarButtonControl.TOOL_HIGHLIGHT )
			{
				OpenBrushTool( BrushPot.HIGHLIGHTER );
				isOpen = true;
			}
			else if( toolName == ToolBarButtonControl.TOOL_ERASE )
			{
				OpenBrushTool( BrushPot.ERASER );
				isOpen = true;
			}
			return isOpen;
		}
		//=========================================
		// 	
		//  
		//=========================================
	}
}