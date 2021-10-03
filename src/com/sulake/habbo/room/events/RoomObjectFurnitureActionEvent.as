package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectFurnitureActionEvent extends RoomObjectEvent
   {
      
      public static const ROOM_OBJECT_DICE_OFF:String = "ROFCAE_DICE_OFF";
      
      public static const const_428:String = "ROFCAE_DICE_ACTIVATE";
      
      public static const const_482:String = "ROFCAE_USE_HABBOWHEEL";
      
      public static const const_573:String = "ROFCAE_STICKIE";
      
      public static const const_544:String = "ROFCAE_VIRAL_GIFT";
      
      public static const const_549:String = "ROFCAE_ENTER_ONEWAYDOOR";
      
      public static const const_585:String = "ROFCAE_QUEST_VENDING";
      
      public static const const_497:String = "ROFCAE_SOUND_MACHINE_START";
      
      public static const const_495:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const const_553:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
      
      public static const const_558:String = "ROFCAE_JUKEBOX_INIT";
      
      public static const const_532:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const const_499:String = "ROFCAE_JUKEBOX_DISPOSE";
       
      
      public function RoomObjectFurnitureActionEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
