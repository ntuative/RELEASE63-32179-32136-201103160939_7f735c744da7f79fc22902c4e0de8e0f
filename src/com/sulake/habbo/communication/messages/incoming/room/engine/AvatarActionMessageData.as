package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class AvatarActionMessageData
   {
       
      
      private var var_1720:String;
      
      private var _actionParameter:String;
      
      public function AvatarActionMessageData(param1:String, param2:String)
      {
         super();
         this.var_1720 = param1;
         this._actionParameter = param2;
      }
      
      public function get actionType() : String
      {
         return this.var_1720;
      }
      
      public function get actionParameter() : String
      {
         return this._actionParameter;
      }
   }
}
