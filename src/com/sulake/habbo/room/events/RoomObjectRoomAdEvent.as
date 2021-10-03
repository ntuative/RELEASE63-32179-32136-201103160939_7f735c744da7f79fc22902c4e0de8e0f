package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   import flash.events.Event;
   
   public class RoomObjectRoomAdEvent extends RoomObjectEvent
   {
      
      public static const const_311:String = "RORAE_ROOM_AD_FURNI_CLICK";
      
      public static const const_514:String = "RORAE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_370:String = "RORAE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_404:String = "RORAE_ROOM_AD_TOOLTIP_HIDE";
       
      
      private var var_1049:String = "";
      
      public function RoomObjectRoomAdEvent(param1:String, param2:int, param3:String, param4:String = "", param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param2,param3,param5,param6);
         this.var_1049 = param4;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1049;
      }
      
      override public function clone() : Event
      {
         return new RoomObjectRoomAdEvent(type,objectId,objectType,this.clickUrl,bubbles,cancelable);
      }
   }
}
