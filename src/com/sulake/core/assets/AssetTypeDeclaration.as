package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2191:String;
      
      private var var_2190:Class;
      
      private var var_2192:Class;
      
      private var var_1603:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2191 = param1;
         this.var_2190 = param2;
         this.var_2192 = param3;
         if(rest == null)
         {
            this.var_1603 = new Array();
         }
         else
         {
            this.var_1603 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2191;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2190;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2192;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1603;
      }
   }
}
