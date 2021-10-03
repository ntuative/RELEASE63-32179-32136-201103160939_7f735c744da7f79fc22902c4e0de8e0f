package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_401:int = 1;
      
      public static const const_263:int = 2;
      
      public static const const_306:int = 3;
      
      public static const const_385:int = 4;
      
      public static const const_219:int = 5;
      
      public static const const_382:int = 1;
      
      public static const const_906:int = 2;
      
      public static const const_745:int = 3;
      
      public static const const_659:int = 4;
      
      public static const const_267:int = 5;
      
      public static const const_707:int = 6;
      
      public static const const_778:int = 7;
      
      public static const const_238:int = 8;
      
      public static const const_367:int = 9;
      
      public static const const_1823:int = 10;
      
      public static const const_892:int = 11;
      
      public static const const_468:int = 12;
       
      
      private var var_434:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_434 = new Array();
         this.var_434.push(new Tab(this._navigator,const_401,const_468,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_498));
         this.var_434.push(new Tab(this._navigator,const_263,const_382,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_498));
         this.var_434.push(new Tab(this._navigator,const_385,const_892,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1101));
         this.var_434.push(new Tab(this._navigator,const_306,const_267,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_498));
         this.var_434.push(new Tab(this._navigator,const_219,const_238,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_835));
         this.setSelectedTab(const_401);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_385;
      }
      
      public function get tabs() : Array
      {
         return this.var_434;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_434)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_434)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_434)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
