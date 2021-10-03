package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_120:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_157:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1041:int = 2;
      
      public static const const_1179:int = 3;
      
      public static const const_1414:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1923:String = "";
      
      private var var_2293:int;
      
      private var var_2292:int = 0;
      
      private var var_2295:int = 0;
      
      private var _figure:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_251:Array;
      
      private var var_1727:Array;
      
      private var var_1376:int = 0;
      
      private var var_2463:String = "";
      
      private var var_2461:int = 0;
      
      private var var_2462:int = 0;
      
      private var var_1918:Boolean = false;
      
      private var var_1924:String = "";
      
      private var var_2769:Boolean = false;
      
      private var var_2767:Boolean = true;
      
      private var var_1044:int = 0;
      
      private var var_2764:Boolean = false;
      
      private var var_2766:Boolean = false;
      
      private var var_2768:Boolean = false;
      
      private var var_2765:Boolean = false;
      
      private var var_2770:Boolean = false;
      
      private var var_2763:Boolean = false;
      
      private var var_2762:int = 0;
      
      private var var_1916:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_251 = [];
         this.var_1727 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1923 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1923;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2293 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2293;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2292 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2292;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2295 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2295;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_251 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_251;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1727;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1727 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1376 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1376;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2463 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2463;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2769 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2769;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1044 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1044;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2764 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2764;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2766 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2766;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2768 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2768;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2765 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2765;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2770 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2770;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2763 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2763;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2762 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2762;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2767 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2767;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1916 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1916;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2461 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2461;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2462 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2462;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1918 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1918;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1924 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1924;
      }
   }
}
