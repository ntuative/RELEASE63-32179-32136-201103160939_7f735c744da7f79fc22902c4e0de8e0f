package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_284:int = -2.147483648E9;
      
      private var var_285:int = 2.147483647E9;
      
      private var var_286:int = -2.147483648E9;
      
      private var var_287:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_284;
      }
      
      public function get maxWidth() : int
      {
         return this.var_285;
      }
      
      public function get minHeight() : int
      {
         return this.var_286;
      }
      
      public function get maxHeight() : int
      {
         return this.var_287;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_284 = param1;
         if(this.var_284 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_284)
         {
            this._target.width = this.var_284;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_285 = param1;
         if(this.var_285 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_285)
         {
            this._target.width = this.var_285;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_286 = param1;
         if(this.var_286 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_286)
         {
            this._target.height = this.var_286;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_287 = param1;
         if(this.var_287 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_287)
         {
            this._target.height = this.var_287;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_284 == int.MIN_VALUE && this.var_285 == int.MAX_VALUE && this.var_286 == int.MIN_VALUE && this.var_287 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_284 = int.MIN_VALUE;
         this.var_285 = int.MAX_VALUE;
         this.var_286 = int.MIN_VALUE;
         this.var_287 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_284)
            {
               this._target.width = this.var_284;
            }
            else if(this._target.width > this.var_285)
            {
               this._target.width = this.var_285;
            }
            if(this._target.height < this.var_286)
            {
               this._target.height = this.var_286;
            }
            else if(this._target.height > this.var_287)
            {
               this._target.height = this.var_287;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_284 = param1;
         this.var_285 = param2;
         this.var_286 = param3;
         this.var_287 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_284 = this.var_284;
         _loc2_.var_285 = this.var_285;
         _loc2_.var_286 = this.var_286;
         _loc2_.var_287 = this.var_287;
         return _loc2_;
      }
   }
}
