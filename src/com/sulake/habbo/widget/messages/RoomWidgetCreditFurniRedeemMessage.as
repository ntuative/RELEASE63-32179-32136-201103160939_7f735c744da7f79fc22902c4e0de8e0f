package com.sulake.habbo.widget.messages
{
   public class RoomWidgetCreditFurniRedeemMessage extends RoomWidgetMessage
   {
      
      public static const const_802:String = "RWFCRM_REDEEM";
       
      
      private var var_361:int;
      
      public function RoomWidgetCreditFurniRedeemMessage(param1:String, param2:int)
      {
         super(param1);
         this.var_361 = param2;
      }
      
      public function get objectId() : int
      {
         return this.var_361;
      }
   }
}
