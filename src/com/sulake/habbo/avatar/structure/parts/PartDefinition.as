package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2356:String;
      
      private var var_1666:String;
      
      private var var_2355:String;
      
      private var var_1667:Boolean;
      
      private var var_1668:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2356 = String(param1["set-type"]);
         this.var_1666 = String(param1["flipped-set-type"]);
         this.var_2355 = String(param1["remove-set-type"]);
         this.var_1667 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1668 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1668;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1668 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2356;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1666;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2355;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1667;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1667 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1666 = param1;
      }
   }
}
