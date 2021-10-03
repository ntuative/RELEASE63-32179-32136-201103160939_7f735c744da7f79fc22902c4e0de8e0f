package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_2460:Number = 0;
      
      private var var_2455:Number = 0;
      
      private var var_2457:Number = 0;
      
      private var var_2456:Number = 0;
      
      private var var_371:int = 0;
      
      private var var_2459:int = 0;
      
      private var var_324:Array;
      
      private var var_2458:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_324 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_155 = param3;
         this.var_156 = param4;
         this.var_2460 = param5;
         this.var_371 = param6;
         this.var_2459 = param7;
         this.var_2455 = param8;
         this.var_2457 = param9;
         this.var_2456 = param10;
         this.var_2458 = param11;
         this.var_324 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_155;
      }
      
      public function get z() : Number
      {
         return this.var_156;
      }
      
      public function get localZ() : Number
      {
         return this.var_2460;
      }
      
      public function get targetX() : Number
      {
         return this.var_2455;
      }
      
      public function get targetY() : Number
      {
         return this.var_2457;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2456;
      }
      
      public function get dir() : int
      {
         return this.var_371;
      }
      
      public function get dirHead() : int
      {
         return this.var_2459;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2458;
      }
      
      public function get actions() : Array
      {
         return this.var_324.slice();
      }
   }
}
