package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var _name:String = "";
      
      private var _type:String = "";
      
      private var _x:Number = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_371:int = 0;
      
      private var var_514:int = 0;
      
      private var var_628:int = 0;
      
      private var var_188:Boolean = false;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function setReadOnly() : void
      {
         this.var_188 = true;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(!this.var_188)
         {
            this._type = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_188)
         {
            this._name = param1;
         }
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_188)
         {
            this._x = param1;
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
      
      public function get dir() : int
      {
         return this.var_371;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_188)
         {
            this.var_371 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_514;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_188)
         {
            this.var_514 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_628;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_188)
         {
            this.var_628 = param1;
         }
      }
   }
}
