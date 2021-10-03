package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_460:String = "RWTDUE_TEASER_DATA";
      
      public static const const_852:String = "RWTDUE_GIFT_DATA";
      
      public static const const_696:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_361:int;
      
      private var _data:String;
      
      private var var_392:int;
      
      private var var_183:String;
      
      private var var_2068:String;
      
      private var var_2067:Boolean;
      
      private var var_1430:int = 0;
      
      private var var_2474:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_361;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_392;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2068;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2067;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2474;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1430;
      }
      
      public function set status(param1:int) : void
      {
         this.var_392 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2068 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2067 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2474 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_361 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_183;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_183 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1430 = param1;
      }
   }
}
