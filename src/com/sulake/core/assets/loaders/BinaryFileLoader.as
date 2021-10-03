package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_1020:String;
      
      protected var _type:String;
      
      protected var _data:String;
      
      protected var var_43:URLLoader;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         this.var_1020 = param2 == null ? "" : param2.url;
         this._type = param1;
         this.var_43 = new URLLoader();
         this.var_43.addEventListener(Event.COMPLETE,loadEventHandler);
         this.var_43.addEventListener(Event.UNLOAD,loadEventHandler);
         this.var_43.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         this.var_43.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         this.var_43.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         this.var_43.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
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
         return !!this._data ? this._data : (!!this.var_43 ? this.var_43.data : null);
      }
      
      public function get mimeType() : String
      {
         return this._type;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!this.var_43 ? uint(this.var_43.bytesLoaded) : uint(0);
      }
      
      public function get bytesTotal() : uint
      {
         return !!this.var_43 ? uint(this.var_43.bytesTotal) : uint(0);
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_1020 = param1.url;
         this._data = null;
         var_323 = 0;
         this.var_43.dataFormat = this._type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         this.var_43.load(param1);
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_323 < var_2793)
            {
               try
               {
                  this.var_43.close();
               }
               catch(e:Error)
               {
               }
               this.var_43.load(new URLRequest(this.var_1020 + (this.var_1020.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_323));
               return true;
            }
         }
         return false;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            this.var_43.removeEventListener(Event.COMPLETE,loadEventHandler);
            this.var_43.removeEventListener(Event.UNLOAD,loadEventHandler);
            this.var_43.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            this.var_43.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            this.var_43.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            this.var_43.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               this.var_43.close();
            }
            catch(e:Error)
            {
            }
            this.var_43 = null;
            this._type = null;
            this._data = null;
            this.var_1020 = null;
         }
      }
      
      private function timerEventHandler(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.target as Timer;
         if(_loc2_)
         {
            _loc2_.stop();
            _loc2_.removeEventListener(TimerEvent.TIMER,this.timerEventHandler);
         }
         if(!_disposed)
         {
            loadEventHandler(new Event(Event.COMPLETE));
         }
      }
   }
}
