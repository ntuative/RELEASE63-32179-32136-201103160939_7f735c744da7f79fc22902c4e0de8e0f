package com.sulake.core.window.tools
{
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.ICore;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IIDProfiler;
   import com.sulake.core.runtime.IProfiler;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.profiler.ProfilerAgentTask;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ICanvasWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class ProfilerOutput implements IDevTool
   {
      
      private static var var_1465:Class = ProfilerOutput_profiler_dialog_xml;
      
      private static var var_1466:Class = ProfilerOutput_profiler_task_xml;
       
      
      private var _disposed:Boolean = false;
      
      private var var_167:IProfiler;
      
      private var var_26:ICore;
      
      private var _window:IFrameWindow;
      
      private var var_2835:Array;
      
      private var _windowManager:ICoreWindowManager;
      
      private var var_886:IWindowRenderer;
      
      private var var_1849:Boolean = false;
      
      public function ProfilerOutput(param1:IContext, param2:ICoreWindowManager, param3:IWindowRenderer)
      {
         super();
         this.var_26 = param1 as ICore;
         this.var_2835 = new Array();
         this.var_167 = this.profiler;
         this._windowManager = param2;
         this.var_886 = param3;
         var _loc4_:ByteArray = new var_1465() as ByteArray;
         var _loc5_:XML = new XML(_loc4_.readUTFBytes(_loc4_.length));
         this._window = this._windowManager.buildFromXML(_loc5_,2) as IFrameWindow;
         this._window.visible = false;
         this._window.procedure = this.profilerWindowEventProc;
         this._window.findChildByName("header").caption = padAlign("task",28) + "|" + padAlign("#rounds",8) + "|" + padAlign("latest ms",8) + "|" + padAlign("total ms",8) + "|";
         this._window.findChildByName("footer").caption = "<- Click to enable bitmap memory tracking";
         ILabelWindow(this._window.findChildByName("footer")).textColor = 4284900966;
      }
      
      private static function padAlign(param1:String, param2:int, param3:String = " ", param4:Boolean = false) : String
      {
         var _loc5_:int = param2 - param1.length;
         if(_loc5_ <= 0)
         {
            return param1.substring(0,param2);
         }
         var _loc6_:String = "";
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ += param3;
            _loc7_++;
         }
         return !!param4 ? _loc6_ + param1 : param1 + _loc6_;
      }
      
      public function get caption() : String
      {
         return "Component Profiler";
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get visible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var value:Boolean = param1;
         if(value != this.visible)
         {
            this._window.visible = value;
            if(value)
            {
               this._window.activate();
               this.var_26.setProfilerMode(true);
               this.var_26.queueInterface(new IIDProfiler(),function(param1:IID, param2:IUnknown):void
               {
                  profiler = param2 as IProfiler;
               });
            }
            else
            {
               this.var_26.setProfilerMode(false);
            }
         }
      }
      
      public function set profiler(param1:IProfiler) : void
      {
         if(this.var_167)
         {
            this.var_167.removeStopEventListener(this.refresh);
            this.var_167 = null;
         }
         if(!this.var_167 && param1)
         {
            this.var_167 = param1;
            this.var_167.addStopEventListener(this.refresh);
         }
      }
      
      public function get profiler() : IProfiler
      {
         return this.var_167;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._window.dispose();
            this._window = null;
            this.var_167.removeStopEventListener(this.refresh);
            this.var_167 = null;
            this._windowManager = null;
            this.var_886 = null;
            this._disposed = true;
         }
      }
      
      private function profilerWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.tags.indexOf("close") > -1)
            {
               this._window.visible = false;
            }
            else if(param2.name == "button_gc")
            {
               this.var_167.gc();
            }
         }
         if(param2.name == "footer_enable_toggle")
         {
            if(param1.type == WindowEvent.const_64)
            {
               this.var_1849 = true;
               ILabelWindow(this._window.findChildByName("footer")).textColor = 4278190080;
            }
            else if(param1.type == WindowEvent.const_881)
            {
               this.var_1849 = false;
               ILabelWindow(this._window.findChildByName("footer")).textColor = 4284900966;
            }
         }
      }
      
      public function refresh(param1:Event) : void
      {
         var _loc2_:Array = this.var_167.getProfilerAgentsInArray();
         var _loc3_:IItemListWindow = this._window.findChildByName("list") as IItemListWindow;
         var _loc4_:* = 0;
         while(_loc2_.length > 0)
         {
            _loc4_ = uint(this.recursiveRedraw(_loc2_.pop(),_loc3_,_loc4_,0));
         }
         if(this.var_1849)
         {
            this._window.findChildByName("footer").caption = "Assets - Libraries: " + this.var_167.numAssetLibraryInstances + " " + "Bitmaps: " + this.var_167.numBitmapAssetInstances + " / " + this.var_167.numAllocatedBitmapDataBytes + " bytes \n" + "Windows - Allocated bitmap data: " + (this.var_886.allocatedByteCount + GraphicContext.allocatedByteCount) + " bytes \n" + "Tracked bitmap data: " + this.var_167.numTrackedBitmapDataInstances + " / " + this.var_167.numTrackedBitmapDataBytes + " bytes";
         }
      }
      
      private function recursiveRedraw(param1:ProfilerAgentTask, param2:IItemListWindow, param3:uint, param4:uint) : uint
      {
         var _loc5_:* = null;
         if(param3 >= param2.numListItems)
         {
            _loc5_ = this.createListItem(param2);
         }
         else
         {
            _loc5_ = param2.getListItemAt(param3) as IWindowContainer;
         }
         var _loc6_:String = param1.name;
         if(param4 > 0)
         {
            _loc6_ = padAlign(_loc6_,param4 + _loc6_.length,"-",true);
         }
         var _loc7_:IWindow = _loc5_.findChildByName("text") as IWindow;
         _loc7_.caption = padAlign(_loc6_,28," ",false) + "|" + padAlign(String(param1.rounds),8," ",true) + "|" + padAlign(String(param1.latest),8," ",true) + "|" + padAlign(String(param1.total),8," ",true) + "|\r";
         _loc5_.findChildByName("caption").caption = param1.caption;
         var _loc8_:IBitmapWrapperWindow = _loc5_.findChildByName("canvas") as IBitmapWrapperWindow;
         this.refreshBitmapImage(_loc8_,param1);
         param3++;
         var _loc9_:int = 0;
         while(_loc9_ < param1.numSubTasks)
         {
            param3 = this.recursiveRedraw(param1.getSubTaskAt(_loc9_),param2,param3,param4 + 1);
            _loc9_++;
         }
         return param3;
      }
      
      private function refreshBitmapImage(param1:IBitmapWrapperWindow, param2:ProfilerAgentTask) : void
      {
         var _loc3_:BitmapData = param1.bitmap;
         if(_loc3_ == null)
         {
            _loc3_ = new BitmapData(param1.width,param1.height,false,4294967295);
            param1.bitmap = _loc3_;
         }
         var _loc4_:Rectangle = _loc3_.rect;
         var _loc5_:int = param2.latest;
         var _loc6_:int = _loc5_ > _loc3_.height ? int(_loc3_.height) : int(_loc5_);
         _loc4_.x += 1;
         --_loc4_.width;
         _loc3_.copyPixels(_loc3_,_loc4_,new Point());
         _loc4_.x += _loc4_.width - 2;
         _loc4_.y += _loc4_.height - _loc6_;
         _loc4_.width = 1;
         _loc4_.height = _loc6_;
         _loc3_.fillRect(_loc4_,_loc5_ > _loc3_.height ? 4294901760 : uint(4278190335));
         param1.invalidate();
      }
      
      private function refreshCanvasImage(param1:ICanvasWindow, param2:ProfilerAgentTask) : void
      {
         var _loc3_:Rectangle = new Rectangle();
         var _loc4_:BitmapData = param1.retrieveDrawBuffer(null,_loc3_);
         var _loc5_:int = param2.latest;
         var _loc6_:int = _loc5_ > _loc4_.height ? int(_loc4_.height) : int(_loc5_);
         _loc3_.x += 1;
         --_loc3_.width;
         _loc4_.copyPixels(_loc4_,_loc3_,new Point());
         _loc3_.x += _loc3_.width - 2;
         _loc3_.y += _loc3_.height - _loc6_;
         _loc3_.width = 1;
         _loc3_.height = _loc6_;
         _loc4_.fillRect(_loc3_,_loc5_ > _loc4_.height ? 4294901760 : uint(4278190335));
         param1.invalidate();
      }
      
      private function createListItem(param1:IItemListWindow) : IWindowContainer
      {
         var _loc2_:ByteArray = new var_1466() as ByteArray;
         var _loc3_:XML = new XML(_loc2_.readUTFBytes(_loc2_.length));
         var _loc4_:IWindowContainer = this._windowManager.buildFromXML(_loc3_,2) as IWindowContainer;
         param1.addListItem(_loc4_);
         return _loc4_;
      }
   }
}
