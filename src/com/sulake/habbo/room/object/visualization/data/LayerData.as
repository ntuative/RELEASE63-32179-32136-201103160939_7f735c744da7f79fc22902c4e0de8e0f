package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_675:String = "";
      
      public static const const_496:int = 0;
      
      public static const const_547:int = 255;
      
      public static const const_771:Boolean = false;
      
      public static const const_447:int = 0;
      
      public static const const_503:int = 0;
      
      public static const const_374:int = 0;
      
      public static const const_1178:int = 1;
      
      public static const const_1231:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2199:String = "";
      
      private var var_1888:int = 0;
      
      private var var_2089:int = 255;
      
      private var var_2197:Boolean = false;
      
      private var var_2201:int = 0;
      
      private var var_2200:int = 0;
      
      private var var_2198:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2199 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2199;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1888 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1888;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2089 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2089;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2197 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2197;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2201 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2201;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2200 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2200;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2198 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2198;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
