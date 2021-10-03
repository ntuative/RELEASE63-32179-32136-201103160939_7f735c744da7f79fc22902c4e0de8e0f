package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class AvatarEditorGridView
   {
       
      
      private const const_1290:int = 2;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_16:IWindowContainer;
      
      private var var_1125:Boolean = true;
      
      private var var_69:IAvatarEditorCategoryModel;
      
      private var var_1400:String;
      
      private var var_606:IItemGridWindow;
      
      private var var_494:Array;
      
      public function AvatarEditorGridView(param1:IAvatarEditorCategoryModel, param2:String, param3:IHabboWindowManager, param4:IAssetLibrary)
      {
         super();
         this.var_69 = param1;
         this.var_1400 = param2;
         this._assetLibrary = param4;
         this._windowManager = param3;
         var _loc5_:XmlAsset = this._assetLibrary.getAssetByName("AvatarEditorGrid") as XmlAsset;
         this.var_16 = IWindowContainer(this._windowManager.buildFromXML(_loc5_.content as XML));
         if(this.var_16 != null)
         {
            this.var_606 = this.var_16.findChildByName("part_thumbs") as IItemGridWindow;
            this.var_494 = new Array();
            this.var_494.push(this.var_16.findChildByName("palette0") as IItemGridWindow);
            this.var_494.push(this.var_16.findChildByName("palette1") as IItemGridWindow);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_606)
         {
            this.var_606.dispose();
            this.var_606 = null;
         }
         if(this.var_494)
         {
            for each(_loc1_ in this.var_494)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
                  _loc1_ = null;
               }
            }
            this.var_494 = null;
         }
         this.var_69 = null;
         if(this.var_16)
         {
            this.var_16.dispose();
            this.var_16 = null;
         }
         this._windowManager = null;
         this._assetLibrary = null;
      }
      
      public function get window() : IWindowContainer
      {
         if(this.var_16 == null)
         {
            return null;
         }
         if(this.var_16.disposed)
         {
            return null;
         }
         return this.var_16;
      }
      
      public function initFromList() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:CategoryData = this.var_69.getCategoryData(this.var_1400);
         if(!_loc1_)
         {
            return;
         }
         this.var_606.removeGridItems();
         for each(_loc2_ in _loc1_.parts)
         {
            if(_loc2_)
            {
               this.var_606.addGridItem(_loc2_.view);
               _loc2_.view.procedure = this.partEventProc;
               if(_loc2_.isSelected)
               {
                  this.showPalettes(_loc2_.colorLayerCount);
               }
            }
         }
         _loc3_ = 0;
         while(_loc3_ < this.const_1290)
         {
            _loc4_ = _loc1_.getPalette(_loc3_);
            _loc5_ = this.var_494[_loc3_] as IItemGridWindow;
            if(!(!_loc4_ || !_loc5_))
            {
               for each(_loc6_ in _loc4_)
               {
                  _loc5_.addGridItem(_loc6_.view);
                  _loc6_.view.procedure = this.paletteEventProc;
               }
            }
            _loc3_++;
         }
         this.var_1125 = false;
      }
      
      public function showPalettes(param1:int) : void
      {
         var _loc2_:IWindowContainer = this.var_16.findChildByName("palette_container0") as IWindowContainer;
         var _loc3_:IWindowContainer = this.var_16.findChildByName("palette_container1") as IWindowContainer;
         if(!_loc2_ || !_loc3_)
         {
            return;
         }
         var _loc4_:ITextWindow = this.var_16.findChildByName("palette_desc_0") as ITextWindow;
         var _loc5_:ITextWindow = this.var_16.findChildByName("palette_desc_1") as ITextWindow;
         if(!_loc4_ || !_loc5_)
         {
            return;
         }
         if(param1 <= 1)
         {
            _loc2_.width = 318;
            _loc3_.visible = false;
            _loc4_.visible = false;
            _loc5_.visible = false;
         }
         else
         {
            _loc2_.width = 156;
            _loc3_.width = 156;
            _loc3_.visible = true;
            _loc4_.visible = true;
            _loc5_.visible = true;
         }
      }
      
      public function get firstView() : Boolean
      {
         return this.var_1125;
      }
      
      public function updatePart(param1:int, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = this.var_606.getGridItemAt(param1);
         if(!_loc3_)
         {
            return;
         }
         _loc3_ = param2;
      }
      
      private function partEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_46)
         {
            _loc3_ = this.var_606.getGridItemIndex(param1.window);
            this.var_69.selectPart(this.var_1400,_loc3_);
         }
      }
      
      private function paletteEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1.type == WindowMouseEvent.const_46)
         {
            _loc6_ = param1.window;
            _loc7_ = 0;
            while(_loc7_ < this.const_1290)
            {
               if(this.var_494.length > _loc7_)
               {
                  _loc4_ = this.var_494[_loc7_] as IItemGridWindow;
                  _loc5_ = _loc4_.getGridItemIndex(_loc6_);
                  if(_loc5_ > -1)
                  {
                     this.var_69.selectColor(this.var_1400,_loc5_,_loc7_);
                     return;
                  }
               }
               _loc7_++;
            }
         }
      }
   }
}
