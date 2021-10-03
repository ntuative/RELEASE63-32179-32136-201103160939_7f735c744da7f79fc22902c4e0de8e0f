package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContextStateListener;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MouseEventProcessor implements IEventProcessor, IDisposable
   {
      
      protected static var var_327:Array;
      
      protected static var var_282:Array;
      
      protected static var var_396:Point = new Point();
       
      
      protected var var_669:Point;
      
      protected var var_174:WindowController;
      
      protected var var_74:WindowController;
      
      protected var var_150:IWindowRenderer;
      
      protected var var_142:IDesktopWindow;
      
      protected var var_830:IWindowContextStateListener;
      
      private var _disposed:Boolean = false;
      
      public function MouseEventProcessor()
      {
         super();
         this.var_669 = new Point();
         if(var_327 == null)
         {
            var_327 = new Array();
            var_327[0] = MouseCursorType.const_287;
            var_327[1] = MouseCursorType.const_31;
            var_327[2] = MouseCursorType.const_287;
            var_327[3] = MouseCursorType.const_287;
            var_327[4] = MouseCursorType.const_287;
            var_327[5] = MouseCursorType.const_31;
            var_327[6] = MouseCursorType.const_287;
         }
         if(var_282 == null)
         {
            var_282 = new Array();
            var_282[0] = WindowState.const_109;
            var_282[1] = WindowState.const_84;
            var_282[2] = WindowState.const_95;
            var_282[3] = WindowState.const_67;
            var_282[4] = WindowState.const_54;
            var_282[5] = WindowState.const_98;
            var_282[6] = WindowState.const_82;
         }
      }
      
      public static function setMouseCursorByState(param1:uint, param2:uint) : void
      {
         var _loc3_:int = var_282.indexOf(param1);
         if(_loc3_ > -1)
         {
            var_327[_loc3_] = param2;
         }
      }
      
      public static function getMouseCursorByState(param1:uint) : uint
      {
         var _loc2_:int = 0;
         while(_loc2_-- > 0)
         {
            if((param1 & 0) > 0)
            {
               return var_327[_loc2_];
            }
         }
         return MouseCursorType.const_31;
      }
      
      protected static function convertMouseEventType(param1:MouseEvent, param2:IWindow, param3:IWindow) : WindowMouseEvent
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         _loc5_ = new Point(param1.stageX,param1.stageY);
         param2.convertPointFromGlobalToLocalSpace(_loc5_);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_OVER:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_OUT:
               _loc4_ = "null";
               break;
            case MouseEvent.ROLL_OUT:
               _loc4_ = "null";
               break;
            case MouseEvent.ROLL_OVER:
               _loc4_ = "null";
               break;
            case MouseEvent.CLICK:
               _loc4_ = "null";
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_UP:
               _loc6_ = _loc5_.x > -1 && _loc5_.y > -1 && _loc5_.x < param2.width && _loc5_.y < param2.height;
               _loc4_ = !!_loc6_ ? "null" : WindowMouseEvent.const_199;
               break;
            case MouseEvent.MOUSE_WHEEL:
               _loc4_ = "null";
               break;
            default:
               _loc4_ = "null";
         }
         return new WindowMouseEvent(_loc4_,param2,param3,_loc5_.x,_loc5_.y,param1.stageX,param1.stageY,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown,param1.delta,false,true);
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
         }
      }
      
      public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var event:MouseEvent = null;
         var index:int = 0;
         var child:WindowController = null;
         var array:Array = null;
         var window:IWindow = null;
         var temp:IWindow = null;
         var state:EventProcessorState = param1;
         var eventQueue:IEventQueue = param2;
         if(eventQueue.length == 0)
         {
            return;
         }
         this.var_142 = state.desktop;
         this.var_74 = state.var_1260 as WindowController;
         this.var_174 = state.var_1263 as WindowController;
         this.var_150 = state.renderer;
         this.var_830 = state.var_1262;
         eventQueue.begin();
         this.var_669.x = -1;
         this.var_669.y = -1;
         var mouseCursorType:int = 0;
         while(true)
         {
            event = eventQueue.next() as MouseEvent;
            if(event == null)
            {
               break;
            }
            if(event.stageX != this.var_669.x || event.stageY != this.var_669.y)
            {
               this.var_669.x = event.stageX;
               this.var_669.y = event.stageY;
               array = new Array();
               this.var_142.groupParameterFilteredChildrenUnderPoint(this.var_669,array,WindowParam.const_30);
            }
            index = array != null ? int(array.length) : 0;
            if(index == 0)
            {
               if(event.type == MouseEvent.MOUSE_MOVE)
               {
                  if(this.var_74 != this.var_142 && !this.var_74.disposed)
                  {
                     this.var_74.getGlobalPosition(var_396);
                     this.var_74.update(this.var_74,new WindowMouseEvent(WindowMouseEvent.const_25,this.var_74,null,event.stageX - 0,event.stageY - 0,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta));
                     this.var_74 = WindowController(this.var_142);
                  }
               }
               else if(event.type == MouseEvent.MOUSE_DOWN)
               {
                  window = this.var_142.getActiveWindow();
                  if(window)
                  {
                     window.deactivate();
                  }
               }
            }
            while(--index > -1)
            {
               child = this.passMouseEvent(WindowController(array[index]),event);
               if(child != null && child.visible)
               {
                  if(event.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(child != this.var_74)
                     {
                        if(!this.var_74.disposed)
                        {
                           this.var_74.getGlobalPosition(var_396);
                           this.var_74.update(this.var_74,new WindowMouseEvent(WindowMouseEvent.const_25,this.var_74,child,event.stageX - 0,event.stageY - 0,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta));
                        }
                        if(!child.disposed)
                        {
                           child.getGlobalPosition(var_396);
                           child.update(child,new WindowMouseEvent(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,child,null,event.stageX - 0,event.stageY - 0,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta));
                        }
                        if(!child.disposed)
                        {
                           this.var_74 = child;
                        }
                     }
                  }
                  else if(event.type == MouseEvent.MOUSE_UP || event.type == MouseEvent.CLICK)
                  {
                     if(this.var_74 && !this.var_74.disposed)
                     {
                        if(this.var_830 != null)
                        {
                           this.var_830.mouseEventReceived(event.type,this.var_74);
                        }
                     }
                  }
                  temp = child.parent;
                  while(temp && !temp.disposed)
                  {
                     if(temp is IInputProcessorRoot)
                     {
                        IInputProcessorRoot(temp).process(convertMouseEventType(event,temp,child));
                        break;
                     }
                     temp = temp.parent;
                  }
                  if(event.altKey)
                  {
                     if(this.var_74)
                     {
                        Logger.log("HOVER: " + this.var_74.name);
                     }
                  }
                  if(this.var_74 is IInteractiveWindow)
                  {
                     try
                     {
                        mouseCursorType = getMouseCursorByState(this.var_74.state);
                     }
                     catch(e:Error)
                     {
                        mouseCursorType = 0;
                     }
                  }
                  if(child != this.var_142)
                  {
                     event.stopPropagation();
                     eventQueue.remove();
                  }
                  break;
               }
            }
         }
         eventQueue.end();
         MouseCursorControl.type = mouseCursorType;
         state.desktop = this.var_142;
         state.var_1260 = this.var_74;
         state.var_1263 = this.var_174;
         state.renderer = this.var_150;
         state.var_1262 = this.var_830;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent, param3:Boolean = false) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_82))
         {
            return null;
         }
         var _loc4_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc4_);
         if(param2.type == MouseEvent.MOUSE_UP)
         {
            if(param1 != this.var_174)
            {
               if(this.var_174 && !this.var_174.disposed)
               {
                  this.var_174.update(this.var_174,convertMouseEventType(new MouseEvent(MouseEvent.MOUSE_UP,false,true,param2.localX,param2.localY,null,param2.ctrlKey,param2.altKey,param2.shiftKey,param2.buttonDown,param2.delta),this.var_174,param1));
                  this.var_174 = null;
               }
            }
         }
         var _loc5_:BitmapData = this.var_150.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc4_,_loc5_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_523))
         {
            if(param1.parent != null)
            {
               return this.passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         if(!param3)
         {
            switch(param2.type)
            {
               case MouseEvent.MOUSE_DOWN:
                  this.var_174 = param1;
                  break;
               case MouseEvent.CLICK:
                  if(this.var_174 != param1)
                  {
                     return null;
                  }
                  this.var_174 = null;
                  break;
               case MouseEvent.DOUBLE_CLICK:
                  if(this.var_174 != param1)
                  {
                     return null;
                  }
                  this.var_174 = null;
                  break;
            }
         }
         if(!param1.update(param1,convertMouseEventType(param2,param1,null)) && !param3)
         {
            if(param1.parent)
            {
               return this.passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         return param1;
      }
   }
}
