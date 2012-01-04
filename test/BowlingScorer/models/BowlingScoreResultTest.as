package BowlingScorer.models
{
	import flexunit.framework.TestCase;
	import BowlingScorer.models.BowlingScoreResult;
	
	public class BowlingScoreResultTest extends TestCase {
		
		/**
		 * Test Add Frame
		 */
		public function testAddFrameScore():void {
			var result:BowlingScoreResult=new BowlingScoreResult();
			result.addFrameScore(10);
			assertTrue("Bowling score is 10", result.getBowlingScoreResult() == 10);
			result.addFrameScore(5);
			assertTrue("Bowling score is 15", result.getBowlingScoreResult() == 15);			
		}
		
		/**
		 * Test clear score
		 */
		public function testClearScore():void {
			var result:BowlingScoreResult=new BowlingScoreResult();
			result.clearScore();
			assertTrue("Bowling score is 0", result.getBowlingScoreResult() == 0);
			result.addFrameScore(10);
			assertTrue("Bowling score is 10", result.getBowlingScoreResult() == 10);
			result.clearScore();
			assertTrue("Bowling score is 0", result.getBowlingScoreResult() == 0);
		}
		
	}
}