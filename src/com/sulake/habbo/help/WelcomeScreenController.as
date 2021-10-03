package com.sulake.habbo.help
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WelcomeScreenController implements IUpdateReceiver
   {
       
      
      private var var_127:HabboHelp;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _config:IHabboConfigurationManager;
      
      private var _disposed:Boolean;
      
      private var var_1614:Boolean;
      
      private var var_207:Timer;
      
      private var _window:IWindowContainer;
      
      private var var_2224:int;
      
      private var var_362:Point;
      
      private var var_1336:String;
      
      private var var_1612:String;
      
      private var var_1613:String;
      
      public function WelcomeScreenController(param1:HabboHelp, param2:IHabboWindowManager, param3:IHabboConfigurationManager)
      {
         super();
         this.var_127 = param1;
         this._windowManager = param2;
         this._config = param3;
         this.var_127.toolbar.events.addEventListener(HabboToolbarEvent.const_37,this.onToolbarClicked);
         this.var_127.toolbar.events.addEventListener(HabboToolbarEvent.const_1053,this.onToolbarResized);
         var _loc4_:Boolean = Boolean(parseInt(this._config.getKey("new.identity","0")));
         this.var_1614 = Boolean(parseInt(this._config.getKey("welcome.screen.enabled","0"))) && _loc4_;
         this.var_2224 = parseInt(this._config.getKey("welcome.screen.delay","5000"));
         this.var_362 = new Point(72,10);
         this.var_207 = new Timer(this.var_2224,1);
         this.var_207.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.setCategory(HabboToolbarIconEnum.NAVIGATOR);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         this.disposeWindow();
         if(this.var_127)
         {
            this.var_127.toolbar.events.removeEventListener(HabboToolbarEvent.const_37,this.onToolbarClicked);
            this.var_127 = null;
         }
         this._windowManager = null;
         this._config = null;
         if(this.var_207)
         {
            this.var_207.stop();
            this.var_207.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this.var_207 = null;
         }
         this._disposed = true;
      }
      
      public function showWelcomeScreen(param1:Boolean) : void
      {
         if(param1 && this.var_1614)
         {
            this.var_207.start();
         }
         else
         {
            this.var_207.stop();
            this.disposeWindow();
         }
      }
      
      public function setCategory(param1:String, param2:String = "", param3:String = "") : void
      {
         this.var_1336 = param1;
         if(param2.length > 0)
         {
            this.var_1612 = param2;
         }
         else
         {
            this.var_1612 = "welcome.screen.title";
         }
         if(param3.length > 0)
         {
            this.var_1613 = param3;
         }
         else
         {
            this.var_1613 = "welcome.screen.message";
         }
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         var _loc2_:XmlAsset = this.var_127.assets.getAssetByName("welcome_screen_xml") as XmlAsset;
         this._window = this._windowManager.buildFromXML(_loc2_.content as XML,2) as IWindowContainer;
         this._window.x = -this._window.width;
         this._window.y = 10;
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName("arrow") as IBitmapWrapperWindow;
         var _loc4_:BitmapDataAsset = this.var_127.assets.getAssetByName("welcome_screen_arrow") as BitmapDataAsset;
         _loc3_.bitmap = (_loc4_.content as BitmapData).clone();
         var _loc5_:IFrameWindow = this._window.findChildByName("frame") as IFrameWindow;
         _loc5_.header.visible = false;
         _loc5_.content.y -= 20;
         var _loc6_:ITextWindow = this._window.findChildByName("text") as ITextWindow;
         _loc6_.height = _loc6_.textHeight + 5;
         _loc5_.content.setParamFlag(WindowParam.const_317,false);
         _loc5_.height -= 20;
         this._window.findChildByName("close").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
         this.var_127.registerUpdateReceiver(this,10);
         this.var_1614 = false;
         this.var_362.y = this.var_127.toolbar.getIconLocation(this.var_1336) - this._window.height / 2;
         this._window.y = this.var_362.y;
         this._window.findChildByName("title").caption = "${" + this.var_1612 + "}";
         this._window.findChildByName("text").caption = "${" + this.var_1613 + "}";
         this.highlightToolbarIcon(true);
      }
      
      private function highlightToolbarIcon(param1:Boolean) : void
      {
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_88,this.var_1336);
         _loc2_.iconState = !!param1 ? "highlight_blue" : "0";
         this.var_127.toolbar.events.dispatchEvent(_loc2_);
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         this.disposeWindow();
      }
      
      private function onToolbarClicked(param1:HabboToolbarEvent) : void
      {
         this.var_207.stop();
         this.disposeWindow();
      }
      
      private function onToolbarResized(param1:HabboToolbarEvent) : void
      {
         if(!this._window)
         {
            return;
         }
         if(this.var_127)
         {
            this.var_127.removeUpdateReceiver(this);
            this.var_127.registerUpdateReceiver(this,10);
         }
         this.var_362.y = this.var_127.toolbar.getIconLocation(this.var_1336) - this._window.height / 2;
      }
      
      private function disposeWindow() : void
      {
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         this.highlightToolbarIcon(false);
         if(this.var_127)
         {
            this.var_127.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         if(!this._window)
         {
            return;
         }
         var _loc2_:Number = Point.distance(this._window.rectangle.topLeft,this.var_362);
         if(_loc2_ > 5)
         {
            _loc3_ = Point.interpolate(this._window.rectangle.topLeft,this.var_362,0.5);
            this._window.x = _loc3_.x;
            this._window.y = _loc3_.y;
         }
         else
         {
            this._window.x = this.var_362.x;
            this._window.y = this.var_362.y;
            this.var_127.removeUpdateReceiver(this);
         }
      }
   }
}
