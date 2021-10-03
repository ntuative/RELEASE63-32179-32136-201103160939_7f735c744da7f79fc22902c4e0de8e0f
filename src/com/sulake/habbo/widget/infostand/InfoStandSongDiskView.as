package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   
   public class InfoStandSongDiskView extends InfoStandFurniView
   {
       
      
      private var var_508:IHabboSoundManager;
      
      public function InfoStandSongDiskView(param1:InfostandWidget, param2:String, param3:IHabboCatalog, param4:IHabboSoundManager)
      {
         super(param1,param2,param3);
         this.var_508 = param4;
         this.var_508.events.addEventListener(SongInfoReceivedEvent.TRAX_SONG_INFO_RECEIVED,this.onSongInfoReceived);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.var_508)
         {
            this.var_508.events.removeEventListener(SongInfoReceivedEvent.TRAX_SONG_INFO_RECEIVED,this.onSongInfoReceived);
            this.var_508 = null;
         }
      }
      
      override public function set name(param1:String) : void
      {
         var _loc2_:ITextWindow = var_54.getListItemByName("name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ISongInfo = this.getSongInfoForExtraParam();
         if(_loc3_ == null)
         {
            super.name = param1;
            return;
         }
         _loc2_.text = _loc3_.name;
         _loc2_.visible = true;
         _loc2_.height = _loc2_.textHeight + 5;
         updateWindow();
      }
      
      override public function set description(param1:String) : void
      {
         var _loc2_:ITextWindow = var_54.getListItemByName("description_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ISongInfo = this.getSongInfoForExtraParam();
         if(_loc3_ == null)
         {
            super.description = param1;
            return;
         }
         _loc2_.text = _loc3_.creator;
         _loc2_.visible = true;
         _loc2_.height = _loc2_.textHeight + 5;
         updateWindow();
      }
      
      private function getSongInfoForExtraParam() : ISongInfo
      {
         var _loc1_:String = _widget.furniData.extraParam;
         var _loc2_:String = _loc1_.substr(RoomWidgetEnum.const_680.length,_loc1_.length);
         return this.var_508.musicController.getSongInfo(int(_loc2_));
      }
      
      private function onSongInfoReceived(param1:SongInfoReceivedEvent) : *
      {
         this.name = "";
         this.description = "";
      }
   }
}
