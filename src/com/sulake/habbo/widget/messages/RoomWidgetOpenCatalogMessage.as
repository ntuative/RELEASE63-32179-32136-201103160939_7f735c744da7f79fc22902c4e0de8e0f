package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_363:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1112:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1224:String = "RWOCM_PIXELS";
      
      public static const const_1025:String = "RWOCM_CREDITS";
       
      
      private var var_2069:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_363);
         this.var_2069 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2069;
      }
   }
}
