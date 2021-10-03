package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1149:int = 1;
      
      public static const const_883:int = 2;
      
      public static const const_869:int = 3;
      
      public static const const_1684:int = 4;
       
      
      private var _index:int;
      
      private var var_2279:String;
      
      private var var_2281:String;
      
      private var var_2280:Boolean;
      
      private var var_2283:String;
      
      private var var_987:String;
      
      private var var_2282:int;
      
      private var var_2094:int;
      
      private var _type:int;
      
      private var var_2199:String;
      
      private var var_883:GuestRoomData;
      
      private var var_882:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2279 = param1.readString();
         this.var_2281 = param1.readString();
         this.var_2280 = param1.readInteger() == 1;
         this.var_2283 = param1.readString();
         this.var_987 = param1.readString();
         this.var_2282 = param1.readInteger();
         this.var_2094 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1149)
         {
            this.var_2199 = param1.readString();
         }
         else if(this._type == const_869)
         {
            this.var_882 = new PublicRoomData(param1);
         }
         else if(this._type == const_883)
         {
            this.var_883 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_883 != null)
         {
            this.var_883.dispose();
            this.var_883 = null;
         }
         if(this.var_882 != null)
         {
            this.var_882.dispose();
            this.var_882 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2279;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2281;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2280;
      }
      
      public function get picText() : String
      {
         return this.var_2283;
      }
      
      public function get picRef() : String
      {
         return this.var_987;
      }
      
      public function get method_7() : int
      {
         return this.var_2282;
      }
      
      public function get tag() : String
      {
         return this.var_2199;
      }
      
      public function get userCount() : int
      {
         return this.var_2094;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_883;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_882;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1149)
         {
            return 0;
         }
         if(this.type == const_883)
         {
            return this.var_883.maxUserCount;
         }
         if(this.type == const_869)
         {
            return this.var_882.maxUsers;
         }
         return 0;
      }
   }
}
