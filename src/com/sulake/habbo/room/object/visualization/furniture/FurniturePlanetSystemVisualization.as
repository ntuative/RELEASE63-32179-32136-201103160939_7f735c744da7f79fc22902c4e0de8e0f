package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.utils.Vector3d;
   
   public class FurniturePlanetSystemVisualization extends AnimatedFurnitureVisualization
   {
       
      
      private var var_262:Array;
      
      private var var_1811:Array;
      
      private var _offsetArray:Array;
      
      private var var_2556:Vector3d;
      
      public function FurniturePlanetSystemVisualization()
      {
         this._offsetArray = new Array();
         this.var_2556 = new Vector3d(0,0,0);
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_262 != null)
         {
            while(this.var_262.length > 0)
            {
               _loc1_ = this.var_262.shift();
               _loc1_.dispose();
            }
         }
         this.var_262 = null;
         this.var_1811 = null;
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.var_262 == null && spriteCount > 0)
         {
            if(!this.readDefinition())
            {
               return null;
            }
         }
         if(this.var_262 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < this.var_262.length)
            {
               _loc2_ = this.var_262[_loc3_];
               _loc2_.update(this._offsetArray,this.var_2556,param1);
               _loc3_++;
            }
            return super.updateAnimation(param1);
         }
         return null;
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(param3 < this._offsetArray.length)
         {
            return this._offsetArray[param3].x;
         }
         return super.getSpriteXOffset(param1,param2,param3);
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(param3 < this._offsetArray.length)
         {
            return this._offsetArray[param3].y;
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      override protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         if(param3 < this._offsetArray.length)
         {
            return this._offsetArray[param3].z;
         }
         return super.getSpriteZOffset(param1,param2,param3);
      }
      
      private function readDefinition() : Boolean
      {
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc1_:IRoomObject = object;
         if(_loc1_ == null)
         {
            return false;
         }
         var _loc2_:IRoomObjectModel = _loc1_.getModel();
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:String = _loc2_.getString(RoomObjectVariableEnum.const_1208);
         var _loc4_:XMLList = XMLList(_loc3_);
         var _loc5_:XMLList = _loc4_.children();
         var _loc6_:int = _loc5_.length();
         this.var_262 = new Array();
         this.var_1811 = new Array();
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc9_ = _loc5_[_loc8_];
            _loc7_ = getSprite(_loc8_);
            if(_loc7_ != null)
            {
               this.addPlanet(_loc9_.@name,_loc8_,_loc9_.@parent,Number(_loc9_.@radius),Number(_loc9_.@arcspeed),Number(_loc9_.@arcoffset),Number(_loc9_.@height));
            }
            _loc8_++;
         }
         return true;
      }
      
      private function addPlanet(param1:String, param2:int, param3:String, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         var _loc9_:* = null;
         if(this.var_262 == null)
         {
            return;
         }
         var _loc8_:FurniturePlanetSystemVisualizationPlanetObject = new FurniturePlanetSystemVisualizationPlanetObject(param1,param2,param4,param5,param6,param7);
         _loc9_ = this.getPlanet(param3);
         if(_loc9_ != null)
         {
            _loc9_.addChild(_loc8_);
         }
         else
         {
            this.var_262.push(_loc8_);
            this.var_1811.push(param1);
         }
      }
      
      private function getPlanet(param1:String) : FurniturePlanetSystemVisualizationPlanetObject
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_262.length)
         {
            _loc2_ = this.var_262[_loc3_];
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
            if(_loc2_.hasChild(param1))
            {
               return _loc2_.getChild(param1);
            }
            _loc3_++;
         }
         return null;
      }
   }
}
