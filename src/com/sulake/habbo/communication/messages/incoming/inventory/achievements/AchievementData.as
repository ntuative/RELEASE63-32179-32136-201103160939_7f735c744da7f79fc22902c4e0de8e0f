package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1440:int;
      
      private var var_309:String;
      
      private var var_2467:int;
      
      private var var_2084:int;
      
      private var var_1813:int;
      
      private var var_2466:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1440 = param1.readInteger();
         this.var_309 = param1.readString();
         this.var_2467 = param1.readInteger();
         this.var_2084 = param1.readInteger();
         this.var_1813 = param1.readInteger();
         this.var_2466 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_309;
      }
      
      public function get level() : int
      {
         return this.var_1440;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2467;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2084;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1813;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2466;
      }
   }
}
