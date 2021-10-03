package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_181:Sound = null;
      
      private var var_1579:AssetTypeDeclaration;
      
      private var var_1020:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1579 = param1;
         this.var_1020 = param2;
      }
      
      public function get url() : String
      {
         return this.var_1020;
      }
      
      public function get content() : Object
      {
         return this.var_181 as Object;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1579;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_181 = null;
            this.var_1579 = null;
            this.var_1020 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is Sound)
         {
            if(this.var_181)
            {
               this.var_181.close();
            }
            this.var_181 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(this.var_181)
            {
               this.var_181.close();
            }
            this.var_181 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(this.var_181)
            {
               this.var_181.close();
            }
            this.var_181 = SoundAsset(param1).var_181;
            return;
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            this.var_181 = SoundAsset(param1).var_181;
         }
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
