package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1407:String = "pricing_model_unknown";
      
      public static const const_445:String = "pricing_model_single";
      
      public static const const_520:String = "pricing_model_multi";
      
      public static const const_539:String = "pricing_model_bundle";
      
      public static const const_1484:String = "price_type_none";
      
      public static const const_663:String = "price_type_credits";
      
      public static const const_1075:String = "price_type_activitypoints";
      
      public static const const_1114:String = "price_type_credits_and_activitypoints";
       
      
      private var var_708:String;
      
      private var var_1078:String;
      
      private var _offerId:int;
      
      private var var_1635:String;
      
      private var var_1077:int;
      
      private var var_1076:int;
      
      private var var_1595:int;
      
      private var var_432:ICatalogPage;
      
      private var var_707:IProductContainer;
      
      private var var_2287:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1635 = param1.localizationId;
         this.var_1077 = param1.priceInCredits;
         this.var_1076 = param1.priceInActivityPoints;
         this.var_1595 = param1.activityPointType;
         this.var_432 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_432;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1635;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1077;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1076;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1595;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_707;
      }
      
      public function get pricingModel() : String
      {
         return this.var_708;
      }
      
      public function get priceType() : String
      {
         return this.var_1078;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2287;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2287 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1635 = "";
         this.var_1077 = 0;
         this.var_1076 = 0;
         this.var_1595 = 0;
         this.var_432 = null;
         if(this.var_707 != null)
         {
            this.var_707.dispose();
            this.var_707 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_708)
         {
            case const_445:
               this.var_707 = new SingleProductContainer(this,param1);
               break;
            case const_520:
               this.var_707 = new MultiProductContainer(this,param1);
               break;
            case const_539:
               this.var_707 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_708);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_708 = const_445;
            }
            else
            {
               this.var_708 = const_520;
            }
         }
         else if(param1.length > 1)
         {
            this.var_708 = const_539;
         }
         else
         {
            this.var_708 = const_1407;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1077 > 0 && this.var_1076 > 0)
         {
            this.var_1078 = const_1114;
         }
         else if(this.var_1077 > 0)
         {
            this.var_1078 = const_663;
         }
         else if(this.var_1076 > 0)
         {
            this.var_1078 = const_1075;
         }
         else
         {
            this.var_1078 = const_1484;
         }
      }
   }
}
