package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserNameChangedMessageParser implements IMessageParser
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1956:int;
      
      private var _id:int;
      
      private var var_1955:String;
      
      public function UserNameChangedMessageParser()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get webId() : int
      {
         return this.var_1956;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get newName() : String
      {
         return this.var_1955;
      }
      
      public function flush() : Boolean
      {
         this.var_1956 = -1;
         this._id = -1;
         this.var_1955 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1956 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1955 = param1.readString();
         return true;
      }
   }
}
