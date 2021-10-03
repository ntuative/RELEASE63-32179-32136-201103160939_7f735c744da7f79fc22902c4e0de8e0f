package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class DisconnectReasonParser implements IMessageParser
   {
       
      
      private var var_1323:int;
      
      public function DisconnectReasonParser()
      {
         super();
         this.var_1323 = -1;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1323 = param1.readInteger();
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1323;
      }
   }
}
