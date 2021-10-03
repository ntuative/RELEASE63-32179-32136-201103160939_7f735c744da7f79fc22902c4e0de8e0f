package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      protected var var_2034:int;
      
      protected var var_2032:int;
      
      protected var _songName:String;
      
      protected var var_2033:String;
      
      private var var_2439:Number = 0.0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2034 = param1;
         this.var_2032 = param2;
         this._songName = param3;
         this.var_2033 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2034;
      }
      
      public function get length() : int
      {
         return this.var_2032;
      }
      
      public function get name() : String
      {
         return this._songName;
      }
      
      public function get creator() : String
      {
         return this.var_2033;
      }
      
      public function get startPlayHeadPos() : Number
      {
         return this.var_2439;
      }
      
      public function set startPlayHeadPos(param1:Number) : void
      {
         this.var_2439 = param1;
      }
   }
}
