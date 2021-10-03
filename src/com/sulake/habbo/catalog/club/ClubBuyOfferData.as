package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1602:String;
      
      private var var_1597:int;
      
      private var var_2183:Boolean;
      
      private var var_2187:Boolean;
      
      private var var_2182:int;
      
      private var var_2186:int;
      
      private var var_432:ICatalogPage;
      
      private var var_2184:int;
      
      private var var_2188:int;
      
      private var var_2181:int;
      
      private var var_2185:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1602 = param2;
         this.var_1597 = param3;
         this.var_2183 = param4;
         this.var_2187 = param5;
         this.var_2182 = param6;
         this.var_2186 = param7;
         this.var_2184 = param8;
         this.var_2188 = param9;
         this.var_2181 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1602;
      }
      
      public function get price() : int
      {
         return this.var_1597;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2183;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2187;
      }
      
      public function get periods() : int
      {
         return this.var_2182;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2186;
      }
      
      public function get year() : int
      {
         return this.var_2184;
      }
      
      public function get month() : int
      {
         return this.var_2188;
      }
      
      public function get day() : int
      {
         return this.var_2181;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_197;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1597;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_432;
      }
      
      public function get priceType() : String
      {
         return Offer.const_663;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1602;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_432 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2185;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2185 = param1;
      }
   }
}
