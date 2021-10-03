package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1382:Boolean;
      
      private var var_2149:int;
      
      private var var_1695:int;
      
      private var var_1694:int;
      
      private var var_2148:int;
      
      private var var_2146:int;
      
      private var var_2147:int;
      
      private var var_2150:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1382;
      }
      
      public function get commission() : int
      {
         return this.var_2149;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1695;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1694;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2146;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2148;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2147;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2150;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1382 = param1.readBoolean();
         this.var_2149 = param1.readInteger();
         this.var_1695 = param1.readInteger();
         this.var_1694 = param1.readInteger();
         this.var_2146 = param1.readInteger();
         this.var_2148 = param1.readInteger();
         this.var_2147 = param1.readInteger();
         this.var_2150 = param1.readInteger();
         return true;
      }
   }
}
