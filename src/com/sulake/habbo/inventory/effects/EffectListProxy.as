package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_69:EffectsModel;
      
      private var var_353:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_69 = param1;
         this.var_353 = param2;
      }
      
      public function dispose() : void
      {
         this.var_69 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_69.getEffects(this.var_353);
      }
   }
}
