package iron.math;
using kha.FastFloat;

class MathStaticExtension {
		
    /*
		Degrees to Radians Constant
	*/
	public static var DEG2RAD = 0.0174532924;

	/*
		Radians to Degrees Constant
	*/
	public static var RAD2DEG = 57.29578;


    /*
		convert radians to degrees
	*/
	public static inline function toDegrees(radians:FastFloat):FastFloat {
		return radians * RAD2DEG;
	}

	/*
		convert degrees to radians
	*/
	public static inline function toRadians(degrees:FastFloat):FastFloat {
		return degrees * DEG2RAD;
	}

	/*
		Convenience function to map a variable from one coordinate space
		to another. Equivalent to unlerp() followed by lerp().
	*/
	public static function map(value:FastFloat, leftMin:FastFloat, leftMax:FastFloat, rightMin:FastFloat, rightMax:FastFloat):FastFloat 
	{
		return rightMin + (value - leftMin) / (leftMax - leftMin) * (rightMax- rightMin);
	}

	public static function mapInt(value:Int, leftMin:Int, leftMax:Int, rightMin:Int, rightMax:Int ):Int 
	{
		var result =  Std.int(map(value, leftMin, leftMax, rightMin, rightMax));
		return result;
	}

	static public function mapClamped(value:FastFloat, leftMin:FastFloat, leftMax:FastFloat, rightMin:FastFloat, rightMax:FastFloat):FastFloat
	{
		if (value >= leftMax ) return rightMax;
		if (value <= leftMin) return  rightMin;
		return map(value, leftMin, leftMax, rightMin, rightMax);
	}

	/*
		mod returns the remaainder when dividing a/b
		remainder = numerator - denominator * quotient as int (to round towards 0)
	*/
	public static inline function mod(a:FastFloat, b:FastFloat):FastFloat
	{
		return a - (b * Std.int(a / b));
	}
}
