package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   
   public class FurnitureJukeboxLogic extends FurnitureMultiStateLogic
   {
       
      
      private var var_2583:Boolean;
      
      public function FurnitureJukeboxLogic()
      {
         super();
      }
      
      override public function dispose() : void
      {
         this.requestDispose();
         super.dispose();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.processUpdateMessage(param1);
         if(object == null)
         {
            return;
         }
         if(object.getModelController().getNumber(RoomObjectVariableEnum.const_833) == 1)
         {
            object.getModelController().setString(RoomWidgetEnum.const_550,RoomWidgetEnum.const_1015);
            _loc2_ = param1 as RoomObjectDataUpdateMessage;
            if(_loc2_ == null)
            {
               return;
            }
            _loc3_ = object.getModelController();
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = _loc3_.getString(RoomObjectVariableEnum.const_83);
            if(_loc4_ == "1")
            {
               this.requestPlayList();
            }
            else if(_loc4_ == "0")
            {
               this.requestStopPlaying();
            }
         }
      }
      
      private function requestPlayList() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         this.var_2583 = true;
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_558,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
      
      private function requestStopPlaying() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_532,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
      
      private function requestDispose() : void
      {
         if(!this.var_2583)
         {
            return;
         }
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_499,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
   }
}
