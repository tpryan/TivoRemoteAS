package components
{
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode

	public class Hostname
	{
		
		private var _name:String ="" ;
		private const FILENAME:String = "hostname.txt";
		
		public function Hostname()
		{
			read();
		}
		
		
		//write an Object to a file

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function save():void {
			var file:File = File.applicationStorageDirectory.resolvePath(FILENAME);
			if (file.exists)
				file.deleteFile();
			var fileStream:FileStream = new FileStream(); //create a file stream
			fileStream.open(file, FileMode.WRITE);// and open the file for write
			fileStream.writeUTFBytes(_name);
			fileStream.close();
		}

		private function read():void {
			//read the file
			var file:File = File.applicationStorageDirectory.resolvePath(FILENAME);
			if (file.exists) {
				//create a file stream and open it for reading
				var fileStream:FileStream = new FileStream();
				fileStream.open(file, FileMode.READ);
				_name = fileStream.readUTFBytes(fileStream.bytesAvailable);
			}
		
			
		}
		
		
	}
}