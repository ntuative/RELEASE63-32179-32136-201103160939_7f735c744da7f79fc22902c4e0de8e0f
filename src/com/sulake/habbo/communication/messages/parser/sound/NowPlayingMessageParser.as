package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1757:int;
      
      private var _currentPosition:int;
      
      private var var_1758:int;
      
      private var var_1755:int;
      
      private var var_1756:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1757;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1758;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1755;
      }
      
      public function get syncCount() : int
      {
         return this.var_1756;
      }
      
      public function flush() : Boolean
      {
         this.var_1757 = -1;
         this._currentPosition = -1;
         this.var_1758 = -1;
         this.var_1755 = -1;
         this.var_1756 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1757 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1758 = param1.readInteger();
         this.var_1755 = param1.readInteger();
         this.var_1756 = param1.readInteger();
         return true;
      }
   }
}
