package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2166:int;
      
      private var var_2028:String;
      
      private var var_1597:int;
      
      private var var_392:int;
      
      private var var_2167:int = -1;
      
      private var var_2156:int;
      
      private var var_1596:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2166 = param3;
         this.var_2028 = param4;
         this.var_1597 = param5;
         this.var_392 = param6;
         this.var_2167 = param7;
         this.var_2156 = param8;
         this.var_1596 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2166;
      }
      
      public function get stuffData() : String
      {
         return this.var_2028;
      }
      
      public function get price() : int
      {
         return this.var_1597;
      }
      
      public function get status() : int
      {
         return this.var_392;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2167;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2156;
      }
      
      public function get offerCount() : int
      {
         return this.var_1596;
      }
   }
}
