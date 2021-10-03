package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1446:String = "WE_CREATE";
      
      public static const const_1613:String = "WE_CREATED";
      
      public static const const_1533:String = "WE_DESTROY";
      
      public static const const_312:String = "WE_DESTROYED";
      
      public static const const_1593:String = "WE_OPEN";
      
      public static const const_1489:String = "WE_OPENED";
      
      public static const const_1505:String = "WE_CLOSE";
      
      public static const const_1551:String = "WE_CLOSED";
      
      public static const const_1422:String = "WE_FOCUS";
      
      public static const const_323:String = "WE_FOCUSED";
      
      public static const const_1590:String = "WE_UNFOCUS";
      
      public static const const_1611:String = "WE_UNFOCUSED";
      
      public static const const_1571:String = "WE_ACTIVATE";
      
      public static const const_1662:String = "WE_ACTIVATED";
      
      public static const const_1552:String = "WE_DEACTIVATE";
      
      public static const const_751:String = "WE_DEACTIVATED";
      
      public static const const_506:String = "WE_SELECT";
      
      public static const const_64:String = "WE_SELECTED";
      
      public static const const_736:String = "WE_UNSELECT";
      
      public static const const_881:String = "WE_UNSELECTED";
      
      public static const const_1921:String = "WE_ATTACH";
      
      public static const const_1963:String = "WE_ATTACHED";
      
      public static const const_1971:String = "WE_DETACH";
      
      public static const const_1764:String = "WE_DETACHED";
      
      public static const const_1496:String = "WE_LOCK";
      
      public static const const_1550:String = "WE_LOCKED";
      
      public static const const_1567:String = "WE_UNLOCK";
      
      public static const const_1661:String = "WE_UNLOCKED";
      
      public static const const_694:String = "WE_ENABLE";
      
      public static const const_286:String = "WE_ENABLED";
      
      public static const const_870:String = "WE_DISABLE";
      
      public static const const_223:String = "WE_DISABLED";
      
      public static const const_1397:String = "WE_RELOCATE";
      
      public static const const_342:String = "WE_RELOCATED";
      
      public static const const_1521:String = "WE_RESIZE";
      
      public static const const_50:String = "WE_RESIZED";
      
      public static const const_1474:String = "WE_MINIMIZE";
      
      public static const const_1518:String = "WE_MINIMIZED";
      
      public static const const_1515:String = "WE_MAXIMIZE";
      
      public static const const_1466:String = "WE_MAXIMIZED";
      
      public static const const_1642:String = "WE_RESTORE";
      
      public static const const_1646:String = "WE_RESTORED";
      
      public static const const_1827:String = "WE_ARRANGE";
      
      public static const const_1830:String = "WE_ARRANGED";
      
      public static const const_103:String = "WE_UPDATE";
      
      public static const const_1843:String = "WE_UPDATED";
      
      public static const const_1908:String = "WE_CHILD_RELOCATE";
      
      public static const const_577:String = "WE_CHILD_RELOCATED";
      
      public static const const_1913:String = "WE_CHILD_RESIZE";
      
      public static const const_283:String = "WE_CHILD_RESIZED";
      
      public static const const_1869:String = "WE_CHILD_REMOVE";
      
      public static const const_566:String = "WE_CHILD_REMOVED";
      
      public static const const_1956:String = "WE_PARENT_RELOCATE";
      
      public static const const_1751:String = "WE_PARENT_RELOCATED";
      
      public static const const_1788:String = "WE_PARENT_RESIZE";
      
      public static const const_1610:String = "WE_PARENT_RESIZED";
      
      public static const const_191:String = "WE_OK";
      
      public static const const_760:String = "WE_CANCEL";
      
      public static const const_104:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_540:String = "WE_SCROLL";
      
      public static const const_171:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_663:IWindow;
      
      protected var var_2031:Boolean;
      
      protected var var_2030:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_663 = param3;
         this.var_2031 = false;
         this.var_2030 = param5;
         super(param1,param4);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_663;
      }
      
      override public function get cancelable() : Boolean
      {
         return this.var_2030;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,this.cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_2031 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_2031;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
