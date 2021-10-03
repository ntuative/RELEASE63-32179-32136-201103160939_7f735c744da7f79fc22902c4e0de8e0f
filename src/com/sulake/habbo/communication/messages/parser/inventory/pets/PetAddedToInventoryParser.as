package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetAddedToInventoryParser implements IMessageParser
   {
       
      
      private var var_936:PetData;
      
      private var var_2438:Boolean;
      
      public function PetAddedToInventoryParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_936 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_936 = new PetData(param1);
         this.var_2438 = param1.readBoolean();
         return true;
      }
      
      public function get pet() : PetData
      {
         return this.var_936;
      }
      
      public function get purchased() : Boolean
      {
         return this.var_2438;
      }
   }
}
