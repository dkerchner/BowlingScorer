package BowlingScorer.controllers
{
	import flexunit.framework.TestCase;
	import BowlingScorer.models.BowlingScoreResult;
	import BowlingScorer.controllers.BowlingScoreController;
	
	public class BowlingScoreControllerTest extends TestCase {
		// Some constants for the example scores
		private static const TEST_FRAMES_PERFECT_GAME : String = "X-X-X-X-X-X-X-X-X-X-XX";
		private static const TEST_FRAMES_1 : String = "45-54-36-27-09-63-81-18-90-72";
		private static const TEST_FRAMES_2: String = "5/-5/-5/-5/-5/-5/-5/-5/-5/-5/-5";
		
		/**
		 * Test Calculate Total Score
		 */
		public function testCalculateBowlingScore():void {
			var controller:BowlingScoreController=new BowlingScoreController();
			var result : BowlingScoreResult = controller.calculateBowlingScore(TEST_FRAMES_PERFECT_GAME);
			assertTrue("Bowling score is 300", result.getBowlingScoreResult() == 300);
			result = controller.calculateBowlingScore(TEST_FRAMES_1);
			assertTrue("Bowling score is 90", result.getBowlingScoreResult() == 90);
			result = controller.calculateBowlingScore(TEST_FRAMES_2);
			assertTrue("Bowling score is 150", result.getBowlingScoreResult() == 150);
		}		
	}
}