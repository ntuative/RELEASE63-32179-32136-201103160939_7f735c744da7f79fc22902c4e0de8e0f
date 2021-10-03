package com.sulake.habbo.toolbar.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class HabboToolbarSetIconEvent extends Event
   {
      
      public static const const_133:String = "HTIE_SET_TOOLBAR_ICON";
      
      public static const const_1148:String = "HTIE_SET_TOOLBAR_ICON_BITMAP";
      
      public static const const_88:String = "HTIE_SET_TOOLBAR_ICON_STATE";
      
      public static const const_150:String = "HTIE_REMOVE_TOOLBAR_ICON";
       
      
      private var var_795:String;
      
      private var var_1851:String;
      
      private var _bitmapData:BitmapData;
      
      private var var_2612:String;
      
      public function HabboToolbarSetIconEvent(param1:String, param2:String, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.var_795 = param2;
         this.var_1851 = param3;
      }
      
      public function get iconId() : String
      {
         return this.var_795;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function get assetName() : String
      {
         return this.var_1851;
      }
      
      public function get iconState() : String
      {
         return this.var_2612;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         this._bitmapData = param1;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_1851 = param1;
      }
      
      public function set iconState(param1:String) : void
      {
         this.var_2612 = param1;
      }
   }
}
