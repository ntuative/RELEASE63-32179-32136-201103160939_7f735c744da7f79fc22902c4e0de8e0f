package com.sulake.habbo.room.events
{
   import flash.events.Event;
   
   public class RoomEngineEvent extends Event
   {
      
      public static const const_882:String = "REE_ENGINE_INITIALIZED";
      
      public static const const_671:String = "REE_INITIALIZED";
      
      public static const const_753:String = "REE_DISPOSED";
      
      public static const const_582:String = "REE_GAME_MODE";
      
      public static const ROOM_ENGINE_NORMAL_MODE:String = "REE_NORMAL_MODE";
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function RoomEngineEvent(param1:String, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._roomId = param2;
         this._roomCategory = param3;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
   }
}
