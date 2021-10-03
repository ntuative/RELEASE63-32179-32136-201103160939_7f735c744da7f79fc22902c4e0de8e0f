package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1131:Boolean;
      
      private var var_1132:Boolean;
      
      private var var_1393:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1131;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1132;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1393;
      }
      
      public function flush() : Boolean
      {
         this.var_1131 = false;
         this.var_1132 = false;
         this.var_1393 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1131 = param1.readBoolean();
         this.var_1132 = param1.readBoolean();
         this.var_1393 = param1.readBoolean();
         return true;
      }
   }
}
