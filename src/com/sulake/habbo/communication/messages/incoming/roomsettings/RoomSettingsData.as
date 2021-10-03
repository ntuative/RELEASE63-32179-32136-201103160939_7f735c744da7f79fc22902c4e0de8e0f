package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_462:int = 0;
      
      public static const const_175:int = 1;
      
      public static const const_112:int = 2;
      
      public static const const_625:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1683:String;
      
      private var var_2091:int;
      
      private var var_1400:int;
      
      private var var_2207:int;
      
      private var var_2209:int;
      
      private var var_826:Array;
      
      private var var_2206:Array;
      
      private var var_2204:int;
      
      private var var_2093:Boolean;
      
      private var var_2203:Boolean;
      
      private var var_2208:Boolean;
      
      private var var_2205:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2093;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2093 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2203;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2203 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2208;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2208 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2205;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2205 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1683;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1683 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2091;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2091 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1400;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1400 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2207;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2207 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2209;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2209 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_826;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_826 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2206;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2206 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2204;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2204 = param1;
      }
   }
}
