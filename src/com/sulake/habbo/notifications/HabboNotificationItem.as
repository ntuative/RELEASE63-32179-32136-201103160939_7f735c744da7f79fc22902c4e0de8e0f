package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_84:HabboNotificationItemStyle;
      
      private var var_181:String;
      
      private var var_23:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         this.var_181 = param1;
         this.var_84 = param2;
         this.var_23 = param3;
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return this.var_84;
      }
      
      public function get content() : String
      {
         return this.var_181;
      }
      
      public function dispose() : void
      {
         this.var_181 = null;
         if(this.var_84 != null)
         {
            this.var_84.dispose();
            this.var_84 = null;
         }
         this.var_23 = null;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_84.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(this.var_23 != null)
            {
               this.var_23.onExecuteLink(_loc2_);
            }
         }
      }
   }
}
