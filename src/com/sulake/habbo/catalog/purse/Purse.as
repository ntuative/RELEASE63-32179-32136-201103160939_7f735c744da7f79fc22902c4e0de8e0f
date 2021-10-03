package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_197:int = 0;
       
      
      private var var_2266:int = 0;
      
      private var var_1341:Dictionary;
      
      private var var_1626:int = 0;
      
      private var var_1627:int = 0;
      
      private var var_2161:Boolean = false;
      
      private var var_2265:int = 0;
      
      private var var_2267:int = 0;
      
      public function Purse()
      {
         this.var_1341 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2266;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2266 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1626;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1626 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1627;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1627 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1626 > 0 || this.var_1627 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2161;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2161 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2265;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2265 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2267;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2267 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1341;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1341 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1341[param1];
      }
   }
}
