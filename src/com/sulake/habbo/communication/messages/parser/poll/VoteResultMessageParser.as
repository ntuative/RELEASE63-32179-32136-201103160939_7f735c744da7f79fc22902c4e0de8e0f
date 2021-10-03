package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1209:String;
      
      private var var_1372:Array;
      
      private var var_1073:Array;
      
      private var var_1675:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1209;
      }
      
      public function get choices() : Array
      {
         return this.var_1372.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1073.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1675;
      }
      
      public function flush() : Boolean
      {
         this.var_1209 = "";
         this.var_1372 = [];
         this.var_1073 = [];
         this.var_1675 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1209 = param1.readString();
         this.var_1372 = [];
         this.var_1073 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1372.push(param1.readString());
            this.var_1073.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1675 = param1.readInteger();
         return true;
      }
   }
}
