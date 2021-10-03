package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   
   public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_1020:String;
      
      protected var _type:String;
      
      protected var var_123:URLStream;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         this.var_1020 = param2 == null ? "" : param2.url;
         this._type = param1;
         this.var_123 = new URLStream();
         this.var_123.addEventListener(Event.COMPLETE,loadEventHandler);
         this.var_123.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         this.var_123.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         this.var_123.addEventListener(Event.OPEN,loadEventHandler);
         this.var_123.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         this.var_123.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get url() : String
      {
         return this.var_1020;
      }
      
      public function get ready() : Boolean
      {
         return this.bytesTotal > 0 ? this.bytesTotal == this.bytesLoaded : false;
      }
      
      public function get content() : Object
      {
         return this.var_123;
      }
      
      public function get mimeType() : String
      {
         return this._type;
      }
      
      public function get bytesLoaded() : uint
      {
         return this.var_123.bytesAvailable;
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_123.bytesAvailable;
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_1020 = param1.url;
         this.var_123.load(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            this.var_123.removeEventListener(Event.COMPLETE,loadEventHandler);
            this.var_123.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            this.var_123.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            this.var_123.removeEventListener(Event.OPEN,loadEventHandler);
            this.var_123.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            this.var_123.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            this.var_123.close();
            this.var_123 = null;
            this._type = null;
            this.var_1020 = null;
         }
      }
   }
}
