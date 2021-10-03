package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1382:Boolean = false;
      
      private var var_1597:int;
      
      private var var_1571:Array;
      
      private var var_688:Array;
      
      private var var_689:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1382 = _loc2_.isWrappingEnabled;
         this.var_1597 = _loc2_.wrappingPrice;
         this.var_1571 = _loc2_.stuffTypes;
         this.var_688 = _loc2_.boxTypes;
         this.var_689 = _loc2_.method_3;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1382;
      }
      
      public function get price() : int
      {
         return this.var_1597;
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
   }
}
