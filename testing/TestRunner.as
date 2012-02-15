package
{
	
	import flash.display.MovieClip;
	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;
	import org.flexunit.runner.notification.RunListener;
	
	public class TestRunner extends flash.display.MovieClip
	{
		
		public function TestRunner()
		{
			//Must setup FlexUnit and then run it
			var flexUnitCore:FlexUnitCore = new FlexUnitCore();
			flexUnitCore.addListener(new TraceListener());
			flexUnitCore.run(MainTestSuite);
		}
	
	}
	
}