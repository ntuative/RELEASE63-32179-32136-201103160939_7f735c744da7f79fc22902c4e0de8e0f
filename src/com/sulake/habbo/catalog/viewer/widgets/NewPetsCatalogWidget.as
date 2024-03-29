package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetMultiColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetBreedsEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.SellablePetBreedData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.PetColorResult;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class NewPetsCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
      
      private static const const_1303:int = 18;
       
      
      private var _offers:Map;
      
      private var _name:String;
      
      private var var_488:int = -1;
      
      private var var_350:int = -1;
      
      private var var_2345:String;
      
      private var var_896:Boolean = false;
      
      private var var_778:Boolean = false;
      
      private var var_203:Array = null;
      
      public function NewPetsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         if(this.var_778)
         {
            return;
         }
         this.var_896 = false;
         if(this._offers != null)
         {
            this._offers.dispose();
            this._offers = null;
         }
         this.var_203 = null;
         super.dispose();
         this.var_778 = true;
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         this.var_896 = false;
         var _loc1_:ITextFieldWindow = window.findChildByName("name_input_text") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return false;
         }
         _loc1_.addEventListener(WindowEvent.const_104,this.onTextWindowEvent);
         this._offers = new Map();
         if(page.offers.length == 0)
         {
            return false;
         }
         var _loc2_:Offer = page.offers[0];
         this.var_488 = this.getPetTypeIndexFromProduct(_loc2_.localizationId);
         if(this.var_488 < 8)
         {
            return false;
         }
         this.var_2345 = _loc2_.localizationId;
         this.updateAvailableBreeds(_loc2_.localizationId);
         if(this.var_203 != null && this.var_203.length > 0)
         {
            this.var_350 = this.var_203[0];
         }
         else
         {
            this.var_350 = -1;
         }
         this._offers.add(this.var_488,_loc2_);
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.CWE_COLOUR_INDEX,this.onColourIndex);
         events.addEventListener(WidgetEvent.const_658,this.onApproveNameResult);
         events.addEventListener(WidgetEvent.CWE_WIDGETS_INITIALIZED,this.onWidgetsInitialized);
         events.addEventListener(WidgetEvent.CWE_SELLABLE_PET_BREEDS,this.onSellablePetBreeds);
         return true;
      }
      
      private function onWidgetsInitialized(param1:CatalogWidgetsInitializedEvent = null) : void
      {
         if(this.var_778)
         {
            return;
         }
         events.dispatchEvent(new CatalogWidgetPurchaseOverrideEvent(this.onPurchase));
         var _loc2_:Offer = this._offers.getWithIndex(0);
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
         this.initializeBreedSelection();
      }
      
      private function initializeBreedSelection() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(this.var_203 != null)
         {
            _loc1_ = [];
            _loc2_ = 0;
            while(_loc2_ < const_1303 && _loc2_ < this.var_203.length)
            {
               _loc3_ = (page.viewer.catalog as HabboCatalog).roomEngine.getPetColor(this.var_488,this.var_203[_loc2_]);
               if(_loc3_ != null)
               {
                  if(_loc3_.primaryColor == _loc3_.secondaryColor)
                  {
                     _loc1_.push([_loc3_.primaryColor]);
                  }
                  else
                  {
                     _loc1_.push([_loc3_.primaryColor,_loc3_.secondaryColor]);
                  }
               }
               _loc2_++;
            }
            events.dispatchEvent(new CatalogWidgetMultiColoursEvent(_loc1_,"ctlg_clr_27x22_1","ctlg_clr_27x22_2","ctlg_clr_27x22_3"));
         }
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = param1.index;
         this.selectedBreed(_loc2_);
      }
      
      private function selectedBreed(param1:int) : void
      {
         if(this.var_203 != null && this.var_203.length > 0)
         {
            if(param1 < 0 || param1 > this.var_203.length)
            {
               param1 = 0;
            }
            this.var_350 = this.var_203[param1];
            this.updateImage();
         }
      }
      
      private function getPetLocalization() : String
      {
         var _loc1_:* = null;
         if(this.var_350 < 0)
         {
            return "";
         }
         if(page != null && false)
         {
            _loc1_ = page.viewer.catalog;
            if(_loc1_ != null && _loc1_.localization != null)
            {
               return _loc1_.localization.getKey(this.getRaceLocalizationKey(this.var_488,this.var_350),this.getRaceLocalizationKey(this.var_488,this.var_350));
            }
         }
         return this.getRaceLocalizationKey(this.var_488,this.var_350);
      }
      
      private function onPurchase(param1:WindowEvent) : void
      {
         if(this.var_896)
         {
            Logger.log("* Cannot buy a pet, pending previous name approval.");
         }
         if(this.getPurchaseParameters() == "")
         {
            return;
         }
         this.var_896 = true;
         (page.viewer.catalog as HabboCatalog).approveName(this._name,1);
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this._name = _loc2_.text;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.updateImage();
      }
      
      private function onApproveNameResult(param1:CatalogWidgetApproveNameResultEvent) : void
      {
         var event:CatalogWidgetApproveNameResultEvent = param1;
         if(event == null || !this.var_896)
         {
            return;
         }
         this.var_896 = false;
         switch(event.result)
         {
            case 1:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.long}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 2:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.short}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 3:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.chars}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 4:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.bobba}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            default:
               var p:String = this.getPurchaseParameters();
               if(p == "")
               {
                  Logger.log("* Not enough information to buy a pet!");
                  return;
               }
               Logger.log("* Will buy pet as " + p);
               (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this._offers.getWithIndex(0),page.pageId,p);
               return;
         }
      }
      
      private function onSellablePetBreeds(param1:CatalogWidgetSellablePetBreedsEvent) : void
      {
         if(param1.productCode == this.var_2345)
         {
            this.var_203 = this.parseSellableBreeds(param1.sellableBreeds);
            this.initializeBreedSelection();
            this.selectedBreed(0);
            this.updateImage();
         }
      }
      
      private function parseSellableBreeds(param1:Array) : Array
      {
         var _loc3_:* = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Array = new Array();
         for each(_loc3_ in param1)
         {
            if(_loc3_.type == this.var_488 && _loc3_.sellable)
            {
               _loc2_.push(_loc3_.breed);
            }
         }
         return _loc2_;
      }
      
      private function updateImage() : void
      {
         var _loc1_:Offer = this._offers.getWithIndex(0);
         if(_loc1_ == null || this.var_350 < 0)
         {
            return;
         }
         var _loc2_:int = this.var_488;
         var _loc3_:int = this.var_350;
         var _loc4_:ImageResult = (page.viewer.catalog as HabboCatalog).roomEngine.getPetImage(_loc2_,_loc3_,new Vector3d(135,0,0),64,this);
         if(_loc4_ != null)
         {
            this.setPreviewImage(_loc4_.data,true);
         }
         var _loc5_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc6_:ITextWindow = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc5_.registerParameter("catalog.purchase.price.credits","credits",String(_loc1_.priceInCredits));
            _loc6_.caption = "${catalog.purchase.price.credits}";
         }
         var _loc7_:ITextWindow = _window.findChildByName("pet_breed_text") as ITextWindow;
         if(_loc7_)
         {
            _loc7_.caption = this.getPetLocalization();
         }
      }
      
      private function getPurchaseParameters() : String
      {
         if(this._name == null || this._name.length == 0)
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.empty}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return "";
         }
         if(this.var_350 < 0)
         {
            return "";
         }
         var color:uint = 16777215;
         var p:String = this._name + String.fromCharCode(10) + this.var_350 + String.fromCharCode(10) + this.addZeroPadding(color.toString(16).toUpperCase(),6);
         return p;
      }
      
      private function setPreviewImage(param1:BitmapData, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(true)
         {
            if(param1 == null)
            {
               param1 = new BitmapData(1,1);
               param2 = true;
            }
            _loc3_ = window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc4_ = 2;
               _loc5_ = new BitmapData(param1.width * _loc4_,param1.height * _loc4_,true,16777215);
               _loc5_.draw(param1,new Matrix(_loc4_,0,0,_loc4_));
               _loc6_ = new Point((_loc3_.width - _loc5_.width) / 2,(_loc3_.height - _loc5_.height) / 2);
               _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,_loc6_,null,null,true);
               _loc3_.invalidate();
               _loc5_.dispose();
            }
         }
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function getPetTypeIndexFromProduct(param1:String) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         var _loc2_:int = 0;
         _loc2_ = param1.length - 1;
         while(_loc2_ >= 0)
         {
            if(isNaN(parseInt(param1.charAt(_loc2_))))
            {
               break;
            }
            _loc2_--;
         }
         if(_loc2_ > 0)
         {
            return int(param1.substring(_loc2_ + 1));
         }
         return -1;
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.breed." + param1 + "." + param2;
      }
      
      private function addZeroPadding(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      private function updateAvailableBreeds(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.var_203 == null)
         {
            _loc2_ = (page.viewer.catalog as HabboCatalog).getSellablePetBreeds(param1);
            this.var_203 = this.parseSellableBreeds(_loc2_);
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         this.setPreviewImage(param2,true);
         this.onWidgetsInitialized();
      }
   }
}
