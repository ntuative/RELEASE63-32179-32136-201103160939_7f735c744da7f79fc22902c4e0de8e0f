package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2127:int;
      
      private var var_2390:int;
      
      private var var_1077:int;
      
      private var var_1076:int;
      
      private var var_1595:int;
      
      private var var_2389:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2127 = param1.readInteger();
         this.var_2390 = param1.readInteger();
         this.var_1077 = param1.readInteger();
         this.var_1076 = param1.readInteger();
         this.var_1595 = param1.readInteger();
         this.var_2389 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2127;
      }
      
      public function get charges() : int
      {
         return this.var_2390;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1077;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1076;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2389;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1595;
      }
   }
}
