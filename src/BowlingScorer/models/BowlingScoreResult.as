package BowlingScorer.models
{
	/* Class: BowlingScoreResult
	* Description: Stores the total score of bowling game. 
	*/
	[Bindable]
	public class BowlingScoreResult
	{
		private static var _BowlingScoreResult:BowlingScoreResult;
		
		public static function getInstance():BowlingScoreResult
		{
			if(_BowlingScoreResult == null)
			{
				_BowlingScoreResult = new BowlingScoreResult();
			}
			
			return _BowlingScoreResult;
		}
		
		public function BowlingScoreResult()
		{
			_BowlingScoreResult = this;
		}
		
		/* Function: clearScore
		*  Purpose: Clears the total score.
		*  Parameters: none
		*/
		public function clearScore() : void 
		{
			result = 0;
		}
		
		/* Function: addFrameScore
		*  Purpose: Adds the score of a frame to the total score.
		*  Parameters: frameScore The score of the frame to add. 
		*/
		public function addFrameScore(frameScore: Number) : void 
		{
			result = result + frameScore;
		}

		/* Function: getBowlingScoreResult
		*  Purpose: Returns the bowing game score.
		*  Parameters: none
		*/
		public function getBowlingScoreResult() : Number 
		{
			return result;
		}
		
		private var result:Number = 0;
	}
}