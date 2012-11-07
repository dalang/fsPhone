package model 
{
	[Bindable]
	public class DialBuffer
	{
		public var dialnum:String = '';
		public var isConnected:Boolean;
		
		public function DialBuffer():void
		{
			this.dialnum = dialnum;
			this.isConnected = isConnected;
		}
	}
}