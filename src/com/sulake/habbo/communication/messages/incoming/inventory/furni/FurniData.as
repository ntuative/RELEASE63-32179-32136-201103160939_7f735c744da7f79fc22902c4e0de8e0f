package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2260:int;
      
      private var var_1285:String;
      
      private var _objId:int;
      
      private var var_1652:int;
      
      private var _category:int;
      
      private var var_2028:String;
      
      private var var_2417:Boolean;
      
      private var var_2416:Boolean;
      
      private var var_2418:Boolean;
      
      private var var_2419:Boolean;
      
      private var var_2243:int;
      
      private var var_1462:int;
      
      private var var_1693:String = "";
      
      private var var_2034:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2260 = param1;
         this.var_1285 = param2;
         this._objId = param3;
         this.var_1652 = param4;
         this._category = param5;
         this.var_2028 = param6;
         this.var_2417 = param7;
         this.var_2416 = param8;
         this.var_2418 = param9;
         this.var_2419 = param10;
         this.var_2243 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1693 = param1;
         this.var_1462 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2260;
      }
      
      public function get itemType() : String
      {
         return this.var_1285;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1652;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2028;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2417;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2416;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2418;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2419;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2243;
      }
      
      public function get slotId() : String
      {
         return this.var_1693;
      }
      
      public function get songId() : int
      {
         return this.var_2034;
      }
      
      public function get extra() : int
      {
         return this.var_1462;
      }
   }
}
