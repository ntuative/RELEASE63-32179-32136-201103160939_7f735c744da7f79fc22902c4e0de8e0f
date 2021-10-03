package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2387:Boolean = false;
      
      private var var_2388:int = 0;
      
      private var var_2386:int = 0;
      
      private var var_2237:int = 0;
      
      private var var_2236:int = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_371:String = "";
      
      private var _type:int = 0;
      
      private var var_2870:String = "";
      
      private var var_1462:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_188:Boolean = false;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2387 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_188 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2387;
      }
      
      public function get wallX() : Number
      {
         return this.var_2388;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_188)
         {
            this.var_2388 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2386;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_188)
         {
            this.var_2386 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2237;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_188)
         {
            this.var_2237 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2236;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_188)
         {
            this.var_2236 = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_155;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_188)
         {
            this.var_155 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_156;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_188)
         {
            this.var_156 = param1;
         }
      }
      
      public function get dir() : String
      {
         return this.var_371;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_188)
         {
            this.var_371 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_188)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_188)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_188)
         {
            this._data = param1;
         }
      }
   }
}
