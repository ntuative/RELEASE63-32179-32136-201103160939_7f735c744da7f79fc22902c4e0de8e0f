package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1656:int;
      
      private var var_1977:int;
      
      private var var_1978:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1977 = param1.readInteger();
         this.var_1656 = param1.readInteger();
         this.var_1978 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1656 = 0;
         this.var_1977 = 0;
         this.var_1978 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1656;
      }
      
      public function get messageId() : int
      {
         return this.var_1977;
      }
      
      public function get timestamp() : String
      {
         return this.var_1978;
      }
   }
}
