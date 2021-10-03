package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1602:String;
      
      private var var_1597:int;
      
      private var var_2183:Boolean;
      
      private var var_2187:Boolean;
      
      private var var_2182:int;
      
      private var var_2186:int;
      
      private var var_2184:int;
      
      private var var_2188:int;
      
      private var var_2181:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1602 = param1.readString();
         this.var_1597 = param1.readInteger();
         this.var_2183 = param1.readBoolean();
         this.var_2187 = param1.readBoolean();
         this.var_2182 = param1.readInteger();
         this.var_2186 = param1.readInteger();
         this.var_2184 = param1.readInteger();
         this.var_2188 = param1.readInteger();
         this.var_2181 = param1.readInteger();
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
   }
}
