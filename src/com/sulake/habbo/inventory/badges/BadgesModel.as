package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.badges.GetBadgesComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.badges.SetActivatedBadgesComposer;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class BadgesModel implements IInventoryModel
   {
       
      
      private var _controller:HabboInventory;
      
      private var var_16:BadgesView;
      
      private var var_251:Array;
      
      private var var_892:Array;
      
      private var _assets:IAssetLibrary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_307:ISessionDataManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _disposed:Boolean = false;
      
      private const const_2002:int = 5;
      
      public function BadgesModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:ISessionDataManager)
      {
         super();
         this._controller = param1;
         this._windowManager = param2;
         this.var_251 = new Array();
         this.var_892 = new Array();
         this._assets = param4;
         this._communication = param3;
         this.var_307 = param5;
         this.var_307.events.addEventListener(BadgeImageReadyEvent.const_146,this.onBadgeImageReady);
         this.var_16 = new BadgesView(this,param2,param4);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._controller = null;
            if(this.var_16 != null)
            {
               this.var_16.dispose();
            }
            this._assets = null;
            this._communication = null;
            if(this.var_307 != null)
            {
               this.var_307.events.removeEventListener(BadgeImageReadyEvent.const_146,this.onBadgeImageReady);
               this.var_307 = null;
            }
            this._disposed = true;
         }
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         this._communication.getHabboMainConnection(null).send(new GetBadgesComposer());
      }
      
      public function getMaxActiveCount() : int
      {
         return this.const_2002;
      }
      
      public function updateView() : void
      {
         this.var_16.updateAll();
      }
      
      private function startWearingBadge(param1:Badge) : void
      {
         this.var_892.push(param1);
         param1.isInUse = true;
      }
      
      private function stopWearingBadge(param1:Badge) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_892.length)
         {
            if(this.var_892[_loc2_] == param1)
            {
               this.var_892.splice(_loc2_,1);
               param1.isInUse = false;
               return;
            }
            _loc2_++;
         }
      }
      
      public function updateBadge(param1:String, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc3_:Badge = this.getBadge(param1);
         var _loc4_:Boolean = false;
         if(_loc3_ != null)
         {
            if(_loc3_.isInUse != param2)
            {
               if(param2)
               {
                  this.startWearingBadge(_loc3_);
               }
               else
               {
                  this.stopWearingBadge(_loc3_);
               }
               _loc4_ = true;
            }
         }
         else
         {
            _loc5_ = this._assets.getAssetByName("inventory_thumb_xml");
            _loc6_ = XmlAsset(_loc5_);
            _loc7_ = this._windowManager.buildFromXML(XML(_loc6_.content)) as IWindowContainer;
            _loc8_ = new Badge(param1,_loc7_);
            _loc8_.iconImage = this.var_307.getBadgeImage(param1);
            this.var_251.push(_loc8_);
            if(param2)
            {
               this.startWearingBadge(_loc8_);
            }
            _loc4_ = true;
         }
      }
      
      private function getBadge(param1:String) : Badge
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_251.length)
         {
            _loc3_ = this.var_251[_loc2_];
            if(_loc3_.type == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function removeBadge(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_251.length)
         {
            _loc3_ = this.var_251[_loc2_];
            if(_loc3_.type == param1)
            {
               this.var_251.splice(_loc2_,1);
               this.stopWearingBadge(_loc3_);
               this.updateView();
               return;
            }
            _loc2_++;
         }
      }
      
      public function toggleBadgeWearing(param1:String) : void
      {
         var _loc2_:Badge = this.getBadge(param1);
         if(_loc2_ != null)
         {
            if(_loc2_.isInUse)
            {
               this.stopWearingBadge(_loc2_);
            }
            else
            {
               this.startWearingBadge(_loc2_);
            }
            this.saveBadgeSelection();
         }
      }
      
      public function saveBadgeSelection() : void
      {
         var _loc4_:* = null;
         var _loc1_:SetActivatedBadgesComposer = new SetActivatedBadgesComposer();
         var _loc2_:Array = this.getBadges(1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc1_.addActivatedBadge(_loc4_.type);
            _loc3_++;
         }
         this._communication.getHabboMainConnection(null).send(_loc1_);
      }
      
      public function setBadgeSelected(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_251.length)
         {
            _loc2_ = this.var_251[_loc3_] as Badge;
            if(_loc2_ != null)
            {
               if(_loc2_.type == param1)
               {
                  _loc2_.isSelected = true;
               }
               else
               {
                  _loc2_.isSelected = false;
               }
            }
            _loc3_++;
         }
         this.updateView();
      }
      
      public function forceSelection() : void
      {
         var _loc1_:* = null;
         _loc1_ = this.getSelectedBadge();
         if(_loc1_ != null)
         {
            return;
         }
         var _loc2_:Array = this.getBadges(0);
         if(_loc2_ != null && _loc2_.length > 0)
         {
            _loc1_ = _loc2_[0] as Badge;
            _loc1_.isSelected = true;
            this.updateView();
            return;
         }
         var _loc3_:Array = this.getBadges(1);
         if(_loc3_ != null && _loc3_.length > 0)
         {
            _loc1_ = _loc3_[0] as Badge;
            _loc1_.isSelected = true;
            this.updateView();
            return;
         }
      }
      
      public function getSelectedBadge(param1:int = -1) : Badge
      {
         var _loc4_:* = null;
         var _loc2_:Array = this.getBadges(param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.isSelected)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getBadges(param1:int = -1) : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         switch(param1)
         {
            case -1:
               return this.var_251;
            case 0:
               _loc2_ = new Array();
               _loc3_ = 0;
               while(_loc3_ < this.var_251.length)
               {
                  if((this.var_251[_loc3_] as Badge).isInUse == false)
                  {
                     _loc2_.push(this.var_251[_loc3_]);
                  }
                  _loc3_++;
               }
               return _loc2_;
            case 1:
               return this.var_892;
            default:
               return new Array();
         }
      }
      
      public function getBadgeFromActive(param1:int) : Badge
      {
         return this.getItemInIndex(param1,1);
      }
      
      public function getBadgeFromInactive(param1:int) : Badge
      {
         return this.getItemInIndex(param1,0);
      }
      
      public function getItemInIndex(param1:int, param2:int = -1) : Badge
      {
         var _loc3_:Array = this.getBadges(param2);
         if(param1 < 0 || param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1];
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return this.var_16.getWindowContainer();
      }
      
      private function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         var _loc2_:Badge = this.getBadge(param1.badgeId);
         if(_loc2_ != null)
         {
            _loc2_.iconImage = param1.badgeImage.clone();
            this.updateView();
         }
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_310 && this._controller.isVisible)
         {
            this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES));
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function get controller() : HabboInventory
      {
         return this._controller;
      }
   }
}
