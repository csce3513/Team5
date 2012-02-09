package  {
	
	import flash.display.MovieClip;
	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;
	import tests.ExampleTests;
	
	public class TestRunner extends flash.display.MovieClip
	{
		
		public function TestRunner()
		{
			//Must setup FlexUnit and then run it
			var traceListener:TraceListener = new TraceListener();
			var flexUnitCore:FlexUnitCore = new FlexUnitCore();
			flexUnitCore.addListener(traceListener);
			flexUnitCore.run(tests.ExampleTests);
		}
	
	}
	
}