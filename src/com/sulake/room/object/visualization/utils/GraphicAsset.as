package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1851:String;
      
      private var var_2681:String;
      
      private var var_424:BitmapDataAsset;
      
      private var var_1447:Boolean;
      
      private var var_1448:Boolean;
      
      private var var_2680:Boolean;
      
      private var _offsetX:int;
      
      private var var_1063:int;
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_780:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1851 = param1;
         this.var_2681 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_424 = _loc9_;
            this.var_780 = false;
         }
         else
         {
            this.var_424 = null;
            this.var_780 = true;
         }
         this.var_1447 = param4;
         this.var_1448 = param5;
         this._offsetX = param6;
         this.var_1063 = param7;
         this.var_2680 = param8;
      }
      
      public function dispose() : void
      {
         this.var_424 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_780 && this.var_424 != null)
         {
            _loc1_ = this.var_424.content as BitmapData;
            if(_loc1_ != null)
            {
               this._width = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_780 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1448;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1447;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this._width;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1851;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2681;
      }
      
      public function get asset() : IAsset
      {
         return this.var_424;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2680;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1447)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1448)
         {
            return this.var_1063;
         }
         return -(this.height + this.var_1063);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1063;
      }
   }
}
