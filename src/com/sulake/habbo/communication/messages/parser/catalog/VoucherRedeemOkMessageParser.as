package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_919:String = "";
      
      private var var_1130:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1130 = "";
         this.var_919 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1130 = param1.readString();
         this.var_919 = param1.readString();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_919;
      }
      
      public function get productDescription() : String
      {
         return this.var_1130;
      }
   }
}
