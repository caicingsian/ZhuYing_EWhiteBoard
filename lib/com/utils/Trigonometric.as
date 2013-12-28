package com.utils
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Randy
	 */
	public class Trigonometric 
	{
		/**
		 * 角度轉弧度
		 * @param	degree
		 * @return
		 */
		public static function degree2radian( degree:Number ):Number
		{
			return degree * Math.PI / 180;
		}
		
		/**
		 * 弧度轉角度
		 * @param	radian
		 * @return
		 */
		public static function radian2degree( radian:Number ):Number
		{
			return radian * 180 / Math.PI;
		}
		
		/**
		 * 已知角度與邊長求另一點座標
		 * @param	degree
		 * @param	edge
		 * @return
		 */
		public static function degreeEdge2Point( degree:Number , edge:Number ):Point
		{
			return radianEdge2Point( degree2radian( degree ) , edge );
		} 
		
		/**
		 * 已知弧度與邊長求另一點座標
		 * @param	radian
		 * @param	edge
		 * @return
		 */
		public static function radianEdge2Point( radian:Number , edge:Number ):Point
		{
			return new Point( edge * Math.cos( radian ) , edge * Math.sin( radian ) );
		}
		
		/**
		 * 兩點求斜率
		 * @param p1
		 * @param p2
		 * @return 
		 * 
		 */		
		public static function getAngle (p1:Point , p2:Point):Number
		{
			var dx:Number = p2.x - p1.x;
			var dy:Number = p2.y - p1.y;
			return Math.atan2(dy,dx);
		}
		
		/**
		 * 已知直線、求第三點與直線交插點
		 * @param p1
		 * @param p2
		 * @param p3
		 * @return 
		 * 
		 */		
		public static function closePointFromPointToLine( p1:Point, p2:Point, p3:Point ):Point
		{
			var xDelta:Number = p2.x - p1.x;
			var yDelta:Number = p2.y - p1.y;
			if ( ( xDelta == 0 ) && ( yDelta == 0 ) )
			{
				// p1 and p2 cannot be the same point
				p2.x +=  1;
				p2.y +=  1;
				xDelta = 1;
				yDelta = 1;
			}
			var u: Number = ( ( p3. x - p1. x ) * xDelta + ( p3. y - p1. y ) * yDelta ) / ( xDelta * xDelta + yDelta * yDelta );
			var closestPoint:Point;
			if (u < 0)
			{
				closestPoint = p1;
			}
			else if ( u > 1 )
			{
				closestPoint = p2;
			}
			else
			{
				closestPoint = new Point(p1.x + u * xDelta,p1.y + u * yDelta);
			}
			return closestPoint;
			//return Point.distance ( closestPoint, p3 );
		}
		
		/**
		 * 已知直線、求第三點與直線最段距離
		 * @param p1
		 * @param p2
		 * @param p3
		 * @return 
		 * 
		 */		
		public static function pointToLineDistance( p1:Point, p2:Point, p3:Point ):Number
		{
			var xDelta:Number = p2.x - p1.x;
			var yDelta:Number = p2.y - p1.y;
			if ( ( xDelta == 0 ) && ( yDelta == 0 ) )
			{
				// p1 and p2 cannot be the same point
				p2.x +=  1;
				p2.y +=  1;
				xDelta = 1;
				yDelta = 1;
			}
			var u: Number = ( ( p3. x - p1. x ) * xDelta + ( p3. y - p1. y ) * yDelta ) / ( xDelta * xDelta + yDelta * yDelta );
			var closestPoint:Point;
			if (u < 0)
			{
				closestPoint = p1;
			}
			else if ( u > 1 )
			{
				closestPoint = p2;
			}
			else
			{
				closestPoint = new Point(p1.x + u * xDelta,p1.y + u * yDelta);
			}
			return Point.distance ( closestPoint, p3 );
		}
	}

}