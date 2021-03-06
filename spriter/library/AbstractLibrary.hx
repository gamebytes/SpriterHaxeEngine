package spriter.library;
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.PixelSnapping;
import flash.display.Sprite;
import openfl.Assets;
import openfl.display.Tilesheet;
import spriter.definitions.PivotInfo;
import spriter.definitions.SpatialInfo;
import spriter.definitions.TimelineKey.CurveType;
import spriter.util.SpriterUtil;

/**
 * ...
 * @author Loudo
 */
class AbstractLibrary
{
	private var _basePath:String;

	
	
	/**
	 * 
	 * @param	_basePath 
	 */
	public function new(basePath :String) 
	{
		_basePath = basePath;
	}
	
	public function setRoot(root:Dynamic):Void 
	{
		throw ('must be overrided');
	}
	
	/**
	 * 
	 * @param	name of the image
	 * @return  dynamic
	 */
	public function getFile(name:String):Dynamic
	{
		throw ('must be overrided');
		return null;
	}
	
	public function clear():Void
	{
		throw ('must be overrided');
	}
	
	public function addGraphic(group:String, timeline:Int, key:Int, name:String, info:SpatialInfo, pivots:PivotInfo):Void
	{
		throw ('must be overrided');
	}
	
	public function compute(info:SpatialInfo, pivots:PivotInfo, width:Float, height:Float):SpatialInfo
	{
		var degreesUnder360 = SpriterUtil.under360(info.angle);
		var rad = SpriterUtil.toRadians(degreesUnder360);
		var s = Math.sin(rad);
		var c = Math.cos(rad);
		
		var pivotX =  info.x;
		var pivotY =  info.y;
		
		var preX = info.x - pivots.pivotX * width * info.scaleX;
		var preY = info.y + (1 - pivots.pivotY) * height * info.scaleY;	
		
		var x2 = (preX - pivotX) * c - (preY - pivotY) * s + pivotX;
        var y2 = (preX - pivotX) * s + (preY - pivotY) * c + pivotY;
		return new SpatialInfo(x2, -y2, degreesUnder360, info.scaleX, info.scaleY, info.a, info.spin);
	}
	
	
	public function render():Void
	{
		
	}
	
	public function destroy():Void
	{
		
	}
	
}