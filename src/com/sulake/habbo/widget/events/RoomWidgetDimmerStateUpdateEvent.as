package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_63:String = "RWDSUE_DIMMER_STATE";
       
      
      private var _state:int;
      
      private var var_2258:int;
      
      private var var_1198:int;
      
      private var _color:uint;
      
      private var var_1199:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_63,param6,param7);
         this._state = param1;
         this.var_2258 = param2;
         this.var_1198 = param3;
         this._color = param4;
         this.var_1199 = param5;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get presetId() : int
      {
         return this.var_2258;
      }
      
      public function get effectId() : int
      {
         return this.var_1198;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : uint
      {
         return this.var_1199;
      }
   }
}
