package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1219:Boolean;
      
      private var var_2729:int;
      
      private var var_2734:String;
      
      private var var_348:int;
      
      private var var_2730:int;
      
      private var var_2732:String;
      
      private var var_2731:String;
      
      private var var_2733:String;
      
      private var var_826:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_826 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1219 = false;
            return;
         }
         this.var_1219 = true;
         this.var_2729 = int(_loc2_);
         this.var_2734 = param1.readString();
         this.var_348 = int(param1.readString());
         this.var_2730 = param1.readInteger();
         this.var_2732 = param1.readString();
         this.var_2731 = param1.readString();
         this.var_2733 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_826.push(_loc5_);
            _loc4_++;
         }
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
      
      public function get ownerAvatarId() : int
      {
         return this.var_2729;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2734;
      }
      
      public function get flatId() : int
      {
         return this.var_348;
      }
      
      public function get eventType() : int
      {
         return this.var_2730;
      }
      
      public function get eventName() : String
      {
         return this.var_2732;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2731;
      }
      
      public function get creationTime() : String
      {
         return this.var_2733;
      }
      
      public function get tags() : Array
      {
         return this.var_826;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1219;
      }
   }
}
