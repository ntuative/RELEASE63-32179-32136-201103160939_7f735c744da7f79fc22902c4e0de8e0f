package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1658:int;
      
      private var var_2051:String;
      
      private var var_1440:int;
      
      private var var_1113:int;
      
      private var var_1630:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1658 = param1.readInteger();
         this.var_2051 = param1.readString();
         this.var_1440 = param1.readInteger();
         this.var_1113 = param1.readInteger();
         this.var_1630 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1658;
      }
      
      public function get petName() : String
      {
         return this.var_2051;
      }
      
      public function get level() : int
      {
         return this.var_1440;
      }
      
      public function get petType() : int
      {
         return this.var_1113;
      }
      
      public function get breed() : int
      {
         return this.var_1630;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
