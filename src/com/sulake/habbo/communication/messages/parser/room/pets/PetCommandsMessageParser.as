package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1658:int;
      
      private var var_1361:Array;
      
      private var var_1245:Array;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1658;
      }
      
      public function get allCommands() : Array
      {
         return this.var_1361;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_1245;
      }
      
      public function flush() : Boolean
      {
         this.var_1658 = -1;
         this.var_1361 = null;
         this.var_1245 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1658 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1361 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_1361.push(param1.readInteger());
         }
         var _loc3_:int = param1.readInteger();
         this.var_1245 = new Array();
         while(_loc3_-- > 0)
         {
            this.var_1245.push(param1.readInteger());
         }
         return true;
      }
   }
}
