package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1036:String = "M";
      
      public static const const_1556:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_371:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_935:String = "";
      
      private var _figure:String = "";
      
      private var var_2294:String = "";
      
      private var var_2293:int;
      
      private var var_2292:int = 0;
      
      private var var_2290:String = "";
      
      private var var_2291:int = 0;
      
      private var var_2295:int = 0;
      
      private var var_2682:String = "";
      
      private var var_188:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_188 = true;
      }
      
      public function get id() : int
      {
         return this._id;
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
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_188)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_935;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_188)
         {
            this.var_935 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_188)
         {
            this._figure = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2294;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_188)
         {
            this.var_2294 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2293;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_188)
         {
            this.var_2293 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2292;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_188)
         {
            this.var_2292 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2290;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_188)
         {
            this.var_2290 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2291;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_188)
         {
            this.var_2291 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2295;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_188)
         {
            this.var_2295 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2682;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_188)
         {
            this.var_2682 = param1;
         }
      }
   }
}
