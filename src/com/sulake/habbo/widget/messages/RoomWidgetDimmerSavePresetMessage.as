package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_841:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2441:int;
      
      private var var_2442:int;
      
      private var _color:uint;
      
      private var var_1199:int;
      
      private var var_2443:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_841);
         this.var_2441 = param1;
         this.var_2442 = param2;
         this._color = param3;
         this.var_1199 = param4;
         this.var_2443 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2441;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2442;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1199;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2443;
      }
   }
}
