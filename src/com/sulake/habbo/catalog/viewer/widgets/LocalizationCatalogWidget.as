package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class LocalizationCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_869:Dictionary;
      
      public function LocalizationCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         this.var_869 = new Dictionary();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         this.initLocalizables();
         this.initStaticImages();
         this.initLinks();
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onProductSelected);
         return true;
      }
      
      private function onProductSelected(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
      }
      
      private function initLinks() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(false)
         {
            for each(_loc1_ in page.links)
            {
               _loc2_ = _window.findChildByName(_loc1_);
               if(_loc2_ != null)
               {
                  _loc2_.setParamFlag(WindowParam.const_30);
                  _loc2_.mouseThreshold = 0;
                  _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClickLink);
               }
            }
         }
      }
      
      private function onClickLink(param1:WindowMouseEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc3_:IHabboConfigurationManager = (page.viewer.catalog as HabboCatalog).configuration;
         var _loc4_:String = IWindow(param1.target).name;
         var _loc5_:String = "";
         switch(page.layoutCode)
         {
            case "frontpage3":
               switch(_loc4_)
               {
                  case "ctlg_txt3":
                     if(IWindow(param1.target).caption != "")
                     {
                        _loc5_ = page.localization.getTextElementContent(6);
                        page.viewer.catalog.openCatalogPage(_loc5_);
                     }
                     break;
                  case "ctlg_txt7":
                     if(IWindow(param1.target).caption != "")
                     {
                        _loc5_ = page.localization.getTextElementContent(10);
                        if(_loc5_.indexOf("http") >= 0)
                        {
                           this.openExternalLink(_loc5_);
                        }
                        else if(_loc5_ == "magic.credits")
                        {
                           if(false && "true" == _loc3_.getKey("client.credits.embed.enabled"))
                           {
                              ExternalInterface.call("FlashExternalInterface.openHabblet","credits");
                           }
                           else
                           {
                              _loc5_ = _loc3_.getKey("link.format.credits","/credits");
                              this.openExternalLink(_loc5_);
                           }
                        }
                        else
                        {
                           page.viewer.catalog.openCatalogPage(_loc5_);
                        }
                     }
               }
               break;
            case "info_pixels":
               switch(_loc4_)
               {
                  case "ctlg_text_5":
                     page.viewer.catalog.openInventoryCategory(InventoryCategory.const_364);
                     break;
                  case "ctlg_text_7":
                     _loc5_ = page.localization.getTextElementContent(7);
                     page.viewer.catalog.openCatalogPage(_loc5_);
               }
               break;
            case "info_credits":
               switch(_loc4_)
               {
                  case "ctlg_text_5":
                     if(false && "true" == _loc3_.getKey("client.credits.embed.enabled"))
                     {
                        ExternalInterface.call("FlashExternalInterface.openHabblet","credits");
                     }
                     else
                     {
                        _loc5_ = _loc3_.getKey("link.format.credits","/credits");
                        this.openExternalLink(_loc5_);
                     }
                     break;
                  case "ctlg_text_7":
                     _loc5_ = page.localization.getTextElementContent(7);
                     page.viewer.catalog.openCatalogPage(_loc5_);
               }
               break;
            case "collectibles":
               switch(_loc4_)
               {
                  case "ctlg_collectibles_link":
                     _loc5_ = _loc3_.getKey("link.format.collectibles","/credits/collectibles");
                     this.openExternalLink(_loc5_);
               }
               break;
            case "club1":
               switch(_loc4_)
               {
                  case "ctlg_text_5":
                     page.viewer.catalog.openCatalogPage(CatalogPageName.const_176,true);
               }
               break;
            case "club_buy":
               switch(_loc4_)
               {
                  case "club_link":
                     _loc5_ = _loc3_.getKey("link.format.club","/credits/collectibles");
                     this.openExternalLink(_loc5_);
               }
               break;
            default:
               Logger.log("[LocalizationCatalogWidget] Unhandled link clicked" + [page.layoutCode,_loc4_]);
         }
      }
      
      private function openExternalLink(param1:String) : void
      {
         var _loc2_:IHabboConfigurationManager = (page.viewer.catalog as HabboCatalog).configuration;
         if(param1 != "")
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,this.onExternalLink);
            HabboWebTools.navigateToURL(param1,"habboMain");
         }
      }
      
      private function onExternalLink(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      private function initStaticImages() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < _window.numChildren)
         {
            _loc2_ = _window.getChildAt(_loc1_);
            if(_loc2_ is IBitmapWrapperWindow)
            {
               if(_loc2_.tags.indexOf("STATIC_IMAGE") > -1)
               {
                  _loc3_ = _loc2_.name;
                  _loc4_ = _loc2_.name;
                  this.var_869[_loc4_] = _loc3_;
                  if(page.viewer.catalog.assets.hasAsset(_loc4_))
                  {
                     this.setElementImage(_loc3_,_loc4_);
                  }
                  else
                  {
                     this.retrieveCatalogImage(_loc4_);
                  }
               }
            }
            _loc1_++;
         }
      }
      
      protected function initLocalizables() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc1_:int = 0;
         this.var_869 = new Dictionary();
         _loc1_ = 0;
         while(_loc1_ < page.localization.textCount)
         {
            _loc2_ = page.localization.getTextElementName(_loc1_,page.layoutCode);
            _loc3_ = page.localization.getTextElementContent(_loc1_);
            if(_window != null)
            {
               _loc4_ = _window.findChildByName(_loc2_);
            }
            if(_loc4_ != null)
            {
               _loc4_.caption = _loc3_;
            }
            else
            {
               Logger.log("[LocalizationCatalogWidget] Could not place text in layout:  element: " + _loc2_ + ", content: " + _loc3_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < page.localization.imageCount)
         {
            _loc2_ = page.localization.getImageElementName(_loc1_,page.layoutCode);
            _loc3_ = page.localization.getImageElementContent(_loc1_);
            if(_loc2_ != "")
            {
               if(_loc3_ != "")
               {
                  _loc6_ = _loc3_;
                  this.var_869[_loc6_] = _loc2_;
                  if(page.viewer.catalog.assets.hasAsset(_loc6_))
                  {
                     this.setElementImage(_loc2_,_loc6_);
                  }
                  else
                  {
                     this.retrieveCatalogImage(_loc6_);
                  }
               }
            }
            _loc1_++;
         }
         if(page.localization.hasColors(page.layoutCode))
         {
            _loc7_ = page.localization.getColorSources(page.layoutCode);
            _loc8_ = page.localization.getColorTargets(page.layoutCode);
            _loc1_ = 0;
            while(_loc1_ < _loc7_.length)
            {
               _loc9_ = uint(page.localization.getColorUintFromText(_loc7_[_loc1_]));
               if(_loc8_[_loc1_] as Array != null)
               {
                  _loc10_ = 0;
                  while(_loc10_ < (_loc8_[_loc1_] as Array).length)
                  {
                     if(_window != null)
                     {
                        _loc11_ = _window.findChildByName(_loc8_[_loc1_][_loc10_]) as ITextWindow;
                     }
                     if(_loc11_ != null)
                     {
                        _loc11_.textColor = _loc9_;
                     }
                     _loc10_++;
                  }
               }
               _loc1_++;
            }
         }
      }
      
      private function setElementImage(param1:String, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         Logger.log("[LocalizationCatalogWidget] Set Element Image: " + [param1,param2]);
         if(_window == null)
         {
            Logger.log("[LocalizationCatalogWidget] Window is null! " + [param1,param2]);
            return;
         }
         if(false)
         {
            Logger.log("[LocalizationCatalogWidget] Window is disposed! " + [param1,param2,_window.name]);
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            _loc4_ = page.viewer.catalog.assets.getAssetByName(param2) as BitmapDataAsset;
            if(_loc4_ == null)
            {
               Logger.log("[LocalizationCatalogWidget] Asset does not exist: " + [param1,param2]);
               return;
            }
            _loc5_ = _loc4_.content as BitmapData;
            if(_loc3_.bitmap == null)
            {
               _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
            }
            _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
            _loc6_ = (_loc3_.width - _loc5_.width) / 2;
            _loc7_ = (_loc3_.height - _loc5_.height) / 2;
            _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(_loc6_,_loc7_),null,null,true);
         }
         else
         {
            Logger.log("[LocalizationCatalogWidget] Could not find element: " + param1);
         }
      }
      
      private function retrieveCatalogImage(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:String = page.viewer.catalog.configuration.getKey("image.library.catalogue.url");
         var _loc4_:* = page.viewer.catalog.configuration.getKey("image.library.url") + "Top_Story_Images/";
         var _loc5_:String = this.var_869[param1];
         var _loc6_:IWindow = _window.findChildByName(_loc5_) as IWindow;
         if(_loc6_.tags.indexOf("TOP_STORY") > -1)
         {
            _loc2_ = _loc4_;
         }
         else
         {
            _loc2_ = _loc3_;
         }
         var _loc7_:* = _loc2_ + param1 + ".gif";
         Logger.log("[LocalizationCatalogWidget]  : " + _loc7_);
         var _loc8_:URLRequest = new URLRequest(_loc7_);
         var _loc9_:AssetLoaderStruct = page.viewer.catalog.assets.loadAssetFromFile(param1,_loc8_,"image/gif");
         _loc9_.addEventListener(AssetLoaderEvent.const_28,this.onCatalogImageReady);
      }
      
      private function onCatalogImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.assetName;
            _loc4_ = this.var_869[_loc3_];
            this.setElementImage(_loc4_,_loc3_);
         }
      }
   }
}
