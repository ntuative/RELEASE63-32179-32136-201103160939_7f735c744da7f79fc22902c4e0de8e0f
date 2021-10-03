package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2684:Number;
      
      private var var_1976:Number;
      
      private var var_985:Number;
      
      private var var_513:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2684 = param1;
         this.var_1976 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_985 = param1;
         this.var_513 = 0;
      }
      
      public function update() : void
      {
         this.var_985 += this.var_1976;
         this.var_513 += this.var_985;
         if(this.var_513 > 0)
         {
            this.var_513 = 0;
            this.var_985 = this.var_2684 * -1 * this.var_985;
         }
      }
      
      public function get location() : Number
      {
         return this.var_513;
      }
   }
}
