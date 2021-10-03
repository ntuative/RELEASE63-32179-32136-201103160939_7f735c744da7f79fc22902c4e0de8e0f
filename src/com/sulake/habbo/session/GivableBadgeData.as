package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_309:int;
      
      private var var_2700:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_309 = param1;
         this.var_2700 = param2;
      }
      
      public function get badgeId() : int
      {
         return this.var_309;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2700;
      }
   }
}
