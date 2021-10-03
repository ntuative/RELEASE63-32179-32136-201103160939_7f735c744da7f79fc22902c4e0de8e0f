package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2302:int;
      
      private var var_1285:String;
      
      private var var_2303:int;
      
      private var var_2305:int;
      
      private var _category:int;
      
      private var var_2028:String;
      
      private var var_1462:int;
      
      private var var_2299:int;
      
      private var var_2300:int;
      
      private var var_2301:int;
      
      private var var_2304:int;
      
      private var var_2306:Boolean;
      
      private var var_2867:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2302 = param1;
         this.var_1285 = param2;
         this.var_2303 = param3;
         this.var_2305 = param4;
         this._category = param5;
         this.var_2028 = param6;
         this.var_1462 = param7;
         this.var_2299 = param8;
         this.var_2300 = param9;
         this.var_2301 = param10;
         this.var_2304 = param11;
         this.var_2306 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2302;
      }
      
      public function get itemType() : String
      {
         return this.var_1285;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2303;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2305;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2028;
      }
      
      public function get extra() : int
      {
         return this.var_1462;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2299;
      }
      
      public function get creationDay() : int
      {
         return this.var_2300;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2301;
      }
      
      public function get creationYear() : int
      {
         return this.var_2304;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2306;
      }
      
      public function get songID() : int
      {
         return this.var_1462;
      }
   }
}
