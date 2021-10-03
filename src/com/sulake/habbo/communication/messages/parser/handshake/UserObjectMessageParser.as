package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_935:String;
      
      private var var_2720:String;
      
      private var var_1924:String;
      
      private var var_2719:int;
      
      private var var_2718:String;
      
      private var var_2722:int;
      
      private var var_2721:int;
      
      private var var_2617:int;
      
      private var var_1044:int;
      
      private var var_678:int;
      
      private var var_2081:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_935 = param1.readString();
         this.var_2720 = param1.readString();
         this.var_1924 = param1.readString();
         this.var_2719 = param1.readInteger();
         this.var_2718 = param1.readString();
         this.var_2722 = param1.readInteger();
         this.var_2721 = param1.readInteger();
         this.var_2617 = param1.readInteger();
         this.var_1044 = param1.readInteger();
         this.var_678 = param1.readInteger();
         this.var_2081 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_935;
      }
      
      public function get customData() : String
      {
         return this.var_2720;
      }
      
      public function get realName() : String
      {
         return this.var_1924;
      }
      
      public function get tickets() : int
      {
         return this.var_2719;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2718;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2722;
      }
      
      public function get directMail() : int
      {
         return this.var_2721;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2617;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1044;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_678;
      }
      
      public function get identityId() : int
      {
         return this.var_2081;
      }
   }
}
