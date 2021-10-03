package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1797:Boolean;
      
      private var var_936:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1797 = param1.readBoolean();
         this.var_936 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1797 + ", " + this.var_936.id + ", " + this.var_936.name + ", " + this.var_936.type + ", " + this.var_936.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1797;
      }
      
      public function get pet() : PetData
      {
         return this.var_936;
      }
   }
}
