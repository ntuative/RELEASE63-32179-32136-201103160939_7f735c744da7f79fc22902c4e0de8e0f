package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_348:int;
      
      private var var_2094:int;
      
      private var var_2574:Boolean;
      
      private var var_2449:int;
      
      private var _ownerName:String;
      
      private var var_121:RoomData;
      
      private var var_790:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_348 = param1.readInteger();
         this.var_2094 = param1.readInteger();
         this.var_2574 = param1.readBoolean();
         this.var_2449 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_121 = new RoomData(param1);
         this.var_790 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_121 != null)
         {
            this.var_121.dispose();
            this.var_121 = null;
         }
         if(this.var_790 != null)
         {
            this.var_790.dispose();
            this.var_790 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_348;
      }
      
      public function get userCount() : int
      {
         return this.var_2094;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2574;
      }
      
      public function get ownerId() : int
      {
         return this.var_2449;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_121;
      }
      
      public function get event() : RoomData
      {
         return this.var_790;
      }
   }
}
