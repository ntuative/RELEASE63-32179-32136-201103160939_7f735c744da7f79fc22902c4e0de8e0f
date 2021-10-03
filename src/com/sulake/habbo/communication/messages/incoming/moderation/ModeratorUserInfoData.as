package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2499:int;
      
      private var var_2502:int;
      
      private var var_799:Boolean;
      
      private var var_2497:int;
      
      private var var_2500:int;
      
      private var var_2498:int;
      
      private var var_2501:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2499 = param1.readInteger();
         this.var_2502 = param1.readInteger();
         this.var_799 = param1.readBoolean();
         this.var_2497 = param1.readInteger();
         this.var_2500 = param1.readInteger();
         this.var_2498 = param1.readInteger();
         this.var_2501 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2499;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2502;
      }
      
      public function get online() : Boolean
      {
         return this.var_799;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2497;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2500;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2498;
      }
      
      public function get banCount() : int
      {
         return this.var_2501;
      }
   }
}
