package com.sulake.habbo.communication.messages.outgoing.help
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SearchFaqsMessageComposer implements IMessageComposer
   {
       
      
      private var var_2323:String;
      
      public function SearchFaqsMessageComposer(param1:String)
      {
         super();
         this.var_2323 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2323];
      }
      
      public function dispose() : void
      {
      }
   }
}
