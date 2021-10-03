package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_179:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_290:IHabboCommunicationManager;
      
      private var var_972:IHabboLocalizationManager;
      
      private var var_784:IHabboConfigurationManager;
      
      private var var_307:ISessionDataManager;
      
      private var var_1207:FaqIndex;
      
      private var var_1411:IncomingMessages;
      
      private var var_67:HelpUI;
      
      private var var_107:TutorialUI;
      
      private var var_783:HotelMergeUI;
      
      private var var_1479:CallForHelpData;
      
      private var var_2655:UserRegistry;
      
      private var var_2656:String = "";
      
      private var var_640:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1479 = new CallForHelpData();
         this.var_2655 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1207 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2656 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2656;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1479;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2655;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_972;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_179;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_307;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_107;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_783;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_107)
         {
            return this.var_107.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_67 != null)
         {
            this.var_67.dispose();
            this.var_67 = null;
         }
         if(this.var_107 != null)
         {
            this.var_107.dispose();
            this.var_107 = null;
         }
         if(this.var_783)
         {
            this.var_783.dispose();
            this.var_783 = null;
         }
         if(this.var_1207 != null)
         {
            this.var_1207.dispose();
            this.var_1207 = null;
         }
         this.var_1411 = null;
         if(this.var_179)
         {
            this.var_179.release(new IIDHabboToolbar());
            this.var_179 = null;
         }
         if(this.var_972)
         {
            this.var_972.release(new IIDHabboLocalizationManager());
            this.var_972 = null;
         }
         if(this.var_290)
         {
            this.var_290.release(new IIDHabboCommunicationManager());
            this.var_290 = null;
         }
         if(this.var_784)
         {
            this.var_784.release(new IIDHabboConfigurationManager());
            this.var_784 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_307 != null)
         {
            this.var_307.release(new IIDSessionDataManager());
            this.var_307 = null;
         }
         if(this.var_640 != null)
         {
            this.var_640.dispose();
            this.var_640 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_67 != null)
         {
            this.var_67.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_67 != null)
         {
            this.var_67.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_67 != null)
         {
            this.var_67.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_67 != null)
         {
            this.var_67.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_67 != null)
         {
            this.var_67.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1207;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_290 != null && param1 != null)
         {
            this.var_290.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_784 == null)
         {
            return param1;
         }
         return this.var_784.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_67 != null)
         {
            this.var_67.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_67 != null)
         {
            this.var_67.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1479.reportedUserId = param1;
         this.var_1479.reportedUserName = param2;
         this.var_67.showUI(HabboHelpViewEnum.const_347);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_67 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_67.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_67 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_67 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_972,this.var_179);
         }
         return this.var_67 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_107 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_107 = new TutorialUI(this,_loc1_);
         }
         return this.var_107 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_107 != null)
         {
            this.var_107.dispose();
            this.var_107 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_783)
         {
            this.var_783 = new HotelMergeUI(this);
         }
         this.var_783.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_107 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_107.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_107)
         {
            this.var_107.showView(TutorialUI.const_308);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_290 = IHabboCommunicationManager(param2);
         this.var_1411 = new IncomingMessages(this,this.var_290);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_179 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_972 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_784 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_91,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_100,this.onRoomSessionEvent);
         this.var_179.events.addEventListener(HabboToolbarEvent.const_73,this.onHabboToolbarEvent);
         this.var_179.events.addEventListener(HabboToolbarEvent.const_37,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_307 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_91:
               if(this.var_67 != null)
               {
                  this.var_67.setRoomSessionStatus(true);
               }
               if(this.var_107 != null)
               {
                  this.var_107.setRoomSessionStatus(true);
               }
               this.showWelcomeScreen(true);
               break;
            case RoomSessionEvent.const_100:
               if(this.var_67 != null)
               {
                  this.var_67.setRoomSessionStatus(false);
               }
               if(this.var_107 != null)
               {
                  this.var_107.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
               this.showWelcomeScreen(false);
         }
      }
      
      private function showWelcomeScreen(param1:Boolean) : void
      {
         if(!this.var_640)
         {
            this.var_640 = new WelcomeScreenController(this,this._windowManager,this.var_784);
         }
         this.var_640.showWelcomeScreen(param1);
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_179 != null)
         {
            this.var_179.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_133,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_73)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_37)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
      
      public function setWelcomeScreenCategory(param1:String, param2:String = "", param3:String = "") : void
      {
         if(!this.var_640)
         {
            this.showWelcomeScreen(true);
         }
         this.var_640.setCategory(param1,param2,param3);
      }
   }
}
