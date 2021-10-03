package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class DeleteRoomMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_33:Array;
      
      public function DeleteRoomMessageComposer(param1:int)
      {
         this.var_33 = new Array();
         super();
         this.var_33.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_33;
      }
      
      public function dispose() : void
      {
         this.var_33 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
