package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_31;
      
      private static var var_126:Stage;
      
      private static var var_292:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_695:Boolean = true;
      
      private static var var_114:DisplayObject;
      
      private static var var_1321:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_126 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_114)
            {
               var_126.removeChild(var_114);
               var_126.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_126.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_126.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_126.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_695 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_292;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_292 = param1;
         if(var_292)
         {
            if(var_114)
            {
               var_114.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_114)
         {
            var_114.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_695)
         {
            _loc1_ = var_1321[_type];
            if(_loc1_)
            {
               if(var_114)
               {
                  var_126.removeChild(var_114);
               }
               else
               {
                  var_126.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_126.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_126.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_126.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_114 = _loc1_;
               var_126.addChild(var_114);
            }
            else
            {
               if(var_114)
               {
                  var_126.removeChild(var_114);
                  var_126.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_126.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_126.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_126.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_114 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_31:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_287:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_1497:
                  case MouseCursorType.const_174:
                  case MouseCursorType.const_1486:
                  case MouseCursorType.const_1480:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_695 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1321[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_114)
         {
            var_114.x = param1.stageX - 2;
            var_114.y = param1.stageY;
            if(_type == MouseCursorType.const_31)
            {
               var_292 = false;
               Mouse.show();
            }
            else
            {
               var_292 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_114 && _type != MouseCursorType.const_31)
         {
            Mouse.hide();
            var_292 = false;
         }
      }
   }
}
