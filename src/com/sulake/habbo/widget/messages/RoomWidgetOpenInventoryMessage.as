package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_682:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1069:String = "inventory_effects";
      
      public static const const_1194:String = "inventory_badges";
      
      public static const const_1585:String = "inventory_clothes";
      
      public static const const_1406:String = "inventory_furniture";
       
      
      private var var_2486:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_682);
         this.var_2486 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2486;
      }
   }
}
