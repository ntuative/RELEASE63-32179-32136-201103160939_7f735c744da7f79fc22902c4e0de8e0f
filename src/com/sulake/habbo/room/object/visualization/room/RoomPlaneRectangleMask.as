package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2410:Number = 0.0;
      
      private var var_2411:Number = 0.0;
      
      private var var_2648:Number = 0.0;
      
      private var var_2647:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2410 = param1;
         this.var_2411 = param2;
         this.var_2648 = param3;
         this.var_2647 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2410;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2411;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2648;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2647;
      }
   }
}
