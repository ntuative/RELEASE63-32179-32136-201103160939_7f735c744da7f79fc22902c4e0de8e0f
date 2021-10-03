package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1150:int;
      
      private var var_2414:String;
      
      private var var_2415:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1150 = param1.readInteger();
         this.var_2414 = param1.readString();
         this.var_2415 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1150;
      }
      
      public function get requesterName() : String
      {
         return this.var_2414;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2415;
      }
   }
}
