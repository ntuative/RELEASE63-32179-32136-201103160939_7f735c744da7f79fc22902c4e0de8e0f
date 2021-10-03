package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChangeEmailMessage extends RoomWidgetMessage
   {
      
      public static const const_683:String = "rwcem_change_email";
       
      
      private var var_2335:String;
      
      public function RoomWidgetChangeEmailMessage(param1:String)
      {
         super(const_683);
         this.var_2335 = param1;
      }
      
      public function get newEmail() : String
      {
         return this.var_2335;
      }
   }
}
