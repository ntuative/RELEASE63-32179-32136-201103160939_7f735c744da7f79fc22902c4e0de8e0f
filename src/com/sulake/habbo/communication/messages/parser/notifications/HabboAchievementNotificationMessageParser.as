package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1440:int;
      
      private var var_1665:int;
      
      private var var_2084:int;
      
      private var var_1813:int;
      
      private var var_1441:int;
      
      private var var_2085:String = "";
      
      private var var_2087:String = "";
      
      private var var_2086:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1440 = param1.readInteger();
         this.var_2085 = param1.readString();
         this.var_1665 = param1.readInteger();
         this.var_2084 = param1.readInteger();
         this.var_1813 = param1.readInteger();
         this.var_1441 = param1.readInteger();
         this.var_2086 = param1.readInteger();
         this.var_2087 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1440;
      }
      
      public function get points() : int
      {
         return this.var_1665;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2084;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1813;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1441;
      }
      
      public function get badgeID() : String
      {
         return this.var_2085;
      }
      
      public function get achievementID() : int
      {
         return this.var_2086;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2087;
      }
   }
}
