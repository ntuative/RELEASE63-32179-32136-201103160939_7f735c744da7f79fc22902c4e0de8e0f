package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.MouseListenerType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class WindowMouseListener extends WindowMouseOperator implements IMouseListenerService
   {
       
      
      private var var_1058:Array;
      
      private var var_1059:uint;
      
      public function WindowMouseListener(param1:DisplayObject)
      {
         this.var_1058 = new Array();
         this.var_1059 = MouseListenerType.const_1449;
         super(param1);
      }
      
      public function get eventTypes() : Array
      {
         return this.var_1058;
      }
      
      public function get areaLimit() : uint
      {
         return this.var_1059;
      }
      
      public function set areaLimit(param1:uint) : void
      {
         this.var_1059 = param1;
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         var _loc2_:int = this.var_1058.length;
         while(_loc2_ > 0)
         {
            this.var_1058.pop();
            _loc2_--;
         }
         return super.end(param1);
      }
      
      override protected function handler(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(_working && true)
         {
            if(this.var_1058.indexOf(param1.type) >= 0)
            {
               if(param1 is WindowMouseEvent)
               {
                  _loc2_ = _window.hitTestGlobalPoint(new Point(WindowMouseEvent(param1).stageX,WindowMouseEvent(param1).stageY));
                  if(this.var_1059 == MouseListenerType.const_1420 && !_loc2_)
                  {
                     return;
                  }
                  if(this.var_1059 == MouseListenerType.const_1099 && _loc2_)
                  {
                     return;
                  }
               }
               _window.update(null,param1);
            }
         }
      }
      
      override public function operate(param1:int, param2:int) : void
      {
      }
   }
}
