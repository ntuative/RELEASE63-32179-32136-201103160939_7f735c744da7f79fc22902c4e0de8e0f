package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_950:IAssetLoader;
      
      private var var_1851:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1851 = param1;
         this.var_950 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1851;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_950;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_950 != null)
            {
               if(!this.var_950.disposed)
               {
                  this.var_950.dispose();
                  this.var_950 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
