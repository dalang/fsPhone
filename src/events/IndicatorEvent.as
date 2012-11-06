package events
{
	import flash.events.Event;

	public class IndicatorEvent extends Event
	{
		public static var STATUS:String   = "status";
		public static var IDLE:String = "idle";
		public static var CALLING:String = "calling";
		public static var INCOMMING:String = "incomming";
		public static var DISCONNECTED:String = "disconnected";
		
		public var message:String;
		
		public function IndicatorEvent(type:String, message:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			this.message = message;	
		}
		
		public override function clone():Event {
			return new IndicatorEvent(type, message, bubbles, cancelable);
		}
	}
}