package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1626:int = 0;
      
      private var var_1627:int = 0;
      
      private var var_2160:int = 0;
      
      private var var_2159:Boolean = false;
      
      private var var_2161:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1626 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1627 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2160 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2159 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2161 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1626;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1627;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2160;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2159;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2161;
      }
   }
}
