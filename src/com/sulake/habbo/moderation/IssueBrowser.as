package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class IssueBrowser
   {
       
      
      private const const_2024:String = "my_issues";
      
      private const const_2023:String = "open_issues";
      
      private const const_2022:String = "picked_issues";
      
      private const const_2030:String = "closed_issues";
      
      private var _issueManager:IssueManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assets:IAssetLibrary;
      
      private var _window:IFrameWindow;
      
      private var var_269:ITabContextWindow;
      
      private var var_377:IIssueBrowserView;
      
      private var var_1901:IIssueBrowserView;
      
      private var var_1899:IIssueBrowserView;
      
      private var var_1900:PickedIssuesView;
      
      public function IssueBrowser(param1:IssueManager, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         this._issueManager = param1;
         this._windowManager = param2;
         this._assets = param3;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this._assets;
      }
      
      public function get issueManager() : IssueManager
      {
         return this._issueManager;
      }
      
      public function show() : void
      {
         if(this._window == null)
         {
            this.createMainFrame();
         }
         this._window.visible = true;
         this._window.activate();
         this.update();
      }
      
      public function isOpen() : Boolean
      {
         return this._window != null && this._window.visible;
      }
      
      private function createMainFrame() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(this._window == null)
         {
            this._window = this.createWindow("issue_browser_xml") as IFrameWindow;
            if(this._window == null)
            {
               return;
            }
            _loc2_ = this._window.desktop;
            this._window.x = _loc2_.width / 2 - this._window.width / 2;
            this._window.y = _loc2_.height / 2 - this._window.height / 2;
            _loc3_ = this._window.findChildByTag("close");
            if(_loc3_ != null)
            {
               _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
            }
            _loc4_ = this._window.findChildByName("auto_pick");
            if(_loc4_ != null)
            {
               _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onAutoPick);
            }
            this.var_269 = this._window.findChildByName("tab_context") as ITabContextWindow;
            _loc6_ = 0;
            while(_loc6_ < this.var_269.numTabItems)
            {
               _loc5_ = this.var_269.getTabItemAt(_loc6_);
               _loc5_.addEventListener(WindowEvent.const_64,this.onTabSelected);
               _loc6_++;
            }
         }
         this.var_269 = this._window.findChildByName("tab_context") as ITabContextWindow;
         if(this.var_269 == null || this.var_269.container == null)
         {
            return;
         }
         var _loc1_:ISelectableWindow = this.var_269.selector.getSelectableByName("open_issues");
         this.var_269.selector.setSelected(_loc1_);
      }
      
      private function selectView(param1:String) : void
      {
         var _loc2_:IIssueBrowserView = this.getView(param1);
         if(this.var_377 == _loc2_)
         {
            return;
         }
         if(this.var_377 != null)
         {
            this.var_377.visible = false;
         }
         this.var_377 = _loc2_;
         if(this.var_377 == null)
         {
            return;
         }
         this.var_377.view.width = this.var_269.container.width;
         this.var_377.view.height = this.var_269.container.height;
         this.var_377.visible = true;
         this.var_377.update();
      }
      
      private function getView(param1:String) : IIssueBrowserView
      {
         switch(param1)
         {
            case this.const_2024:
               if(this.var_1901 == null)
               {
                  this.var_1901 = new MyIssuesView(this.issueManager,this,this.var_269.container);
               }
               return this.var_1901;
            case this.const_2023:
               if(this.var_1899 == null)
               {
                  this.var_1899 = new OpenIssuesView(this.issueManager,this,this.var_269.container);
               }
               return this.var_1899;
            case this.const_2022:
               if(this.var_1900 == null)
               {
                  this.var_1900 = new PickedIssuesView(this.issueManager,this,this.var_269.container);
               }
               return this.var_1900;
            default:
               return null;
         }
      }
      
      private function onTabSelected(param1:WindowEvent) : void
      {
         if(param1 == null || param1.window == null)
         {
            return;
         }
         this.selectView(param1.window.name);
      }
      
      public function update() : void
      {
         if(this._window == null || !this._window.visible)
         {
            return;
         }
         if(this.var_377 == null)
         {
            return;
         }
         this.var_377.update();
      }
      
      public function createWindow(param1:String) : IWindow
      {
         if(this._windowManager == null || this._assets == null)
         {
            return null;
         }
         var _loc2_:XmlAsset = this._assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return null;
         }
         return this._windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         this._window.visible = false;
      }
      
      private function onAutoPick(param1:WindowMouseEvent) : void
      {
         if(this._issueManager != null)
         {
            this._issueManager.autoPick();
         }
      }
   }
}
