package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1693:int;
      
      private var var_2510:String;
      
      private var var_906:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1693 = param1.readInteger();
         this.var_2510 = param1.readString();
         this.var_906 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1693;
      }
      
      public function get figureString() : String
      {
         return this.var_2510;
      }
      
      public function get gender() : String
      {
         return this.var_906;
      }
   }
}
