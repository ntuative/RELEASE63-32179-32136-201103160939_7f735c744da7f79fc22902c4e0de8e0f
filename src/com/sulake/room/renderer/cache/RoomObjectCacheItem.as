package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_513:RoomObjectLocationCacheItem = null;
      
      private var var_198:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_513 = new RoomObjectLocationCacheItem(param1);
         this.var_198 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_513;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_198;
      }
      
      public function dispose() : void
      {
         if(this.var_513 != null)
         {
            this.var_513.dispose();
            this.var_513 = null;
         }
         if(this.var_198 != null)
         {
            this.var_198.dispose();
            this.var_198 = null;
         }
      }
   }
}
