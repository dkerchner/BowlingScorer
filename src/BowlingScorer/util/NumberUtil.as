package BowlingScorer.util
{
	/* Class: NumberUtil
	* Description: Contains utility functions to support number based business logic. 
	*/
	public final class NumberUtil
	{		
		/* Function: isDigit
		*  Purpose: Determines whether the string parameter is a valid digit. 
		*  Parameters: value String value to check
		*/
		public static function isDigit(value : String) : Boolean {
			// Convert the string to a number
			var digit : Number = new Number(value);
			
			// return if it's Not a Number (NaN)
			return !isNaN(digit);
		}
	}
}