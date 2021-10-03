package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_640:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_585:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_640);
         this.var_585 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_585;
      }
   }
}
