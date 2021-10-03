package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var _text:String;
      
      private var var_1825:String;
      
      private var var_292:Boolean;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         this._text = param1;
         this.var_1825 = param2;
         this.var_292 = param3;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
      }
      
      public function get toolTip() : String
      {
         return this.var_1825;
      }
      
      public function set toolTip(param1:String) : void
      {
         this.var_1825 = param1;
      }
      
      public function get visible() : Boolean
      {
         return this.var_292;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_292 = param1;
      }
   }
}
