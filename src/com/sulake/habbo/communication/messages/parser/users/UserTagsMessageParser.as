package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserTagsMessageParser implements IMessageParser
   {
       
      
      protected var var_826:Array;
      
      protected var _userId:int = 0;
      
      public function UserTagsMessageParser()
      {
         this.var_826 = [];
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_826 = [];
         this._userId = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_826.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get tags() : Array
      {
         return this.var_826.slice();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
