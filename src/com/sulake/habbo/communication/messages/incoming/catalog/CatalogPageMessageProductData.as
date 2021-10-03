package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_85:String = "i";
      
      public static const const_92:String = "s";
      
      public static const const_239:String = "e";
       
      
      private var var_1805:String;
      
      private var var_2342:int;
      
      private var var_1435:String;
      
      private var var_1436:int;
      
      private var var_1806:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1805 = param1.readString();
         this.var_2342 = param1.readInteger();
         this.var_1435 = param1.readString();
         this.var_1436 = param1.readInteger();
         this.var_1806 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1805;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2342;
      }
      
      public function get extraParam() : String
      {
         return this.var_1435;
      }
      
      public function get productCount() : int
      {
         return this.var_1436;
      }
      
      public function get expiration() : int
      {
         return this.var_1806;
      }
   }
}
