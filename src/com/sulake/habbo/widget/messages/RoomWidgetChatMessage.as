package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_896:String = "RWCM_MESSAGE_CHAT";
      
      public static const const_131:int = 0;
      
      public static const const_149:int = 1;
      
      public static const const_121:int = 2;
       
      
      private var var_1484:int = 0;
      
      private var _text:String = "";
      
      private var var_2397:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         this._text = param2;
         this.var_1484 = param3;
         this.var_2397 = param4;
      }
      
      public function get chatType() : int
      {
         return this.var_1484;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get recipientName() : String
      {
         return this.var_2397;
      }
   }
}
