package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_939:int = 20;
      
      private static const const_600:int = 10;
      
      private static const const_1306:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_299:Array;
      
      private var var_760:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_299 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_760)
            {
               this.var_760 = true;
               this.var_299 = new Array();
               this.var_299.push(const_1306);
               this.var_299.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_600)
         {
            if(this.var_760)
            {
               this.var_760 = false;
               this.var_299 = new Array();
               if(direction == 2)
               {
                  this.var_299.push(const_939 + 5 - param1);
                  this.var_299.push(const_600 + 5 - param1);
               }
               else
               {
                  this.var_299.push(const_939 + param1);
                  this.var_299.push(const_600 + param1);
               }
               this.var_299.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_299.length > 0)
            {
               super.setAnimation(this.var_299.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
