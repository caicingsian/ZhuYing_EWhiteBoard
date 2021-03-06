/*
 *	Temple Library for ActionScript 3.0
 *	Copyright © MediaMonks B.V.
 *	All rights reserved.
 *	
 *	Redistribution and use in source and binary forms, with or without
 *	modification, are permitted provided that the following conditions are met:
 *	1. Redistributions of source code must retain the above copyright
 *	   notice, this list of conditions and the following disclaimer.
 *	2. Redistributions in binary form must reproduce the above copyright
 *	   notice, this list of conditions and the following disclaimer in the
 *	   documentation and/or other materials provided with the distribution.
 *	3. All advertising materials mentioning features or use of this software
 *	   must display the following acknowledgement:
 *	   This product includes software developed by MediaMonks B.V.
 *	4. Neither the name of MediaMonks B.V. nor the
 *	   names of its contributors may be used to endorse or promote products
 *	   derived from this software without specific prior written permission.
 *	
 *	THIS SOFTWARE IS PROVIDED BY MEDIAMONKS B.V. ''AS IS'' AND ANY
 *	EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 *	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *	DISCLAIMED. IN NO EVENT SHALL MEDIAMONKS B.V. BE LIABLE FOR ANY
 *	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 *	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 *	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 *	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *	
 *	
 *	Note: This license does not apply to 3rd party classes inside the Temple
 *	repository with their own license!
 */

package temple.utils.types 
{
	import temple.core.debug.objectToString;
	import temple.core.errors.TempleArgumentError;
	import temple.core.errors.TempleError;
	import temple.core.errors.throwError;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;

	/**
	 * This class contains some functions for the Stage.
	 * 
	 * @author Thijs Broerse
	 */
	public final class StageUtils 
	{
		/**
		 * Returns the most left x value of the stage, whatever the stageAlign is.
		 */
		public static function getStageLeft(stage:Stage):Number
		{
			if (stage == null) throwError(new TempleArgumentError(StageUtils.toString(), "Stage can't be null"));
			
			var originalWidth:Number;
			
			if (stage.numChildren)
			{
				originalWidth = DisplayObject(stage.getChildAt(0)).loaderInfo.width;
			}
			else
			{
				var s:Sprite = new Sprite();
				stage.addChild(s);
				originalWidth = s.loaderInfo.width;
				stage.removeChild(s);
			}
			switch (stage.align)
			{
				case '':
				case StageAlign.TOP:
				case StageAlign.BOTTOM:
					return (stage.stageWidth - originalWidth) * -.5;
					break;
				
				case StageAlign.TOP_LEFT:
				case StageAlign.LEFT:
				case StageAlign.BOTTOM_LEFT:
					return 0;
					break;
				
				case StageAlign.TOP_RIGHT:
				case StageAlign.RIGHT:
				case StageAlign.BOTTOM_RIGHT:
					return originalWidth - stage.stageWidth;
					break;
				
				default:
					throwError(new TempleError(StageUtils, "unknow stageAlign '" + stage.align + "'"));
					break;
			}
			return NaN;
		}
		
		/**
		 * Returns the most right x value of the stage, whatever the stageAlign is.
		 */
		public static function getStageRight(stage:Stage):Number
		{
			if (stage == null) throwError(new TempleArgumentError(StageUtils.toString(), "Stage can't be null"));
			
			var originalWidth:Number;
			
			if (stage.numChildren)
			{
				originalWidth = DisplayObject(stage.getChildAt(0)).loaderInfo.width;
			}
			else
			{
				var s:Sprite = new Sprite();
				stage.addChild(s);
				originalWidth = s.loaderInfo.width;
				stage.removeChild(s);
			}
			switch (stage.align)
			{
				case '':
				case StageAlign.TOP:
				case StageAlign.BOTTOM:
					return stage.stageWidth - (stage.stageWidth - originalWidth) * .5;
					break;
				
				case StageAlign.TOP_LEFT:
				case StageAlign.LEFT:
				case StageAlign.BOTTOM_LEFT:
					return stage.stageWidth;
					break;
				
				
				case StageAlign.TOP_RIGHT:
				case StageAlign.RIGHT:
				case StageAlign.BOTTOM_RIGHT:
					return originalWidth;
					break;
				
				default:
					throwError(new TempleError(StageUtils, "unknow stageAlign '" + stage.align + "'"));
					break;
			}
			return NaN;
		}

		/**
		 * Returns the most top y value of the stage, whatever the stageAlign is.
		 */
		public static function getStageTop(stage:Stage):Number
		{
			if (stage == null) throwError(new TempleArgumentError(StageUtils.toString(), "Stage can't be null"));
			
			var originalHeight:Number;
			
			if (stage.numChildren)
			{
				originalHeight = DisplayObject(stage.getChildAt(0)).loaderInfo.height;
			}
			else
			{
				var s:Sprite = new Sprite();
				stage.addChild(s);
				originalHeight = s.loaderInfo.width;
				stage.removeChild(s);
			}
			switch (stage.align)
			{
				case '':
				case StageAlign.LEFT:
				case StageAlign.RIGHT:
					return (stage.stageHeight - originalHeight) * -.5;
					break;

				case StageAlign.TOP_LEFT:
				case StageAlign.TOP:
				case StageAlign.TOP_RIGHT:
					return 0;
					break;
				
				case StageAlign.BOTTOM_LEFT:
				case StageAlign.BOTTOM:
				case StageAlign.BOTTOM_RIGHT:
					return originalHeight - stage.stageHeight;
					break;
				
				default:
					throwError(new TempleError(StageUtils, "unknow stageAlign '" + stage.align + "'"));
					break;
			}
			return NaN;
		}
		
		/**
		 * Returns the most bottom y value of the stage, whatever the stageAlign is.
		 */
		public static function getStageBottom(stage:Stage):Number
		{
			if (stage == null) throwError(new TempleArgumentError(StageUtils.toString(), "Stage can't be null"));
			
			var originalHeight:Number;
			
			if (stage.numChildren)
			{
				originalHeight = DisplayObject(stage.getChildAt(0)).loaderInfo.height;
			}
			else
			{
				var s:Sprite = new Sprite();
				stage.addChild(s);
				originalHeight = s.loaderInfo.width;
				stage.removeChild(s);
			}
			switch (stage.align)
			{
				case '':
				case StageAlign.LEFT:
				case StageAlign.RIGHT:
					return stage.stageHeight - (stage.stageHeight - originalHeight) * .5;
					break;

				case StageAlign.TOP_LEFT:
				case StageAlign.TOP:
				case StageAlign.TOP_RIGHT:
					return stage.stageHeight;
					break;
				
				case StageAlign.BOTTOM_LEFT:
				case StageAlign.BOTTOM:
				case StageAlign.BOTTOM_RIGHT:
					return originalHeight;
					break;
				
				default:
					throwError(new TempleError(StageUtils, "unknow stageAlign '" + stage.align + "'"));
					break;
			}
			return NaN;
		}
		
		/**
		 * @private
		 */
		public static function toString():String
		{
			return objectToString(StageUtils);
		}
	}
}
