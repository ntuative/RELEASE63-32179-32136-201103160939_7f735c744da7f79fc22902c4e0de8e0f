package com.sulake.habbo.ui
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetFloodControlEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatInputWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatTypingMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   
   public class ChatInputWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_778:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_179:IHabboToolbar;
      
      public function ChatInputWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_778;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.CHAT_INPUT_WIDGET;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
         this.var_179 = this._container.toolbar;
      }
      
      public function dispose() : void
      {
         this.var_778 = true;
         this._container = null;
         this.var_179 = null;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetChatInputWidgetMessage.const_750);
         _loc1_.push(RoomWidgetChatTypingMessage.const_640);
         return _loc1_;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case RoomWidgetChatInputWidgetMessage.const_750:
               _loc2_ = param1 as RoomWidgetChatInputWidgetMessage;
               if(_loc2_ != null)
               {
                  this.positionWindow(_loc2_.window);
               }
               break;
            case RoomWidgetChatTypingMessage.const_640:
               _loc3_ = param1 as RoomWidgetChatTypingMessage;
               if(_loc3_ != null)
               {
                  this._container.roomSession.sendChatTypingMessage(_loc3_.isTyping);
               }
         }
         return null;
      }
      
      private function positionWindow(param1:IWindowContainer) : void
      {
         if(this.var_179 == null)
         {
            return;
         }
         this.var_179.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1136,HabboToolbarIconEnum.CHATINPUT,param1));
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionChatEvent.const_461];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(this._container == null || this._container.events == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionChatEvent.const_461:
               _loc3_ = param1 as RoomSessionChatEvent;
               _loc4_ = parseInt(_loc3_.text);
               _loc2_ = new RoomWidgetFloodControlEvent(_loc4_);
         }
         if(this._container != null && this._container.events != null && _loc2_ != null)
         {
            this._container.events.dispatchEvent(_loc2_);
         }
      }
      
      public function update() : void
      {
      }
   }
}
