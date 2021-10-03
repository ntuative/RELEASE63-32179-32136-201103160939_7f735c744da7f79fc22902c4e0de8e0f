package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1876:int;
      
      private var var_2640:int;
      
      private var var_1460:int;
      
      private var var_2219:int;
      
      private var var_121:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1876 = param1.readInteger();
         this.var_2640 = param1.readInteger();
         this.var_1460 = param1.readInteger();
         this.var_2219 = param1.readInteger();
         this.var_121 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1876);
      }
      
      public function get callId() : int
      {
         return this.var_1876;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2640;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1460;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2219;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_121;
      }
   }
}
