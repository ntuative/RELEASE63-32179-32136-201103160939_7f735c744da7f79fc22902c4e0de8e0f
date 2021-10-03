package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_180:String;
      
      private var _text:ITextWindow;
      
      private var var_287:int;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function test(param1:int) : Boolean
      {
         this._text.text = this.var_180.substring(0,param1) + "...";
         return this._text.textHeight > this.var_287;
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         this.var_180 = param1;
         this._text = param2;
         this.var_287 = param3;
      }
   }
}
