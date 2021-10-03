package com.sulake.habbo.ui
{
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.geom.Rectangle;
   
   public class DesktopLayoutManager
   {
       
      
      private const const_1345:String = "room_view";
      
      private const const_2019:String = "room_widget";
      
      private var var_49:IWindowContainer;
      
      private var var_762:int = 50;
      
      private var var_2833:XML = null;
      
      public function DesktopLayoutManager()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(this.var_49 != null)
         {
            this.var_49.dispose();
         }
      }
      
      public function setLayout(param1:XML, param2:IHabboWindowManager, param3:IHabboConfigurationManager) : void
      {
         var _loc5_:* = null;
         var _loc7_:int = 0;
         if(param1 == null || param2 == null)
         {
            throw new Error("Unable to set room desktop layout.");
         }
         this.var_2833 = param1.copy();
         this.var_49 = (param2 as ICoreWindowManager).buildFromXML(param1,0) as IWindowContainer;
         if(this.var_49 == null)
         {
            throw new Error("Failed to build layout from XML.");
         }
         this.var_49.width = this.var_49.desktop.width;
         this.var_49.height = this.var_49.desktop.height;
         var _loc4_:IWindowContainer = this.var_49.desktop as IWindowContainer;
         _loc4_.addChildAt(this.var_49,0);
         if(param3)
         {
            if(param3.getKey("friendbar.enabled","0") == "1")
            {
               this.var_49.findChildByTag("room_widget_infostand").y = this.var_49.findChildByTag("room_widget_infostand").y - 32;
               this.var_49.findChildByTag("room_widget_me_menu").y = this.var_49.findChildByTag("room_widget_me_menu").y - 32;
            }
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.var_49.numChildren)
         {
            _loc5_ = this.var_49.getChildAt(_loc6_);
            _loc7_ = false || false;
            if(_loc5_.testParamFlag(_loc7_))
            {
               _loc5_.addEventListener(WindowEvent.const_283,this.trimContainer);
            }
            _loc6_++;
         }
      }
      
      private function trimContainer(param1:WindowEvent) : void
      {
         var _loc2_:IWindowContainer = param1.window as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.numChildren != 1)
         {
            return;
         }
         var _loc3_:IWindow = _loc2_.getChildAt(0);
         if(_loc3_ == null)
         {
            return;
         }
         _loc2_.width = _loc3_.width;
         _loc2_.height = _loc3_.height;
      }
      
      public function addWidgetWindow(param1:IWindow) : Boolean
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:Array = param1.tags;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            if(String(_loc2_[_loc4_]).indexOf(this.const_2019) == 0)
            {
               _loc3_ = _loc2_[_loc4_] as String;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ == null)
         {
            return false;
         }
         var _loc5_:IWindowContainer = this.var_49.getChildByTag(_loc3_) as IWindowContainer;
         if(_loc5_ == null)
         {
            return false;
         }
         param1.x = 0;
         param1.y = 0;
         _loc5_.addChild(param1);
         _loc5_.width = param1.width;
         _loc5_.height = param1.height;
         return true;
      }
      
      public function addRoomView(param1:IWindow) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:IWindowContainer = this.var_49.getChildByTag(this.const_1345) as IWindowContainer;
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_.addChild(param1);
         return true;
      }
      
      public function set toolbarOrientation(param1:String) : void
      {
         var _loc2_:Rectangle = new Rectangle();
         switch(param1)
         {
            case "LEFT":
               _loc2_.x = this.var_762;
               _loc2_.width = this.var_49.desktop.width - this.var_762;
               _loc2_.y = 0;
               _loc2_.height = this.var_49.desktop.height;
               break;
            case "RIGHT":
               _loc2_.x = 0;
               _loc2_.width = this.var_49.desktop.width - this.var_762;
               _loc2_.y = 0;
               _loc2_.height = this.var_49.desktop.height;
               break;
            case "TOP":
               _loc2_.x = 0;
               _loc2_.width = this.var_49.desktop.width;
               _loc2_.y = this.var_762;
               _loc2_.height = this.var_49.desktop.height - this.var_762;
               break;
            case "BOTTOM":
               _loc2_.x = 0;
               _loc2_.width = this.var_49.desktop.width;
               _loc2_.y = 0;
               _loc2_.height = this.var_49.desktop.height - this.var_762;
         }
         if(!_loc2_.isEmpty())
         {
            this.var_49.rectangle = _loc2_;
         }
      }
      
      public function set toolbarSize(param1:int) : void
      {
         this.var_762 = param1;
      }
      
      public function get roomViewRect() : Rectangle
      {
         if(this.var_49 == null)
         {
            return null;
         }
         var _loc1_:IWindowContainer = this.var_49.findChildByTag(this.const_1345) as IWindowContainer;
         if(!_loc1_)
         {
            return null;
         }
         var _loc2_:Rectangle = _loc1_.rectangle.clone();
         if(!_loc2_)
         {
            return null;
         }
         _loc2_.offset(this.var_49.x,this.var_49.y);
         return _loc2_;
      }
      
      public function getRoomView() : IWindow
      {
         if(this.var_49 == null)
         {
            return null;
         }
         var _loc1_:IWindowContainer = this.var_49.findChildByTag(this.const_1345) as IWindowContainer;
         if(_loc1_ != null && _loc1_.numChildren > 0)
         {
            return _loc1_.getChildAt(0);
         }
         return null;
      }
   }
}
