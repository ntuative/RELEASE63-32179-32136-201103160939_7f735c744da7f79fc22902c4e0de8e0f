package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1885:int = 0;
      
      private var var_1884:int = 0;
      
      private var var_1595:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1885;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1884;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1595;
      }
      
      public function flush() : Boolean
      {
         this.var_1885 = 0;
         this.var_1884 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1885 = param1.readInteger();
         this.var_1884 = param1.readInteger();
         this.var_1595 = param1.readInteger();
         return true;
      }
   }
}
