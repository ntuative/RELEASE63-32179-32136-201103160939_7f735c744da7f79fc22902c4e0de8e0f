package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1864:String = "";
      
      private var var_1847:String = "";
      
      private var var_2169:String = "";
      
      private var var_2238:Number = 0;
      
      private var var_2239:Number = 0;
      
      private var var_2237:Number = 0;
      
      private var var_2236:Number = 0;
      
      private var var_2235:Boolean = false;
      
      private var var_2241:Boolean = false;
      
      private var var_2240:Boolean = false;
      
      private var var_2234:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1864 = param2;
         this.var_1847 = param3;
         this.var_2169 = param4;
         this.var_2238 = param5;
         this.var_2239 = param6;
         this.var_2237 = param7;
         this.var_2236 = param8;
         this.var_2235 = param9;
         this.var_2241 = param10;
         this.var_2240 = param11;
         this.var_2234 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1864;
      }
      
      public function get canvasId() : String
      {
         return this.var_1847;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2169;
      }
      
      public function get screenX() : Number
      {
         return this.var_2238;
      }
      
      public function get screenY() : Number
      {
         return this.var_2239;
      }
      
      public function get localX() : Number
      {
         return this.var_2237;
      }
      
      public function get localY() : Number
      {
         return this.var_2236;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2235;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2241;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2240;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2234;
      }
   }
}
