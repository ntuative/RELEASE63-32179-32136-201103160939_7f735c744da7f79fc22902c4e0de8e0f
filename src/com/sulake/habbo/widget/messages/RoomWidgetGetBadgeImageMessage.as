package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_885:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_309:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_885);
         this.var_309 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_309;
      }
   }
}
