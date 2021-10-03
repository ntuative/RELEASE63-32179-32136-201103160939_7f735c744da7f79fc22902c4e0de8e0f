package com.sulake.habbo.inventory.items
{
   public class WallItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _type:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var var_1462:Number;
      
      protected var var_2028:String;
      
      protected var var_2794:Boolean;
      
      protected var var_2795:Boolean;
      
      protected var var_2306:Boolean;
      
      protected var var_2541:Boolean;
      
      protected var var_921:Boolean;
      
      public function WallItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2306 = param5;
         this.var_2795 = param6;
         this.var_2794 = param7;
         this.var_2541 = param8;
         this.var_2028 = param9;
         this.var_1462 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get extra() : Number
      {
         return this.var_1462;
      }
      
      public function get stuffData() : String
      {
         return this.var_2028;
      }
      
      public function set stuffData(param1:String) : void
      {
         this.var_2028 = param1;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2794;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2795;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2306;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2541;
      }
      
      public function get locked() : Boolean
      {
         return this.var_921;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_921 = param1;
      }
   }
}
