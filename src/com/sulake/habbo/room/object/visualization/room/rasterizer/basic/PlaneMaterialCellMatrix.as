package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class PlaneMaterialCellMatrix
   {
      
      public static const const_395:int = 1;
      
      public static const const_264:int = 2;
      
      public static const const_270:int = 3;
      
      public static const const_241:int = 4;
      
      public static const const_255:int = 5;
      
      public static const REPEAT_MODE_RANDOM:int = 6;
      
      public static const const_1479:int = const_395;
      
      public static const const_57:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
      
      public static const const_116:int = 1;
      
      public static const const_221:int = 2;
      
      public static const const_294:int = const_116;
       
      
      private var var_368:Array;
      
      private var _repeatMode:int = 1;
      
      private var var_1831:int = 1;
      
      private var var_31:BitmapData;
      
      private var var_694:Vector3d = null;
      
      private var var_619:int = 0;
      
      private var var_1585:Boolean = false;
      
      private var var_1830:Boolean = true;
      
      private var var_2546:Number = -1.0;
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_2545:Number = -1.0;
      
      private var var_2544:Number = 1.0;
      
      public function PlaneMaterialCellMatrix(param1:int, param2:int = 1, param3:int = 1, param4:Number = -1.0, param5:Number = 1.0, param6:Number = -1.0, param7:Number = 1.0)
      {
         this.var_368 = [];
         super();
         if(param1 < 1)
         {
            param1 = 1;
         }
         var _loc8_:int = 0;
         while(_loc8_ < param1)
         {
            this.var_368.push(null);
            _loc8_++;
         }
         this._repeatMode = param2;
         this.var_1831 = param3;
         this.var_2546 = param4;
         this._normalMaxX = param5;
         this.var_2545 = param6;
         this.var_2544 = param7;
         this.var_694 = new Vector3d();
         if(this._repeatMode == REPEAT_MODE_RANDOM)
         {
            this.var_1830 = false;
         }
      }
      
      public function get normalMinX() : Number
      {
         return this.var_2546;
      }
      
      public function get normalMaxX() : Number
      {
         return this._normalMaxX;
      }
      
      public function get normalMinY() : Number
      {
         return this.var_2545;
      }
      
      public function get normalMaxY() : Number
      {
         return this.var_2544;
      }
      
      public function get isStatic() : Boolean
      {
         return this.var_1830;
      }
      
      public function dispose() : void
      {
         if(this.var_31 != null)
         {
            this.var_31.dispose();
            this.var_31 = null;
         }
         if(this.var_694 != null)
         {
            this.var_694 = null;
         }
      }
      
      public function clearCache() : void
      {
         var _loc2_:* = null;
         if(!this.var_1585)
         {
            return;
         }
         if(this.var_31 != null)
         {
            this.var_31.dispose();
            this.var_31 = null;
         }
         if(this.var_694 != null)
         {
            this.var_694.assign(new Vector3d());
         }
         this.var_619 = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_368.length)
         {
            _loc2_ = this.var_368[_loc1_] as PlaneMaterialCellColumn;
            if(_loc2_ != null)
            {
               _loc2_.clearCache();
            }
            _loc1_++;
         }
         this.var_1585 = false;
      }
      
      public function createColumn(param1:int, param2:int, param3:Array, param4:int = 1) : Boolean
      {
         if(param1 < 0 || param1 >= this.var_368.length)
         {
            return false;
         }
         var _loc5_:PlaneMaterialCellColumn = new PlaneMaterialCellColumn(param2,param3,param4);
         var _loc6_:PlaneMaterialCellColumn = this.var_368[param1] as PlaneMaterialCellColumn;
         if(_loc6_ != null)
         {
            _loc6_.dispose();
         }
         this.var_368[param1] = _loc5_;
         if(_loc5_ != null && !_loc5_.isStatic)
         {
            this.var_1830 = false;
         }
         return true;
      }
      
      public function render(param1:BitmapData, param2:int, param3:int, param4:IVector3d, param5:Boolean, param6:int, param7:Boolean) : BitmapData
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(param3 < 1)
         {
            param3 = 1;
         }
         if(param1 == null || param1.width != param2 || param1.height != param3)
         {
            param1 = null;
         }
         if(this.isStatic)
         {
            if(this.var_31 != null)
            {
               if(this.var_31.width == param2 && this.var_31.height == param3 && Vector3d.isEqual(this.var_694,param4))
               {
                  if(param1 != null)
                  {
                     this.copyCachedBitmapOnCanvas(param1,this.var_619,param6,param7);
                     return param1;
                  }
                  return this.var_31;
               }
               this.var_31.dispose();
               this.var_31 = null;
            }
         }
         else if(this.var_31 != null)
         {
            if(this.var_31.width == param2 && this.var_31.height == param3)
            {
               this.var_31.fillRect(this.var_31.rect,16777215);
            }
            else
            {
               this.var_31.dispose();
               this.var_31 = null;
            }
         }
         this.var_1585 = true;
         this.var_694.assign(param4);
         if(!param5)
         {
            this.var_619 = param3;
            if(this.var_31 == null)
            {
               this.var_31 = new BitmapData(param2,param3,true,4294967295);
            }
            else
            {
               this.var_31.fillRect(this.var_31.rect,4294967295);
            }
            if(param1 != null)
            {
               this.copyCachedBitmapOnCanvas(param1,param3,param6,param7);
               return param1;
            }
            return this.var_31;
         }
         if(this.var_31 == null)
         {
            this.var_619 = param3;
            this.var_31 = new BitmapData(param2,param3,true,16777215);
         }
         var _loc8_:* = [];
         var _loc9_:int = 0;
         while(_loc9_ < this.var_368.length)
         {
            _loc11_ = this.var_368[_loc9_] as PlaneMaterialCellColumn;
            if(_loc11_ != null)
            {
               _loc12_ = _loc11_.render(param3,param4);
               if(_loc12_ != null)
               {
                  _loc8_.push(_loc12_);
               }
            }
            _loc9_++;
         }
         if(_loc8_.length == 0)
         {
            if(param1 != null)
            {
               return param1;
            }
            return this.var_31;
         }
         var _loc10_:int = 0;
         switch(this._repeatMode)
         {
            case const_264:
               _loc10_ = this.renderRepeatBorders(this.var_31,_loc8_);
               break;
            case const_270:
               _loc10_ = this.renderRepeatCenter(this.var_31,_loc8_);
               break;
            case const_241:
               _loc10_ = this.renderRepeatFirst(this.var_31,_loc8_);
               break;
            case const_255:
               _loc10_ = this.renderRepeatLast(this.var_31,_loc8_);
               break;
            case REPEAT_MODE_RANDOM:
               _loc10_ = this.renderRepeatRandom(this.var_31,_loc8_);
               break;
            default:
               _loc10_ = this.renderRepeatAll(this.var_31,_loc8_);
         }
         this.var_619 = _loc10_;
         if(param1 != null)
         {
            this.copyCachedBitmapOnCanvas(param1,_loc10_,param6,param7);
            return param1;
         }
         return this.var_31;
      }
      
      private function copyCachedBitmapOnCanvas(param1:BitmapData, param2:int, param3:int, param4:Boolean) : void
      {
         if(param1 == null || this.var_31 == null || param1 == this.var_31)
         {
            return;
         }
         if(!param4)
         {
            param3 = param1.height - param2 - param3;
         }
         var _loc5_:* = null;
         if(this.var_1831 == const_116)
         {
            _loc5_ = new Rectangle(0,0,this.var_31.width,this.var_619);
         }
         else
         {
            _loc5_ = new Rectangle(0,this.var_31.height - this.var_619,this.var_31.width,this.var_619);
         }
         param1.copyPixels(this.var_31,_loc5_,new Point(0,param3),null,null,true);
      }
      
      private function getColumnsWidth(param1:Array) : int
      {
         var _loc4_:* = null;
         if(param1 == null || param1.length == 0)
         {
            return 0;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_] as BitmapData;
            if(_loc4_ != null)
            {
               _loc2_ += _loc4_.width;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function renderColumns(param1:BitmapData, param2:Array, param3:int, param4:Boolean) : Point
      {
         var _loc8_:int = 0;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return new Point(param3,0);
         }
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         while(_loc7_ < param2.length)
         {
            if(param4)
            {
               _loc6_ = param2[_loc7_] as BitmapData;
            }
            else
            {
               _loc6_ = param2[param2.length - 1 - _loc7_] as BitmapData;
            }
            if(_loc6_ != null)
            {
               if(!param4)
               {
                  param3 -= _loc6_.width;
               }
               _loc8_ = 0;
               if(this.var_1831 == const_221)
               {
                  _loc8_ = param1.height - _loc6_.height;
               }
               param1.copyPixels(_loc6_,_loc6_.rect,new Point(param3,_loc8_),_loc6_,null,true);
               if(_loc6_.height > _loc5_)
               {
                  _loc5_ = _loc6_.height;
               }
               if(param4)
               {
                  param3 += _loc6_.width;
               }
               if(param4 && param3 >= param1.width || !param4 && param3 <= 0)
               {
                  return new Point(param3,_loc5_);
               }
            }
            _loc7_++;
         }
         return new Point(param3,_loc5_);
      }
      
      private function renderRepeatAll(param1:BitmapData, param2:Array) : int
      {
         var _loc6_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:int = this.getColumnsWidth(param2);
         var _loc5_:int = 0;
         if(_loc4_ > param1.width)
         {
         }
         while(_loc5_ < param1.width)
         {
            _loc6_ = this.renderColumns(param1,param2,_loc5_,true);
            _loc5_ = _loc6_.x;
            if(_loc6_.y > _loc3_)
            {
               _loc3_ = _loc6_.y;
            }
            if(_loc6_.x == 0)
            {
               return _loc3_;
            }
         }
         return _loc3_;
      }
      
      private function renderRepeatBorders(param1:BitmapData, param2:Array) : int
      {
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = [];
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc7_ = 1;
         while(_loc7_ < param2.length - 1)
         {
            _loc4_ = param2[_loc7_] as BitmapData;
            if(_loc4_ != null)
            {
               _loc6_ += _loc4_.width;
               _loc5_.push(_loc4_);
            }
            _loc7_++;
         }
         if(this.var_368.length == 1)
         {
            _loc4_ = this.var_368[0] as BitmapData;
            if(_loc4_ != null)
            {
               _loc6_ = _loc4_.width;
               _loc5_.push(_loc4_);
            }
         }
         var _loc8_:* = param1.width - _loc6_ >> 1;
         var _loc9_:* = null;
         _loc9_ = this.renderColumns(param1,_loc5_,_loc8_,true);
         var _loc10_:int = _loc9_.x;
         if(_loc9_.y > _loc3_)
         {
            _loc3_ = _loc9_.y;
         }
         _loc4_ = param2[0] as BitmapData;
         if(_loc4_ != null)
         {
            _loc5_ = [_loc4_];
            while(_loc8_ >= 0)
            {
               _loc9_ = this.renderColumns(param1,_loc5_,_loc8_,false);
               _loc8_ = int(_loc9_.x);
               if(_loc9_.y > _loc3_)
               {
                  _loc3_ = _loc9_.y;
               }
            }
         }
         _loc4_ = param2[param2.length - 1] as BitmapData;
         if(_loc4_ != null)
         {
            _loc5_ = [_loc4_];
            while(_loc10_ < param1.height)
            {
               _loc9_ = this.renderColumns(param1,_loc5_,_loc10_,true);
               _loc10_ = _loc9_.x;
               if(_loc9_.y > _loc3_)
               {
                  _loc3_ = _loc9_.y;
               }
            }
         }
         return _loc3_;
      }
      
      private function renderRepeatCenter(param1:BitmapData, param2:Array) : int
      {
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = [];
         var _loc6_:* = [];
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc9_ = 0;
         while(_loc9_ < param2.length >> 1)
         {
            _loc4_ = param2[_loc9_] as BitmapData;
            if(_loc4_ != null)
            {
               _loc7_ += _loc4_.width;
               _loc5_.push(_loc4_);
            }
            _loc9_++;
         }
         _loc9_ = (param2.length >> 1) + 1;
         while(_loc9_ < param2.length)
         {
            _loc4_ = param2[_loc9_] as BitmapData;
            if(_loc4_ != null)
            {
               _loc8_ += _loc4_.width;
               _loc6_.push(_loc4_);
            }
            _loc9_++;
         }
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = param1.width;
         if(_loc7_ + _loc8_ > param1.width)
         {
            _loc11_ = _loc7_ + _loc8_ - param1.width;
            _loc12_ -= _loc11_ >> 1;
            _loc13_ += _loc11_ - (_loc11_ >> 1);
         }
         if(_loc11_ == 0)
         {
            _loc4_ = param2[param2.length >> 1] as BitmapData;
            if(_loc4_ != null)
            {
               _loc14_ = _loc4_.width;
               _loc15_ = param1.width - (_loc7_ + _loc8_);
               _loc16_ = Math.ceil(_loc15_ / _loc14_) * _loc14_;
               _loc12_ = _loc7_ - (_loc16_ - _loc15_ >> 1);
               _loc17_ = _loc12_ + _loc16_;
               _loc18_ = [_loc4_];
               while(_loc12_ < _loc17_)
               {
                  _loc10_ = this.renderColumns(param1,_loc18_,_loc12_,true);
                  _loc12_ = _loc10_.x;
                  if(_loc10_.y > _loc3_)
                  {
                     _loc3_ = _loc10_.y;
                  }
               }
            }
         }
         _loc12_ = 0;
         _loc10_ = this.renderColumns(param1,_loc5_,_loc12_,true);
         if(_loc10_.y > _loc3_)
         {
            _loc3_ = _loc10_.y;
         }
         _loc10_ = this.renderColumns(param1,_loc6_,_loc13_,false);
         if(_loc10_.y > _loc3_)
         {
            _loc3_ = _loc10_.y;
         }
         return _loc3_;
      }
      
      private function renderRepeatFirst(param1:BitmapData, param2:Array) : int
      {
         var _loc7_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.width;
         var _loc6_:Point = this.renderColumns(param1,param2,_loc5_,false);
         _loc5_ = _loc6_.x;
         if(_loc6_.y > _loc3_)
         {
            _loc3_ = _loc6_.y;
         }
         _loc4_ = param2[0] as BitmapData;
         if(_loc4_ != null)
         {
            _loc7_ = [_loc4_];
            while(_loc5_ >= 0)
            {
               _loc6_ = this.renderColumns(param1,_loc7_,_loc5_,false);
               _loc5_ = _loc6_.x;
               if(_loc6_.y > _loc3_)
               {
                  _loc3_ = _loc6_.y;
               }
            }
         }
         return _loc3_;
      }
      
      private function renderRepeatLast(param1:BitmapData, param2:Array) : int
      {
         var _loc7_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:Point = this.renderColumns(param1,param2,_loc5_,true);
         _loc5_ = _loc6_.x;
         if(_loc6_.y > _loc3_)
         {
            _loc3_ = _loc6_.y;
         }
         _loc4_ = param2[param2.length - 1] as BitmapData;
         if(_loc4_ != null)
         {
            _loc7_ = [_loc4_];
            while(_loc5_ < param1.width)
            {
               _loc6_ = this.renderColumns(param1,_loc7_,_loc5_,true);
               _loc5_ = _loc6_.x;
               if(_loc6_.y > _loc3_)
               {
                  _loc3_ = _loc6_.y;
               }
            }
         }
         return _loc3_;
      }
      
      private function renderRepeatRandom(param1:BitmapData, param2:Array) : int
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         while(_loc5_ < param1.width)
         {
            _loc6_ = Randomizer.getValues(1,0,param2.length * 17631);
            _loc7_ = _loc6_[0] % param2.length;
            _loc4_ = param2[_loc7_] as BitmapData;
            if(_loc4_ == null)
            {
               return _loc3_;
            }
            _loc8_ = [_loc4_];
            _loc9_ = this.renderColumns(param1,_loc8_,_loc5_,true);
            _loc5_ = _loc9_.x;
            if(_loc9_.y > _loc3_)
            {
               _loc3_ = _loc9_.y;
            }
         }
         return _loc3_;
      }
   }
}
