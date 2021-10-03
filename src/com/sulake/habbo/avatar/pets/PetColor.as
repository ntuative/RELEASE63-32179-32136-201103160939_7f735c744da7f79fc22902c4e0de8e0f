package com.sulake.habbo.avatar.pets
{
   import flash.geom.ColorTransform;
   
   public class PetColor extends PetEditorInfo implements IPetColor
   {
       
      
      private var _id:int;
      
      private var _rgb:uint;
      
      private var var_1712:uint;
      
      private var var_1709:uint;
      
      private var _b:uint;
      
      private var var_962:ColorTransform;
      
      private var var_1711:Number;
      
      private var var_1713:Number;
      
      private var var_1710:Number;
      
      private var var_2663:int;
      
      public function PetColor(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         var _loc2_:String = param1.text();
         this._rgb = parseInt(_loc2_,16);
         this.var_1712 = this._rgb >> 16 & 255;
         this.var_1709 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_1711 = this.var_1712 / 255 * 1;
         this.var_1713 = this.var_1709 / 255 * 1;
         this.var_1710 = this._b / 255 * 1;
         this.var_962 = new ColorTransform(this.var_1711,this.var_1713,this.var_1710);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get rgb() : uint
      {
         return this._rgb;
      }
      
      public function get r() : uint
      {
         return this.var_1712;
      }
      
      public function get g() : uint
      {
         return this.var_1709;
      }
      
      public function get b() : uint
      {
         return this._b;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_962;
      }
      
      public function get figurePartPaletteColorId() : int
      {
         return this.var_2663;
      }
      
      public function set figurePartPaletteColorId(param1:int) : void
      {
         this.var_2663 = param1;
      }
   }
}
