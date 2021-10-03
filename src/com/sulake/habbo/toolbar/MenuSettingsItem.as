package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2269:String;
      
      private var var_2270:Array;
      
      private var var_2271:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2269 = param1;
         this.var_2270 = param2;
         this.var_2271 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2269;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2270;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2271;
      }
   }
}
