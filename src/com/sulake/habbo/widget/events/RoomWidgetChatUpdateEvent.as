package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_812:String = "RWCUE_EVENT_CHAT";
      
      public static const const_131:int = 0;
      
      public static const const_149:int = 1;
      
      public static const const_121:int = 2;
      
      public static const const_314:int = 3;
      
      public static const const_295:int = 4;
       
      
      private var _userId:int = 0;
      
      private var _text:String = "";
      
      private var var_1484:int = 0;
      
      private var _userName:String;
      
      private var var_1483:Array;
      
      private var var_2786:Number;
      
      private var var_2785:Number;
      
      private var var_2784:BitmapData;
      
      private var var_2783:uint;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_2787:int;
      
      public function RoomWidgetChatUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Number, param7:Number, param8:BitmapData, param9:uint, param10:int, param11:int, param12:int = 0, param13:Array = null, param14:Boolean = false, param15:Boolean = false)
      {
         super(param1,param14,param15);
         this._userId = param2;
         this._text = param3;
         this.var_1484 = param12;
         this._userName = param4;
         this.var_2787 = param5;
         this.var_1483 = param13;
         this.var_2786 = param6;
         this.var_2785 = param7;
         this.var_2784 = param8;
         this.var_2783 = param9;
         this._roomId = param10;
         this._roomCategory = param11;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get chatType() : int
      {
         return this.var_1484;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get userCategory() : int
      {
         return this.var_2787;
      }
      
      public function get links() : Array
      {
         return this.var_1483;
      }
      
      public function get userX() : Number
      {
         return this.var_2786;
      }
      
      public function get userY() : Number
      {
         return this.var_2785;
      }
      
      public function get userImage() : BitmapData
      {
         return this.var_2784;
      }
      
      public function get userColor() : uint
      {
         return this.var_2783;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
   }
}
