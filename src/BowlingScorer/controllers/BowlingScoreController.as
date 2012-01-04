package BowlingScorer.controllers
{
	/* Class: BowlingScoreController
	* Description: Contains all of the logic to calculate a bowling score from a preformatted 
	* string using the public function calculateBowlingScore.
	*/
	import BowlingScorer.models.BowlingScoreResult;
	import BowlingScorer.util.NumberUtil;
	
	public class BowlingScoreController
	{
		// Calculated total score
		[Bindable]
		private var totalScore : BowlingScoreResult;
		
		// Current ball being evaluated
		[Bindable]
		private var currentBall : String;
		
		// Previous ball
		[Bindable]
		private var previousBall : String;
		
		// Score of the previous ball
		[Bindable]
		private var previousBallScore : Number = 0;
		
		// Score of the bonus ball for a spare (1 ahead)
		[Bindable] 
		private var spareBallBonus : Number = 0;
		
		// Score of the bonus ball for a strike (2 ahead)
		[Bindable]
		private var strikeBallBonus : Number = 0;

		public function BowlingScoreController(){}
		
		/* Function: handleFramesInput
		*  Purpose: Calculates the total score of a bowling game given a formatted input of frame scores. Triggered by pressing the "Calculate" button.
		*  Parameters: None
		*/
		public function calculateBowlingScore(scores: String) : BowlingScoreResult {
			totalScore = BowlingScoreResult.getInstance();
			
			// Replace all "-"
			scores = scores.replace(/-/g, "");
			
			// Initialize the scores
			totalScore.clearScore();
			previousBallScore = 0;
			spareBallBonus = 0;
			strikeBallBonus = 0;
			
			var i : int;
			for (i = 0; i < scores.length; i++)
			{
				// Current ball from scores string
				currentBall = scores.charAt(i);
				trace(currentBall);
				
				//A spare or strike
				if (currentBall == "X" || currentBall == "/"){
					//get the scroe of the next ball
					if (i < scores.length-1){					
						spareBallBonus = getScoreForBall(scores.charAt(i + 1),0);					
					}else {
						spareBallBonus = 0;
					}
					
					//get the score of the ball that's two ahead
					if (i < scores.length - 2){
						strikeBallBonus = getScoreForBall(scores.charAt(i + 2),spareBallBonus);
					}else{
						strikeBallBonus = 0;
					}				
					
					if (currentBall == "X"){//strike	
						if (i < scores.length - 2){//add 10 plus 2 bonus balls, as long as it's not the 11th frame
							totalScore.addFrameScore(10 + spareBallBonus + strikeBallBonus);
						}					
					}else if (currentBall == "/"){//spare
						if (i < scores.length-1){//add 10 for the frame and add 1 bonus ball, as long as it's not the 11th frame
							previousBallScore = getScoreForBall(previousBall,0);
							totalScore.addFrameScore((10 - previousBallScore) + spareBallBonus);
						}
						
					}else{
						//need error handling for invalid ball, shouldn't get here if the input is good
						trace("invalid ball");
					}		
				} else {// Open frame (not a strike or spare)
					// Special case handlers for the 11th frame
					if((scores.charAt(scores.length - 3) == "X") && (i > scores.length - 3)){					
						// If it's the 11th frame, and there was a strike in 10th frame, there's nothing to calculate
					}
					else if((scores.charAt(scores.length - 2) == "/") && (i > scores.length - 2)){					
						// If it's the 11th frame, and there was a spare in 10th frame, there's nothing to calculate
					}
					else{// Not a special case, go ahead and add the score					
						totalScore.addFrameScore(Number(currentBall));				
					}				
				}
				previousBall = currentBall;		
				trace(totalScore.getBowlingScoreResult());
			}
			
			return totalScore;
		}
		
		/* Function: getScoreForBall
		*  Purpose: Returns the score of the ball passed to it depending on whether it's a strike, spare or digit. 
		*  Parameters: ball Ball to get the score for
		*			   previousBallScore Score of the ball before this one
		*/
		private function getScoreForBall(ball : String, previousBallScore : Number) : Number{
			if(ball == "X"){
				return Number(10);
			}
			else if(ball == "/"){
				return Number(10 - previousBallScore);
			}
			else if (NumberUtil.isDigit(ball)){
				return new Number(ball);
			}
			else return Number(0);
		}
	}
}