package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class SpacesCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
      
      private static const const_206:String = "floor";
      
      private static const const_207:String = "wallpaper";
      
      private static const const_99:String = "landscape";
       
      
      private var var_177:XML;
      
      private var var_1306:Array;
      
      private var var_850:Array;
      
      private var var_401:int = 0;
      
      private var var_400:int = 0;
      
      private var var_849:int = 0;
      
      private var var_1564:String = "PetDataManager";
      
      private var var_1305:Array;
      
      private var _activeFloorPatterns:Array;
      
      private var var_398:int = 0;
      
      private var var_468:int = 0;
      
      private var var_852:int = 0;
      
      private var _floorType:String = "PetDataManager";
      
      private var var_1307:Array;
      
      private var var_851:Array;
      
      private var var_399:int = 0;
      
      private var var_469:int = 0;
      
      private var var_853:int = 0;
      
      private var var_1567:String = "1.1";
      
      private var var_1566:int = -1;
      
      private var var_1565:int = -1;
      
      private var var_332:BitmapData = null;
      
      private var var_333:BitmapData = null;
      
      public function SpacesCatalogWidget(param1:IWindowContainer)
      {
         this.var_1306 = [];
         this.var_850 = [];
         this.var_1305 = [];
         this._activeFloorPatterns = [];
         this.var_1307 = [];
         this.var_851 = [];
         super(param1);
      }
      
      override public function dispose() : void
      {
         if(this.var_332 != null)
         {
            this.var_332.dispose();
            this.var_332 = null;
         }
         if(this.var_333 != null)
         {
            this.var_333.dispose();
            this.var_333 = null;
         }
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("configuration_catalog_spaces") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_177 = _loc1_.content as XML;
            for each(_loc2_ in page.offers)
            {
               _loc4_ = _loc2_.productContainer.firstProduct;
               _loc5_ = _loc2_.localizationId;
               _loc6_ = _loc5_.split(" ")[0];
               _loc7_ = _loc5_.split(" ")[1];
               _loc8_ = false;
               switch(_loc4_.furnitureData.name)
               {
                  case "floor":
                     for each(_loc9_ in this.var_177.floors.pattern)
                     {
                        this._activeFloorPatterns.push(String(_loc9_.@id));
                        this.var_1305.push(_loc2_);
                     }
                     break;
                  case "wallpaper":
                     for each(_loc10_ in this.var_177.walls.pattern)
                     {
                        if(_loc10_.@id == _loc7_)
                        {
                           this.var_850.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        this.var_1306.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find wallpaper pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  case "landscape":
                     for each(_loc11_ in this.var_177.landscapes.pattern)
                     {
                        if(_loc11_.@id == _loc7_)
                        {
                           this.var_851.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        this.var_1307.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find landscape pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  default:
                     Logger.log("[SpacesCatalogWidget] : " + _loc4_.furnitureData.name);
                     break;
               }
            }
            _loc3_ = 0;
            while(_loc3_ < _window.numChildren)
            {
               _loc12_ = _window.getChildAt(_loc3_);
               if(_loc12_ is IButtonWindow)
               {
                  _loc12_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
               }
               _loc3_++;
            }
            this.changePattern(const_207,0);
            this.changePattern(const_99,0);
            this.changePattern(const_206,0);
            this.updateConfiguration();
            this.retrieveSpacesPreview();
            return true;
         }
         return false;
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         switch(_loc2_.name)
         {
            case "ctlg_wall_pattern_prev":
               this.changePattern(const_207,-1);
               break;
            case "ctlg_wall_pattern_next":
               this.changePattern(const_207,1);
               break;
            case "ctlg_wall_color_prev":
               this.changeColor(const_207,-1);
               break;
            case "ctlg_wall_color_next":
               this.changeColor(const_207,1);
               break;
            case "ctlg_buy_wall":
               _loc3_ = this.var_1306[this.var_401];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this.var_1564);
               }
               break;
            case "ctlg_floor_pattern_prev":
               this.changePattern(const_206,-1);
               break;
            case "ctlg_floor_pattern_next":
               this.changePattern(const_206,1);
               break;
            case "ctlg_floor_color_prev":
               this.changeColor(const_206,-1);
               break;
            case "ctlg_floor_color_next":
               this.changeColor(const_206,1);
               break;
            case "ctlg_buy_floor":
               _loc3_ = this.var_1305[this.var_398];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this._floorType);
               }
               break;
            case "ctlg_landscape_pattern_next":
               this.changePattern(const_99,-1);
               break;
            case "ctlg_landscape_pattern_prev":
               this.changePattern(const_99,1);
               break;
            case "ctlg_landscape_color_prev":
               this.changeColor(const_99,-1);
               break;
            case "ctlg_landscape_color_next":
               this.changeColor(const_99,1);
               break;
            case "ctlg_buy_landscape":
               _loc3_ = this.var_1307[this.var_399];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this.var_1567);
               }
               break;
            default:
               Logger.log("Spaces, unknown button: " + _loc2_.name);
         }
         this.updateConfiguration();
         this.retrieveSpacesPreview();
      }
      
      private function updateConfiguration() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc2_:String = this.var_850[this.var_401];
         for each(_loc1_ in this.var_177.walls.pattern)
         {
            if(_loc1_.@id == _loc2_)
            {
               if(this.var_400 >= 0)
               {
                  _loc9_ = _loc1_.children()[this.var_400];
                  if(_loc9_ != null)
                  {
                     this.var_1564 = _loc9_.@id;
                  }
               }
            }
         }
         _loc3_ = this.var_1306[this.var_401];
         _loc4_ = (page.viewer.catalog as HabboCatalog).localization;
         if(_loc3_ != null)
         {
            _loc10_ = _window.findChildByName("ctlg_wall_price") as ITextWindow;
            if(_loc10_ != null)
            {
               _loc10_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc3_.priceInCredits));
            }
         }
         var _loc5_:String = this._activeFloorPatterns[this.var_398];
         for each(_loc1_ in this.var_177.floors.pattern)
         {
            if(_loc1_.@id == _loc5_)
            {
               _loc11_ = _loc1_.children()[this.var_468];
               if(_loc11_ != null)
               {
                  this._floorType = _loc11_.@id;
               }
            }
         }
         _loc6_ = this.var_1305[this.var_398];
         if(_loc6_ != null)
         {
            _loc12_ = _window.findChildByName("ctlg_floor_price") as ITextWindow;
            if(_loc12_ != null)
            {
               _loc12_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc6_.priceInCredits));
            }
         }
         var _loc7_:String = this.var_851[this.var_399];
         for each(_loc1_ in this.var_177.landscapes.pattern)
         {
            if(_loc1_.@id == _loc7_)
            {
               _loc13_ = _loc1_.children()[this.var_469];
               if(_loc13_ != null)
               {
                  this.var_1567 = _loc13_.@id;
               }
            }
         }
         _loc8_ = this.var_1307[this.var_399];
         if(_loc8_ != null)
         {
            _loc14_ = _window.findChildByName("ctlg_landscape_price") as ITextWindow;
            if(_loc14_ != null)
            {
               _loc14_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc8_.priceInCredits));
            }
         }
      }
      
      private function changePattern(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         switch(param1)
         {
            case const_207:
               this.var_401 += param2;
               if(this.var_401 < 0)
               {
                  this.var_401 = this.var_850.length - 1;
               }
               if(this.var_401 == this.var_850.length)
               {
                  this.var_401 = 0;
               }
               this.var_400 = 0;
               this.var_849 = 0;
               _loc5_ = this.var_850[this.var_401];
               for each(_loc8_ in this.var_177.walls.pattern)
               {
                  if(_loc8_.@id == _loc5_)
                  {
                     this.var_849 = _loc8_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_wall_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_wall_color_next") as IButtonWindow;
               if(this.var_849 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_206:
               this.var_398 += param2;
               if(this.var_398 < 0)
               {
                  this.var_398 = this._activeFloorPatterns.length - 1;
               }
               if(this.var_398 >= this._activeFloorPatterns.length)
               {
                  this.var_398 = 0;
               }
               this.var_468 = 0;
               this.var_852 = 0;
               _loc6_ = this._activeFloorPatterns[this.var_398];
               for each(_loc9_ in this.var_177.floors.pattern)
               {
                  if(_loc9_.@id == _loc6_)
                  {
                     this.var_852 = _loc9_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_floor_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_floor_color_next") as IButtonWindow;
               if(this.var_852 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_99:
               this.var_399 += param2;
               if(this.var_399 < 0)
               {
                  this.var_399 = this.var_851.length - 1;
               }
               if(this.var_399 >= this.var_851.length)
               {
                  this.var_399 = 0;
               }
               this.var_469 = 0;
               this.var_853 = 0;
               _loc7_ = this.var_851[this.var_399];
               for each(_loc10_ in this.var_177.landscapes.pattern)
               {
                  if(_loc10_.@id == _loc7_)
                  {
                     this.var_853 = _loc10_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_landscape_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_landscape_color_next") as IButtonWindow;
               if(this.var_853 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
         }
      }
      
      private function changeColor(param1:String, param2:int) : void
      {
         switch(param1)
         {
            case const_207:
               this.var_400 += param2;
               if(this.var_400 < 0)
               {
                  if(this.var_849 > 0)
                  {
                     this.var_400 = this.var_849 - 1;
                  }
                  else
                  {
                     this.var_400 = 0;
                  }
               }
               if(this.var_400 >= this.var_849)
               {
                  this.var_400 = 0;
               }
               break;
            case const_206:
               this.var_468 += param2;
               if(this.var_468 < 0)
               {
                  if(this.var_852 > 0)
                  {
                     this.var_468 = this.var_852 - 1;
                  }
                  else
                  {
                     this.var_468 = 0;
                  }
               }
               if(this.var_468 >= this.var_852)
               {
                  this.var_468 = 0;
               }
               break;
            case const_99:
               this.var_469 += param2;
               if(this.var_469 < 0)
               {
                  if(this.var_853 > 0)
                  {
                     this.var_469 = this.var_853 - 1;
                  }
                  else
                  {
                     this.var_469 = 0;
                  }
               }
               if(this.var_469 >= this.var_853)
               {
                  this.var_469 = 0;
               }
         }
      }
      
      private function retrieveSpacesPreview() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:ImageResult = page.viewer.roomEngine.getRoomImage(this._floorType,this.var_1564,this.var_1567,64,this,"window_romantic_wide");
         var _loc3_:ImageResult = page.viewer.roomEngine.getGenericRoomObjectImage("window_romantic_wide","",new Vector3d(180,0,0),64,this);
         if(_loc2_ != null && _loc3_ != null)
         {
            this.var_1566 = _loc2_.id;
            this.var_1565 = _loc3_.id;
            _loc4_ = _loc2_.data as BitmapData;
            _loc5_ = _loc3_.data as BitmapData;
            if(this.var_332 != null)
            {
               this.var_332.dispose();
            }
            if(this.var_333 != null)
            {
               this.var_333.dispose();
            }
            this.var_332 = _loc4_;
            this.var_333 = _loc5_;
            this.setRoomImage(_loc4_,_loc5_);
         }
      }
      
      private function setRoomImage(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 != null && param2 != null && true)
         {
            _loc3_ = new Point(param1.width / 2 + 4 + 19,param1.height / 2 - param2.height / 2 - 24 + 10);
            _loc4_ = new BitmapData(param1.width,param1.height,param1.transparent);
            _loc4_.copyPixels(param1,param1.rect,new Point(0,0),null,null,true);
            _loc4_.copyPixels(param2,param2.rect,_loc3_,null,null,true);
            _loc5_ = window.getChildByName("catalog_floor_preview_example") as IBitmapWrapperWindow;
            if(_loc5_ != null)
            {
               if(_loc5_.bitmap == null)
               {
                  _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
               }
               _loc5_.bitmap.fillRect(_loc5_.bitmap.rect,16777215);
               _loc6_ = (_loc5_.width - _loc4_.width) / 2;
               _loc7_ = (_loc5_.height - _loc4_.height) / 2;
               _loc5_.bitmap.copyPixels(_loc4_,_loc4_.rect,new Point(_loc6_,_loc7_),null,null,true);
               _loc5_.invalidate();
            }
            _loc4_.dispose();
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         switch(param1)
         {
            case this.var_1566:
               this.var_1566 = 0;
               if(this.var_332 != null)
               {
                  this.var_332.dispose();
               }
               this.var_332 = param2;
               break;
            case this.var_1565:
               this.var_1565 = 0;
               if(this.var_333 != null)
               {
                  this.var_333.dispose();
               }
               this.var_333 = param2;
         }
         if(this.var_332 != null && this.var_333 != null)
         {
            this.setRoomImage(this.var_332,this.var_333);
         }
      }
   }
}
