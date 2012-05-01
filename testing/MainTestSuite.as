package
{

	import tests.*;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MainTestSuite
	{
	
		//public var <something>Tests : <SOME TEST CLASS>;
		public var userTests : UserTests;
		public var userManagerTests : UserManagerTests;
		public var ricochetTests : RicochetTests;
		public var ballDodgeTests : BallDodgeTests;
		
	}
	
}