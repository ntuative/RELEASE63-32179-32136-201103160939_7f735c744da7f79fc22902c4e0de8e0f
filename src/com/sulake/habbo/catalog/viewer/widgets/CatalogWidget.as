package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import flash.events.IEventDispatcher;
   
   public class CatalogWidget
   {
       
      
      protected var _window:IWindowContainer;
      
      private var _events:IEventDispatcher;
      
      private var var_432:ICatalogPage;
      
      private var var_778:Boolean;
      
      public function CatalogWidget(param1:IWindowContainer)
      {
         super();
         this._window = param1;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_432 = param1;
      }
      
      public function set events(param1:IEventDispatcher) : void
      {
         this._events = param1;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get events() : IEventDispatcher
      {
         return this._events;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_432;
      }
      
      public function dispose() : void
      {
         this._events = null;
         this.var_432 = null;
         this._window = null;
         this.var_778 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_778;
      }
      
      public function init() : Boolean
      {
         return true;
      }
   }
}
