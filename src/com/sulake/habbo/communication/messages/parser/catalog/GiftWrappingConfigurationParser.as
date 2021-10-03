package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2679:Boolean;
      
      private var var_2678:int;
      
      private var var_1571:Array;
      
      private var var_688:Array;
      
      private var var_689:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2679;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2678;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1571;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_688;
      }
      
      public function get method_3() : Array
      {
         return this.var_689;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1571 = [];
         this.var_688 = [];
         this.var_689 = [];
         this.var_2679 = param1.readBoolean();
         this.var_2678 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1571.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_688.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_689.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
