package com.sulake.habbo.widget.events
{
   public class RoomWidgetPetCommandsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const PET_COMMANDS:String = "RWPCUE_PET_COMMANDS";
       
      
      private var _id:int;
      
      private var var_1361:Array;
      
      private var var_1245:Array;
      
      public function RoomWidgetPetCommandsUpdateEvent(param1:int, param2:Array, param3:Array, param4:Boolean = false, param5:Boolean = false)
      {
         super(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,param4,param5);
         this._id = param1;
         this.var_1361 = param2;
         this.var_1245 = param3;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get allCommands() : Array
      {
         return this.var_1361;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_1245;
      }
   }
}
