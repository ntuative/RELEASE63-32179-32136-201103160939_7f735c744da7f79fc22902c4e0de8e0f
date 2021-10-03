package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_845:int = 1;
      
      public static const const_647:int = 2;
      
      public static const const_769:int = 3;
      
      public static const const_1103:int = 4;
      
      public static const const_690:int = 5;
      
      public static const const_1032:int = 6;
       
      
      private var _type:int;
      
      private var var_1211:int;
      
      private var var_2082:String;
      
      private var var_2594:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1211 = param2;
         this.var_2082 = param3;
         this.var_2594 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2082;
      }
      
      public function get time() : String
      {
         return this.var_2594;
      }
      
      public function get senderId() : int
      {
         return this.var_1211;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
