package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_348:int;
      
      private var var_790:Boolean;
      
      private var var_988:String;
      
      private var _ownerName:String;
      
      private var var_2091:int;
      
      private var var_2094:int;
      
      private var var_2096:int;
      
      private var var_1683:String;
      
      private var var_2097:int;
      
      private var var_2095:Boolean;
      
      private var var_737:int;
      
      private var var_1400:int;
      
      private var var_2092:String;
      
      private var var_826:Array;
      
      private var var_2090:RoomThumbnailData;
      
      private var var_2093:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_826 = new Array();
         super();
         this.var_348 = param1.readInteger();
         this.var_790 = param1.readBoolean();
         this.var_988 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2091 = param1.readInteger();
         this.var_2094 = param1.readInteger();
         this.var_2096 = param1.readInteger();
         this.var_1683 = param1.readString();
         this.var_2097 = param1.readInteger();
         this.var_2095 = param1.readBoolean();
         this.var_737 = param1.readInteger();
         this.var_1400 = param1.readInteger();
         this.var_2092 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_826.push(_loc4_);
            _loc3_++;
         }
         this.var_2090 = new RoomThumbnailData(param1);
         this.var_2093 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_826 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_348;
      }
      
      public function get event() : Boolean
      {
         return this.var_790;
      }
      
      public function get roomName() : String
      {
         return this.var_988;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2091;
      }
      
      public function get userCount() : int
      {
         return this.var_2094;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2096;
      }
      
      public function get description() : String
      {
         return this.var_1683;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2097;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2095;
      }
      
      public function get score() : int
      {
         return this.var_737;
      }
      
      public function get categoryId() : int
      {
         return this.var_1400;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2092;
      }
      
      public function get tags() : Array
      {
         return this.var_826;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2090;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2093;
      }
   }
}
