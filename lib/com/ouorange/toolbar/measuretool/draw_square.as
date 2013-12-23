package com.ouorange.toolbar.measuretool
{
	import com.senocular.display.TransformTool;
	import com.util.Trigonometric;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;

	import flash.display.MovieClip;
	import flash.geom.ColorTransform;

	public class draw_square extends CommonMeasureTool
	{





		public function draw_square()
		{
			super();
		}

		private var _assets:DisplayObject;




		//private var _pointStart:Sprite;

		//private var _pointEnd:Sprite;

		private var _t_mc:MovieClip;
		override public function init():void
		{

			var mm3:Number = main.instance.ffff3;

			if (mm3==1)
			{
				_asset = new square_mc();
			}

			if (mm3==2)
			{
				_asset = new square_mc_l();
			}

			if (mm3==3)
			{
				_asset = new circle_mc();
			}

			if (mm3==4)
			{
				_asset = new circle_mc_l();
			}

			if (mm3==5)
			{
				_asset = new triangle_mc();
			}

			if (mm3==6)
			{
				_asset = new triangle_mc_l();
			}

			if (mm3==7)
			{
				_asset = new star_mc();
			}

			if (mm3==8)
			{
				_asset = new star_mc_l();
			}

			if (mm3==9)
			{
				_asset = new polygon_mc();
			}

			if (mm3==10)
			{
				_asset = new polygon_mc_l();
			}

			if (mm3==11)
			{
				_asset = new rploy_mc();
			}

			if (mm3==12)
			{
				_asset = new rploy_mc_l();
			}
			if (mm3==13)
			{
				_asset = new love_mc();
			}

			if (mm3==14)
			{
				_asset = new love_mc_l();
			}



			//_pointStart = _asset['p1'];
			//_pointEnd = _asset['p2'];
			//------------------

			_t_mc=_asset['t_mc']
			;


			addChild( _asset );

			//_t_mc.visible=false

			var mm:String = main.instance.ffff;
			//var mm2:String = main.instance.ffff2;
			//trace("mm2:"+mm2);

			//----------------------------------------------



			var colorInfo:ColorTransform = _t_mc.transform.colorTransform;
			colorInfo.color = mm;
			_t_mc.transform.colorTransform = colorInfo;


			//-----------------------------------------------
			super.init();
		}

		override protected function setupTransformToolSkin():void
		{
			transformTool.setSkin( TransformTool.REGISTRATION , _asset['center_mc'] );
			super.setupTransformToolSkin();
		}

		/*
		override public function adjustDrawPostion(p:Point):Point
		{
		if( _asset.hitTestPoint( p.x , p.y , true ) )
		{
		var tmpPoint:Point = new Point();
		var p1:Point = _pointStart.localToGlobal( tmpPoint )
		var p2:Point = _pointEnd.localToGlobal( tmpPoint );
		p = Trigonometric.closePointFromPointToLine( p1 , p2 , p );
		}
		super.adjustDrawPostion(p);
		return p;
		}*/
	}
}