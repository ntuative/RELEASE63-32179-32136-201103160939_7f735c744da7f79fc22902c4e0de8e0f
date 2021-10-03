package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_132:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_127:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1209:String;
      
      private var var_1372:Array;
      
      private var var_1073:Array;
      
      private var var_1675:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1209 = param2;
         this.var_1372 = param3;
         this.var_1073 = param4;
         if(this.var_1073 == null)
         {
            this.var_1073 = [];
         }
         this.var_1675 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1209;
      }
      
      public function get choices() : Array
      {
         return this.var_1372.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1073.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1675;
      }
   }
}
