package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1530:String = "WN_CRETAE";
      
      public static const const_1659:String = "WN_CREATED";
      
      public static const const_1131:String = "WN_DESTROY";
      
      public static const const_1046:String = "WN_DESTROYED";
      
      public static const const_1174:String = "WN_OPEN";
      
      public static const const_995:String = "WN_OPENED";
      
      public static const const_1221:String = "WN_CLOSE";
      
      public static const const_1227:String = "WN_CLOSED";
      
      public static const const_1001:String = "WN_FOCUS";
      
      public static const const_1130:String = "WN_FOCUSED";
      
      public static const const_1185:String = "WN_UNFOCUS";
      
      public static const const_1024:String = "WN_UNFOCUSED";
      
      public static const const_1188:String = "WN_ACTIVATE";
      
      public static const const_371:String = "WN_ACTVATED";
      
      public static const const_1017:String = "WN_DEACTIVATE";
      
      public static const const_1014:String = "WN_DEACTIVATED";
      
      public static const const_489:String = "WN_SELECT";
      
      public static const const_388:String = "WN_SELECTED";
      
      public static const const_861:String = "WN_UNSELECT";
      
      public static const const_779:String = "WN_UNSELECTED";
      
      public static const const_1182:String = "WN_LOCK";
      
      public static const const_1137:String = "WN_LOCKED";
      
      public static const const_1120:String = "WN_UNLOCK";
      
      public static const const_1060:String = "WN_UNLOCKED";
      
      public static const const_1207:String = "WN_ENABLE";
      
      public static const const_727:String = "WN_ENABLED";
      
      public static const const_1123:String = "WN_DISABLE";
      
      public static const const_634:String = "WN_DISABLED";
      
      public static const const_686:String = "WN_RESIZE";
      
      public static const const_203:String = "WN_RESIZED";
      
      public static const const_1161:String = "WN_RELOCATE";
      
      public static const const_511:String = "WN_RELOCATED";
      
      public static const const_1020:String = "WN_MINIMIZE";
      
      public static const const_1226:String = "WN_MINIMIZED";
      
      public static const const_1166:String = "WN_MAXIMIZE";
      
      public static const const_1070:String = "WN_MAXIMIZED";
      
      public static const const_1109:String = "WN_RESTORE";
      
      public static const const_1118:String = "WN_RESTORED";
      
      public static const const_406:String = "WN_CHILD_ADDED";
      
      public static const const_787:String = "WN_CHILD_REMOVED";
      
      public static const const_276:String = "WN_CHILD_RESIZED";
      
      public static const const_278:String = "WN_CHILD_RELOCATED";
      
      public static const WINDOW_NOTIFY_CHILD_ACTIVATED:String = "WN_CHILD_ACTIVATED";
      
      public static const const_545:String = "WN_PARENT_ADDED";
      
      public static const const_1039:String = "WN_PARENT_REMOVED";
      
      public static const const_527:String = "WN_PARENT_RESIZED";
      
      public static const const_1073:String = "WN_PARENT_RELOCATED";
      
      public static const const_816:String = "WN_PARENT_ACTIVATED";
      
      public static const const_507:String = "WN_STATE_UPDATED";
      
      public static const const_530:String = "WN_STYLE_UPDATED";
      
      public static const const_481:String = "WN_PARAM_UPDATED";
      
      public static const UNKNOWN:String = "UNKNOWN";
      
      private static const POOL:Array = [];
       
      
      private var _isRecycled:Boolean;
      
      public function WindowNotifyEvent()
      {
         super("",null,null);
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowNotifyEvent
      {
         var _loc5_:WindowNotifyEvent = false ? POOL.pop() : new WindowNotifyEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_663 = param3;
         _loc5_.var_2030 = param4;
         _loc5_._isRecycled = false;
         return _loc5_;
      }
      
      public function recycle() : void
      {
         if(this._isRecycled)
         {
            throw new Error("Event already recycled!");
         }
         _type = null;
         var_663 = null;
         _window = null;
         this._isRecycled = true;
         POOL.push(this);
      }
      
      override public function clone() : Event
      {
         return allocate(type,_window,var_663,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
