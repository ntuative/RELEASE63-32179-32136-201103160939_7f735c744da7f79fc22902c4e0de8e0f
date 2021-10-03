package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_744:TileHeightMap = null;
      
      private var var_1147:LegacyWallGeometry = null;
      
      private var var_1146:RoomCamera = null;
      
      private var var_743:SelectedRoomObjectData = null;
      
      private var var_745:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_499:Map;
      
      private var var_498:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_499 = new Map();
         this.var_498 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1147 = new LegacyWallGeometry();
         this.var_1146 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_744;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_744 != null)
         {
            this.var_744.dispose();
         }
         this.var_744 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1147;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1146;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_743;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_743 != null)
         {
            this.var_743.dispose();
         }
         this.var_743 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_745;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_745 != null)
         {
            this.var_745.dispose();
         }
         this.var_745 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_744 != null)
         {
            this.var_744.dispose();
            this.var_744 = null;
         }
         if(this.var_1147 != null)
         {
            this.var_1147.dispose();
            this.var_1147 = null;
         }
         if(this.var_1146 != null)
         {
            this.var_1146.dispose();
            this.var_1146 = null;
         }
         if(this.var_743 != null)
         {
            this.var_743.dispose();
            this.var_743 = null;
         }
         if(this.var_745 != null)
         {
            this.var_745.dispose();
            this.var_745 = null;
         }
         if(this.var_499 != null)
         {
            this.var_499.dispose();
            this.var_499 = null;
         }
         if(this.var_498 != null)
         {
            this.var_498.dispose();
            this.var_498 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_499.remove(param1.id);
            this.var_499.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_499.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_499.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_499.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_498.remove(param1.id);
            this.var_498.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_498.length > 0)
         {
            return this.getWallItemDataWithId(this.var_498.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_498.remove(param1);
      }
   }
}
