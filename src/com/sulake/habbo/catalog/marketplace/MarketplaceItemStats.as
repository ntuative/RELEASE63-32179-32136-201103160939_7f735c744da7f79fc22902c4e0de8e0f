package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2156:int;
      
      private var var_2153:int;
      
      private var var_2157:int;
      
      private var _dayOffsets:Array;
      
      private var var_1588:Array;
      
      private var var_1589:Array;
      
      private var var_2154:int;
      
      private var var_2155:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2156;
      }
      
      public function get offerCount() : int
      {
         return this.var_2153;
      }
      
      public function get historyLength() : int
      {
         return this.var_2157;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1588;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1589;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2154;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2155;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2156 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2153 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2157 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1588 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1589 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2154 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2155 = param1;
      }
   }
}
