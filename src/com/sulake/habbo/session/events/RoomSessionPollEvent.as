package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_145:String = "RSPE_POLL_OFFER";
      
      public static const const_72:String = "RSPE_POLL_ERROR";
      
      public static const const_140:String = "RSPE_POLL_CONTENT";
       
      
      private var _id:int = -1;
      
      private var var_1810:String;
      
      private var var_1450:int = 0;
      
      private var var_1822:String = "";
      
      private var var_1821:String = "";
      
      private var var_1449:Array = null;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         this._id = param3;
         super(param1,param2);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get summary() : String
      {
         return this.var_1810;
      }
      
      public function set summary(param1:String) : void
      {
         this.var_1810 = param1;
      }
      
      public function get numQuestions() : int
      {
         return this.var_1450;
      }
      
      public function set numQuestions(param1:int) : void
      {
         this.var_1450 = param1;
      }
      
      public function get startMessage() : String
      {
         return this.var_1822;
      }
      
      public function set startMessage(param1:String) : void
      {
         this.var_1822 = param1;
      }
      
      public function get endMessage() : String
      {
         return this.var_1821;
      }
      
      public function set endMessage(param1:String) : void
      {
         this.var_1821 = param1;
      }
      
      public function get questionArray() : Array
      {
         return this.var_1449;
      }
      
      public function set questionArray(param1:Array) : void
      {
         this.var_1449 = param1;
      }
   }
}
