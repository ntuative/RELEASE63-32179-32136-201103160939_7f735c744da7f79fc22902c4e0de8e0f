package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_183:String;
      
      private var var_361:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1430:int = 0;
      
      private var var_392:int;
      
      private var _shareId:String;
      
      private var var_2068:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get campaignID() : String
      {
         return this.var_183;
      }
      
      public function get objectId() : int
      {
         return this.var_361;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1430;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get status() : int
      {
         return this.var_392;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2068;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_183 = param1.readString();
         this.var_361 = param1.readInteger();
         this.var_392 = param1.readInteger();
         this._shareId = param1.readString();
         this.var_2068 = param1.readString();
         this.var_1430 = param1.readInteger();
         return true;
      }
   }
}
