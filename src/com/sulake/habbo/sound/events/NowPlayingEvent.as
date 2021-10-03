package com.sulake.habbo.sound.events
{
   import flash.events.Event;
   
   public class NowPlayingEvent extends Event
   {
      
      public static const const_846:String = "NPE_SONG_CHANGED";
       
      
      private var _id:int;
      
      public function NowPlayingEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this._id = param2;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}
