package com.sulake.habbo.toolbar.events
{
   import com.sulake.core.window.IWindowContainer;
   import flash.events.Event;
   
   public class HabboToolbarShowMenuEvent extends Event
   {
      
      public static const const_55:String = "HTSME_ANIMATE_MENU_IN";
      
      public static const const_518:String = "HTSME_ANIMATE_MENU_OUT";
      
      public static const const_1136:String = "HTSME_DISPLAY_WINDOW";
      
      public static const const_1067:String = "HTSME_HIDE_WINDOW";
       
      
      private var var_2269:String;
      
      private var _window:IWindowContainer;
      
      private var var_2542:Boolean;
      
      public function HabboToolbarShowMenuEvent(param1:String, param2:String, param3:IWindowContainer, param4:Boolean = true, param5:Boolean = false, param6:Boolean = false)
      {
         this.var_2269 = param2;
         this._window = param3;
         this.var_2542 = param4;
         super(param1,param5,param6);
      }
      
      public function get menuId() : String
      {
         return this.var_2269;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get alignToIcon() : Boolean
      {
         return this.var_2542;
      }
   }
}
