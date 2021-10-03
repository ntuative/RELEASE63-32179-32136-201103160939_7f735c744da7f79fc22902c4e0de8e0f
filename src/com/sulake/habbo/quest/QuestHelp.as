package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollableListWindow;
   import com.sulake.core.window.components.ITextWindow;
   
   public class QuestHelp implements IDisposable
   {
       
      
      private var var_63:QuestCampaign;
      
      private var var_16:IWindow;
      
      private var var_1874:IScrollableListWindow;
      
      private var var_778:Boolean = false;
      
      public function QuestHelp(param1:QuestCampaign)
      {
         super();
         this.var_63 = param1;
         this.createView();
      }
      
      public function dispose() : void
      {
         if(this.var_16)
         {
            this.var_16.dispose();
         }
         this.var_778 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_778;
      }
      
      private function createView() : void
      {
         this.var_16 = this.var_63.controller.questEngine.getXmlWindow("QuestHelp");
         this.var_1874 = this.find("help.content.itemlist") as IScrollableListWindow;
         if(!this.var_16)
         {
            throw new Error("[QuestView] Could not create view for quest help!");
         }
         var _loc1_:ITextWindow = this.find("help.description") as ITextWindow;
         if(_loc1_)
         {
            if(_loc1_.textHeight > _loc1_.height)
            {
               _loc1_.height = _loc1_.textHeight + 5;
            }
         }
      }
      
      public function get view() : IWindow
      {
         return this.var_16;
      }
      
      public function find(param1:String) : IWindow
      {
         var _loc2_:* = null;
         if(this.var_778)
         {
            return null;
         }
         if(this.var_16 is IWindowContainer)
         {
            _loc2_ = IWindowContainer(this.var_16).findChildByName(param1);
         }
         else if(this.var_16 is IItemListWindow)
         {
            _loc2_ = IItemListWindow(this.var_16).getListItemByName(param1);
         }
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
   }
}
