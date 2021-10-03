package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_953:String = "avatar";
      
      private static const const_605:Number = -0.01;
      
      private static const const_606:Number = -0.409;
      
      private static const const_952:int = 2;
      
      private static const const_1317:Array = [0,0,0];
      
      private static const const_1318:int = 3;
       
      
      private var var_609:AvatarVisualizationData = null;
      
      private var var_518:Map;
      
      private var var_495:Map;
      
      private var var_1206:int = 0;
      
      private var var_881:Boolean;
      
      private var _figure:String;
      
      private var var_906:String;
      
      private var var_1205:int = 0;
      
      private var var_607:BitmapDataAsset;
      
      private var var_927:BitmapDataAsset;
      
      private var var_1747:int = -1;
      
      private var var_1753:int = -1;
      
      private var var_1752:int = -1;
      
      private const const_954:int = 0;
      
      private const const_1735:int = 1;
      
      private const const_1718:int = 2;
      
      private const const_1717:int = 3;
      
      private const const_1316:int = 4;
      
      private var var_1716:int = -1;
      
      private var var_257:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1751:Boolean = false;
      
      private var var_1746:Boolean = false;
      
      private var var_1748:Boolean = false;
      
      private var var_1408:Boolean = false;
      
      private var var_585:Boolean = false;
      
      private var var_1406:int = 0;
      
      private var var_1407:int = 0;
      
      private var var_2405:int = 0;
      
      private var var_741:int = 0;
      
      private var var_740:int = 0;
      
      private var var_608:int = 0;
      
      private var var_1409:int = 0;
      
      private var var_1144:Boolean = false;
      
      private var var_1750:Boolean = false;
      
      private var var_1143:int = 0;
      
      private var var_742:int = 0;
      
      private var var_1749:Boolean = false;
      
      private var var_1142:int = 0;
      
      private var var_60:IAvatarImage = null;
      
      private var var_778:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_518 = new Map();
         this.var_495 = new Map();
         this.var_881 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_518 != null)
         {
            this.resetImages();
            this.var_518.dispose();
            this.var_495.dispose();
            this.var_518 = null;
         }
         this.var_609 = null;
         this.var_607 = null;
         this.var_927 = null;
         super.dispose();
         this.var_778 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_778;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_609 = param1 as AvatarVisualizationData;
         createSprites(this.const_1316);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_172)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_247) > 0 && param3);
            if(_loc5_ != this.var_1751)
            {
               this.var_1751 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_403) > 0;
            if(_loc5_ != this.var_1746)
            {
               this.var_1746 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_380) > 0;
            if(_loc5_ != this.var_1748)
            {
               this.var_1748 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_853) > 0 && param3);
            if(_loc5_ != this.var_1408)
            {
               this.var_1408 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1027) > 0;
            if(_loc5_ != this.var_585)
            {
               this.var_585 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_137);
            if(_loc6_ != this.var_1406)
            {
               this.var_1406 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_230);
            if(_loc7_ != this.var_257)
            {
               this.var_257 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_738);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1181);
            if(_loc6_ != this.var_1407)
            {
               this.var_1407 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_463);
            if(_loc6_ != this.var_741)
            {
               this.var_741 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_528);
            if(_loc6_ != this.var_740)
            {
               this.var_740 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_341);
            if(_loc6_ != this.var_608)
            {
               this.var_608 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_182);
            if(_loc6_ != this.var_1747)
            {
               this.var_1747 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_740 > 0 && param1.getNumber(RoomObjectVariableEnum.const_341) > 0)
            {
               if(this.var_608 != this.var_740)
               {
                  this.var_608 = this.var_740;
                  _loc4_ = true;
               }
            }
            else if(this.var_608 != 0)
            {
               this.var_608 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_619);
            if(_loc6_ != this.var_1143)
            {
               this.var_1143 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1195);
            if(_loc7_ != this.var_906)
            {
               this.var_906 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_188);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_172 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this._figure != param1)
         {
            this._figure = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_518)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_495)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_518.reset();
         this.var_495.reset();
         this.var_60 = null;
         _loc2_ = getSprite(this.const_954);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1408 = false;
         }
         if(this.var_257 == "sit" || this.var_257 == "lay")
         {
            this.var_1409 = param1 / 2;
         }
         else
         {
            this.var_1409 = 0;
         }
         this.var_1750 = false;
         this.var_1144 = false;
         if(this.var_257 == "lay")
         {
            this.var_1144 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1750 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_518.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_495.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_609.getAvatar(this._figure,param1,this.var_906,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_518.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_495.length >= const_1318)
                  {
                     this.var_495.remove(this.var_495.getKeys().shift());
                  }
                  this.var_495.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_453 != param1.getUpdateID() || this.var_1716 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1747;
            if(this.var_257 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1753 || param4)
            {
               _loc5_ = true;
               this.var_1753 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_60.setDirectionAngle(AvatarSetType.const_36,_loc6_);
            }
            if(_loc7_ != this.var_1752 || param4)
            {
               _loc5_ = true;
               this.var_1752 = _loc7_;
               if(this.var_1752 != this.var_1753)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_60.setDirectionAngle(AvatarSetType.const_52,_loc7_);
               }
            }
            var_453 = param1.getUpdateID();
            this.var_1716 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1735);
         this.var_607 = null;
         if(this.var_257 == "mv" || this.var_257 == "std")
         {
            _loc2_.visible = true;
            if(this.var_607 == null || param1 != var_98)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_607 = this.var_60.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_607 = this.var_60.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_607 != null)
               {
                  _loc2_.asset = this.var_607.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_607 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_927 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1718);
         if(this.var_585)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_927 = this.var_609.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_927 = this.var_609.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_257 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_257 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_927 != null)
            {
               _loc2_.asset = this.var_927.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1717);
         if(this.var_1143 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_609.getAvatarRendererAsset("number_" + this.var_1143 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_609.getAvatarRendererAsset("number_" + this.var_1143 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_257 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_257 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_742 = 1;
               this.var_1749 = true;
               this.var_1142 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_742 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1717);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1749)
         {
            ++this.var_1142;
            if(this.var_1142 < 10)
            {
               return false;
            }
            if(this.var_742 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1142 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_742 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_742 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_742 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_742 = 0;
               this.var_1749 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_609 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = this.var_741;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = this.updateModel(_loc5_,_loc6_,param3);
         if(this.animateNumberBubble(_loc6_))
         {
            increaseUpdateId();
         }
         if(_loc12_ || _loc6_ != var_98 || this.var_60 == null)
         {
            if(_loc6_ != var_98)
            {
               _loc8_ = true;
               this.validateActions(_loc6_);
            }
            if(_loc10_ != this.var_741)
            {
               _loc11_ = true;
            }
            if(_loc8_ || this.var_60 == null || _loc11_)
            {
               this.var_60 = this.getAvatarImage(_loc6_,this.var_741);
               if(this.var_60 == null)
               {
                  return;
               }
               _loc7_ = true;
               _loc15_ = getSprite(this.const_954);
               if(_loc15_ && this.var_60 && this.var_60.isPlaceholder())
               {
                  _loc15_.alpha = 150;
               }
               else if(_loc15_)
               {
                  _loc15_.alpha = 255;
               }
            }
            if(this.var_60 == null)
            {
               return;
            }
            this.updateShadow(_loc6_);
            if(_loc8_)
            {
               this.updateTypingBubble(_loc6_);
               this.updateNumberBubble(_loc6_);
            }
            _loc9_ = this.updateObject(_loc4_,param1,param3,true);
            this.updateActions(this.var_60);
            var_98 = _loc6_;
         }
         else
         {
            _loc9_ = this.updateObject(_loc4_,param1,param3);
         }
         var _loc13_:Boolean = _loc9_ || _loc12_ || _loc8_;
         var _loc14_:Boolean = (this.var_881 || this.var_1205 > 0) && param3;
         if(_loc13_)
         {
            this.var_1205 = const_952;
         }
         if(_loc13_ || _loc14_)
         {
            increaseUpdateId();
            --this.var_1205;
            --this.var_1206;
            if(!(this.var_1206 <= 0 || _loc8_ || _loc12_ || _loc7_))
            {
               return;
            }
            this.var_60.updateAnimationByFrames(1);
            this.var_1206 = const_952;
            _loc17_ = this.var_60.getCanvasOffsets();
            if(_loc17_ == null || _loc17_.length < 3)
            {
               _loc17_ = const_1317;
            }
            _loc16_ = getSprite(this.const_954);
            if(_loc16_ != null)
            {
               _loc20_ = this.var_60.getImage(AvatarSetType.const_36,false);
               if(_loc20_ != null)
               {
                  _loc16_.asset = _loc20_;
               }
               if(_loc16_.asset)
               {
                  _loc16_.offsetX = -1 * _loc6_ / 2 + _loc17_[0];
                  _loc16_.offsetY = -_loc16_.asset.height + _loc6_ / 4 + _loc17_[1] + this.var_1409;
               }
               if(this.var_1144)
               {
                  if(this.var_1750)
                  {
                     _loc16_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc16_.relativeDepth = const_606 + _loc17_[2];
                  }
               }
               else
               {
                  _loc16_.relativeDepth = const_605 + _loc17_[2];
               }
            }
            _loc16_ = getSprite(this.const_1718);
            if(_loc16_ != null && _loc16_.visible)
            {
               if(!this.var_1144)
               {
                  _loc16_.relativeDepth = const_605 - 0.01 + _loc17_[2];
               }
               else
               {
                  _loc16_.relativeDepth = const_606 - 0.01 + _loc17_[2];
               }
            }
            this.var_881 = this.var_60.isAnimating();
            _loc18_ = this.const_1316;
            for each(_loc19_ in this.var_60.getSprites())
            {
               if(_loc19_.id == const_953)
               {
                  _loc16_ = getSprite(this.const_954);
                  _loc21_ = this.var_60.getLayerData(_loc19_);
                  _loc22_ = _loc19_.getDirectionOffsetX(this.var_60.getDirection());
                  _loc23_ = _loc19_.getDirectionOffsetY(this.var_60.getDirection());
                  if(_loc21_ != null)
                  {
                     _loc22_ += _loc21_.dx;
                     _loc23_ += _loc21_.dy;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc22_ /= 2;
                     _loc23_ /= 2;
                  }
                  _loc16_.offsetX += _loc22_;
                  _loc16_.offsetY += _loc23_;
               }
               else
               {
                  _loc16_ = getSprite(_loc18_);
                  if(_loc16_ != null)
                  {
                     _loc16_.capturesMouse = false;
                     _loc16_.visible = true;
                     _loc24_ = this.var_60.getLayerData(_loc19_);
                     _loc25_ = 0;
                     _loc26_ = _loc19_.getDirectionOffsetX(this.var_60.getDirection());
                     _loc27_ = _loc19_.getDirectionOffsetY(this.var_60.getDirection());
                     _loc28_ = _loc19_.getDirectionOffsetZ(this.var_60.getDirection());
                     _loc29_ = 0;
                     if(_loc19_.hasDirections)
                     {
                        _loc29_ = this.var_60.getDirection();
                     }
                     if(_loc24_ != null)
                     {
                        _loc25_ = _loc24_.animationFrame;
                        _loc26_ += _loc24_.dx;
                        _loc27_ += _loc24_.dy;
                        _loc29_ += _loc24_.directionOffset;
                     }
                     if(_loc6_ < 48)
                     {
                        _loc26_ /= 2;
                        _loc27_ /= 2;
                     }
                     if(_loc29_ < 0)
                     {
                        _loc29_ += 8;
                     }
                     else if(_loc29_ > 7)
                     {
                        _loc29_ -= 8;
                     }
                     _loc30_ = this.var_60.getScale() + "_" + _loc19_.member + "_" + _loc29_ + "_" + _loc25_;
                     _loc31_ = this.var_60.getAsset(_loc30_);
                     if(_loc31_ == null)
                     {
                        continue;
                     }
                     _loc16_.asset = _loc31_.content as BitmapData;
                     _loc16_.offsetX = -_loc31_.offset.x - _loc6_ / 2 + _loc26_;
                     _loc16_.offsetY = -_loc31_.offset.y + _loc27_ + this.var_1409;
                     if(this.var_1144)
                     {
                        _loc16_.relativeDepth = const_606 - 0.001 * spriteCount * _loc28_;
                     }
                     else
                     {
                        _loc16_.relativeDepth = const_605 - 0.001 * spriteCount * _loc28_;
                     }
                     if(_loc19_.ink == 33)
                     {
                        _loc16_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc16_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc18_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_391,this.var_257,this._postureParameter);
         if(this.var_1406 > 0)
         {
            param1.appendAction(AvatarAction.const_324,AvatarAction.const_1650[this.var_1406]);
         }
         if(this.var_1407 > 0)
         {
            param1.appendAction(AvatarAction.const_806,this.var_1407);
         }
         if(this.var_2405 > 0)
         {
            param1.appendAction(AvatarAction.const_901,this.var_2405);
         }
         if(this.var_740 > 0)
         {
            param1.appendAction(AvatarAction.const_667,this.var_740);
         }
         if(this.var_608 > 0)
         {
            param1.appendAction(AvatarAction.const_695,this.var_608);
         }
         if(this.var_1751)
         {
            param1.appendAction(AvatarAction.const_303);
         }
         if(this.var_1748 || this.var_1408)
         {
            param1.appendAction(AvatarAction.const_424);
         }
         if(this.var_1746)
         {
            param1.appendAction(AvatarAction.const_250);
         }
         if(this.var_741 > 0)
         {
            param1.appendAction(AvatarAction.const_298,this.var_741);
         }
         param1.endActionAppends();
         this.var_881 = param1.isAnimating();
         var _loc2_:int = this.const_1316;
         for each(_loc3_ in this.var_60.getSprites())
         {
            if(_loc3_.id != const_953)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
