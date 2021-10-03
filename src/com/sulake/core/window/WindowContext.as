package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_578:uint = 0;
      
      public static const const_1443:uint = 1;
      
      public static const const_1929:int = 0;
      
      public static const const_1877:int = 1;
      
      public static const const_1803:int = 2;
      
      public static const const_1894:int = 3;
      
      public static const const_1631:int = 4;
      
      public static const const_349:int = 5;
      
      public static var var_390:IEventQueue;
      
      private static var var_635:IEventProcessor;
      
      private static var var_1868:uint = const_578;
      
      private static var stage:Stage;
      
      private static var var_150:IWindowRenderer;
       
      
      private var var_2629:EventProcessorState;
      
      private var var_2630:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_210:DisplayObjectContainer;
      
      protected var var_2857:Boolean = true;
      
      protected var var_1267:Error;
      
      protected var var_2045:int = -1;
      
      protected var var_1276:IInternalWindowServices;
      
      protected var var_1532:IWindowParser;
      
      protected var var_2808:IWindowFactory;
      
      protected var var_142:IDesktopWindow;
      
      protected var var_1531:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_543:Boolean = false;
      
      private var var_2628:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_150 = param2;
         this._localization = param4;
         this.var_210 = param5;
         this.var_1276 = new ServiceManager(this,param5);
         this.var_2808 = param3;
         this.var_1532 = new WindowParser(this);
         this.var_2630 = param7;
         if(!stage)
         {
            if(this.var_210 is Stage)
            {
               stage = this.var_210 as Stage;
            }
            else if(this.var_210.stage)
            {
               stage = this.var_210.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_142 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_210.addChild(this.var_142.getDisplayObject());
         this.var_210.doubleClickEnabled = true;
         this.var_210.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2629 = new EventProcessorState(var_150,this.var_142,this.var_142,null,this.var_2630);
         inputMode = const_578;
         this.var_1531 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1868;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_390)
         {
            if(var_390 is IDisposable)
            {
               IDisposable(var_390).dispose();
            }
         }
         if(var_635)
         {
            if(var_635 is IDisposable)
            {
               IDisposable(var_635).dispose();
            }
         }
         switch(value)
         {
            case const_578:
               var_390 = new MouseEventQueue(stage);
               var_635 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1443:
               var_390 = new TabletEventQueue(stage);
               var_635 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_578;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_210.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_210.removeChild(IGraphicContextHost(this.var_142).getGraphicContext(true) as DisplayObject);
            this.var_142.destroy();
            this.var_142 = null;
            this.var_1531.destroy();
            this.var_1531 = null;
            if(this.var_1276 is IDisposable)
            {
               IDisposable(this.var_1276).dispose();
            }
            this.var_1276 = null;
            this.var_1532.dispose();
            this.var_1532 = null;
            var_150 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1267;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2045;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1267 = param2;
         this.var_2045 = param1;
         if(this.var_2857)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1267 = null;
         this.var_2045 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1276;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1532;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2808;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_142;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_142.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1631,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1531;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_142,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_142)
         {
            this.var_142 = null;
         }
         if(param1.state != WindowState.const_427)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_150.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_543 = true;
         if(this.var_1267)
         {
            throw this.var_1267;
         }
         var_635.process(this.var_2629,var_390);
         this.var_543 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2628 = true;
         var_150.update(param1);
         this.var_2628 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_142 != null && !this.var_142.disposed)
         {
            if(this.var_210 is Stage)
            {
               this.var_142.width = Stage(this.var_210).stageWidth;
               this.var_142.height = Stage(this.var_210).stageHeight;
            }
            else
            {
               this.var_142.width = this.var_210.width;
               this.var_142.height = this.var_210.height;
            }
         }
      }
   }
}
