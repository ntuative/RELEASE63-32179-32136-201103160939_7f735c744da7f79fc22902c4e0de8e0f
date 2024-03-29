package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPublicSpaceCastLibsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.UserCountRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tabs;
   import flash.display.BitmapData;
   
   public class OfficialRoomEntryManager implements IDisposable
   {
      
      private static const const_1321:int = 267;
      
      private static const const_1320:int = 65;
      
      private static const const_1322:int = -70;
       
      
      private var _disposed:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var _userCountRenderer:UserCountRenderer;
      
      private var var_2496:PublicRoomThumbs;
      
      public function OfficialRoomEntryManager(param1:HabboNavigator)
      {
         this.var_2496 = new PublicRoomThumbs();
         super();
         this._navigator = param1;
         this._userCountRenderer = new UserCountRenderer(this._navigator);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._userCountRenderer)
         {
            this._userCountRenderer.dispose();
            this._userCountRenderer = null;
         }
         this._disposed = true;
      }
      
      public function refreshAdFooter(param1:IWindowContainer) : void
      {
         if(this._navigator.data.guestRoomSearchResults == null || this._navigator.data.guestRoomSearchResults.ad == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = IWindowContainer(param1.getChildByName("ad_footer"));
         var _loc4_:IWindowContainer = IWindowContainer(_loc3_.getChildByName("ad_cont"));
         if(_loc4_.numChildren < 1)
         {
            _loc4_.addChild(this.createEntry(1));
         }
         var _loc5_:IWindowContainer = IWindowContainer(_loc4_.getChildAt(0));
         this.refreshEntry(_loc5_,true,1,this._navigator.data.guestRoomSearchResults.ad);
         _loc3_.visible = true;
         ++this._navigator.data.adIndex;
      }
      
      public function createEntry(param1:int) : IWindowContainer
      {
         var _loc2_:IWindowContainer = IWindowContainer(this._navigator.getXmlWindow("grs_official_room_row"));
         var _loc3_:IWindowContainer = IWindowContainer(_loc2_.findChildByName("image_cont"));
         var _loc4_:String = param1 % 2 == 0 ? "_b" : "";
         this._navigator.refreshButton(_loc3_,"rico_rnd_l" + _loc4_,true,null,0);
         this._navigator.refreshButton(_loc3_,"rico_rnd_r" + _loc4_,true,null,0);
         IBitmapWrapperWindow(_loc3_.findChildByName("rico_rnd_m")).bitmap = this._navigator.getButtonImage("rico_rnd_m");
         _loc2_.procedure = this.onCell;
         _loc2_.color = this.getBgColor(param1);
         return _loc2_;
      }
      
      public function refreshEntry(param1:IWindowContainer, param2:Boolean, param3:int, param4:OfficialRoomEntryData) : void
      {
         Util.hideChildren(param1);
         if(param2)
         {
            param1.id = param4.index;
            if(param4.type == OfficialRoomEntryData.const_1684)
            {
               this.refreshFolderEntry(param1,param4);
            }
            else
            {
               this.refreshNormalEntry(param1,param4);
            }
            param1.visible = true;
         }
         else
         {
            param1.height = 0;
            param1.visible = false;
         }
      }
      
      private function getBgColor(param1:int) : uint
      {
         return param1 % 2 != 0 ? 4294967295 : uint(4292797682);
      }
      
      private function refreshNormalEntry(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         this.refreshCell(param1,param2);
         this.refreshDetails(param1,param2);
         this.refreshUserCount(param1,param2);
         param1.height = 68;
      }
      
      private function refreshFolderEntry(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.findChildByName("folder_cont"));
         _loc3_.visible = true;
         var _loc4_:ITextWindow = ITextWindow(_loc3_.findChildByName("folder_name_text"));
         _loc4_.text = param2.popupCaption;
         this._navigator.refreshButton(_loc3_,"arrow_down_white",param2.open,null,0);
         this._navigator.refreshButton(_loc3_,"arrow_right_white",!param2.open,null,0);
         this.refreshFolderImage(_loc3_,param2);
         param1.height = 28;
      }
      
      private function refreshUserCount(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2.showDetails && (param2.type == OfficialRoomEntryData.const_883 || param2.type == OfficialRoomEntryData.const_869))
         {
            _loc3_ = 3;
            _loc4_ = 34;
            _loc5_ = 13;
            this._userCountRenderer.refreshUserCount(param2.maxUsers,param1,param2.userCount,"${navigator.usercounttooltip.users}",param1.width - _loc3_ - _loc4_,param1.height - _loc3_ - _loc5_);
         }
      }
      
      private function refreshCell(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.findChildByName("image_cont"));
         _loc3_.visible = true;
         _loc3_.width = !!param2.showDetails ? int(const_1320) : int(const_1321);
         this.refreshPicText(_loc3_,param2);
         this.refreshRoomImage(_loc3_,param2);
      }
      
      private function refreshPicText(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.findChildByName("picTextContainer"));
         if(param2.picText == "" || param2.showDetails)
         {
            _loc3_.visible = false;
            return;
         }
         _loc3_.visible = true;
         var _loc5_:ITextWindow = ITextWindow(_loc3_.findChildByName("picText"));
         _loc5_.width = param1.width - 30;
         _loc5_.text = param2.picText;
         _loc5_.height = _loc5_.textHeight + 10;
         var _loc6_:* = _loc5_.textHeight > 10;
         var _loc7_:*;
         _loc3_.width = !!_loc6_ ? (_loc7_ = param1.width - 10, _loc3_.width = param1.width - 10, int(_loc7_)) : int(_loc5_.textWidth + 20);
         _loc3_.height = _loc5_.height + 4;
         _loc3_.x = param1.width - _loc3_.width - 5;
         _loc3_.y = param1.height - _loc3_.height - 5;
      }
      
      private function refreshFolderImage(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("folder_image"));
         _loc3_.visible = false;
         if(param2.picRef != "")
         {
            this.refreshCustomImage(param2,_loc3_);
         }
      }
      
      private function refreshRoomImage(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("room_image"));
         _loc3_.visible = false;
         if(param2.picRef != "")
         {
            this.refreshCustomImage(param2,_loc3_);
         }
         else if(param2.publicRoomData != null)
         {
            this.refreshPublicSpaceImage(param1,param2,_loc3_);
         }
         else if(param2.guestRoomData != null)
         {
            this.refreshGuestRoomImage(param1,param2,_loc3_);
         }
         else
         {
            this.refreshEmptyImage(param1,param2,_loc3_);
         }
      }
      
      private function refreshPublicSpaceImage(param1:IWindowContainer, param2:OfficialRoomEntryData, param3:IBitmapWrapperWindow) : void
      {
         var _loc4_:String = this.var_2496.resolveRoomImageName(param2);
         var _loc5_:String = "publicSpace." + _loc4_ + "." + param2.showDetails;
         if(param3.tags[0] == _loc5_)
         {
            param3.visible = true;
            return;
         }
         var _loc6_:* = "officialrooms_defaults/" + _loc4_ + ".png";
         Logger.log("Loading public room image: " + _loc6_ + ", " + param2.publicRoomData.castLibs);
         param3.x = !!param2.showDetails ? int(const_1322) : 0;
         param3.visible = false;
         var _loc7_:OfficialRoomImageLoader = new OfficialRoomImageLoader(this._navigator,_loc6_,param3);
         _loc7_.startLoad();
         param3.tags.splice(0,param3.tags.length);
         param3.tags.push(_loc5_);
      }
      
      private function refreshCustomImage(param1:OfficialRoomEntryData, param2:IBitmapWrapperWindow) : void
      {
         var _loc3_:String = "customImage." + param1.picRef;
         if(param2.tags[0] == _loc3_)
         {
            param2.visible = true;
            return;
         }
         Logger.log("Loading custom image: " + param1.picRef);
         param2.x = 0;
         param2.visible = false;
         var _loc4_:OfficialRoomImageLoader = new OfficialRoomImageLoader(this._navigator,param1.picRef,param2);
         _loc4_.startLoad();
         param2.tags.splice(0,param2.tags.length);
         param2.tags.push(_loc3_);
      }
      
      private function refreshGuestRoomImage(param1:IWindowContainer, param2:OfficialRoomEntryData, param3:IBitmapWrapperWindow) : void
      {
         var _loc4_:String = "guestRoom." + param2.guestRoomData.thumbnail.getAsString();
         if(param3.tags[0] == _loc4_)
         {
            param3.visible = true;
            return;
         }
         Logger.log("Redrawing guest room image");
         param3.x = 0;
         param3.width = 64;
         param3.bitmap = new BitmapData(64,64);
         this._navigator.thumbRenderer.refreshBitmapContent(param3.bitmap,param2.guestRoomData.thumbnail);
         param3.tags.splice(0,param3.tags.length);
         param3.tags.push(_loc4_);
         param3.visible = true;
      }
      
      private function refreshEmptyImage(param1:IWindowContainer, param2:OfficialRoomEntryData, param3:IBitmapWrapperWindow) : void
      {
         if(param3.tags[0] == "empty")
         {
            param3.visible = true;
            return;
         }
         Logger.log("Redrawing empty image");
         param3.x = 0;
         param3.width = 64;
         param3.bitmap = new BitmapData(64,64,false,4291611852);
         param3.tags.splice(0,param3.tags.length);
         param3.tags.push("empty");
         param3.visible = true;
      }
      
      private function onCell(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.setEnterArrowVisibility(param2,true);
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            this.setEnterArrowVisibility(param2,false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.handleClick(param2);
         }
      }
      
      private function setEnterArrowVisibility(param1:IWindow, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc3_:IWindowContainer = IWindowContainer(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IWindowContainer = IWindowContainer(_loc3_.findChildByName("enter_room"));
         if(_loc4_ == null)
         {
            return;
         }
         if(param2)
         {
            this._navigator.refreshButton(_loc4_,"enter_room_l",true,null,0);
            this._navigator.refreshButton(_loc4_,"enter_room_r",true,null,0);
            _loc5_ = IBitmapWrapperWindow(_loc4_.findChildByName("enter_room_m"));
            if(_loc5_.bitmap == null)
            {
               _loc5_.bitmap = this._navigator.getButtonImage("enter_room_m");
            }
            this._navigator.refreshButton(_loc4_,"enter_room_a",true,null,0);
         }
         _loc4_.visible = param2;
      }
      
      private function handleClick(param1:IWindow) : void
      {
         var _loc2_:OfficialRoomEntryData = this.getEntry(param1);
         if(_loc2_ == null)
         {
            return;
         }
         Logger.log("ENTRY CLICKED: " + _loc2_.picText + ", " + _loc2_.guestRoomData + ", " + _loc2_.publicRoomData + ", " + _loc2_.tag);
         if(_loc2_.guestRoomData != null)
         {
            Logger.log("ENTERING ROOM: " + _loc2_.guestRoomData.flatId);
            if(_loc2_.guestRoomData.doorMode == RoomSettingsFlatInfo.const_112)
            {
               this._navigator.passwordInput.show(_loc2_.guestRoomData);
            }
            else
            {
               this._navigator.goToRoom(_loc2_.guestRoomData.flatId,true);
            }
         }
         else if(_loc2_.tag != null)
         {
            Logger.log("MAKING TAG SEARCH: " + _loc2_.tag);
            this._navigator.mainViewCtrl.startSearch(Tabs.const_219,Tabs.const_367,_loc2_.tag);
         }
         else if(_loc2_.publicRoomData != null)
         {
            Logger.log("ENTERING PUBLIC SPACE: " + _loc2_.publicRoomData.nodeId);
            this._navigator.send(new GetPublicSpaceCastLibsMessageComposer(_loc2_.publicRoomData.nodeId));
            this._navigator.mainViewCtrl.close();
         }
         else
         {
            Logger.log("FOLDER CLICKD: " + _loc2_.index);
            _loc2_.toggleOpen();
            this._navigator.mainViewCtrl.refresh();
         }
      }
      
      private function getEntry(param1:IWindow) : OfficialRoomEntryData
      {
         var _loc2_:IWindowContainer = param1 as IWindowContainer;
         if(_loc2_ == null || _loc2_.name != "cont")
         {
            Logger.log("Target not cont");
            return null;
         }
         Logger.log("PARENT NAME: " + param1.parent.name);
         return _loc2_.parent.name == "ad_cont" ? this.findAdEntry() : this.findEntryInOfficialRoomList(_loc2_);
      }
      
      private function findAdEntry() : OfficialRoomEntryData
      {
         return this._navigator.data.guestRoomSearchResults == null ? null : this._navigator.data.guestRoomSearchResults.ad;
      }
      
      private function findEntryInOfficialRoomList(param1:IWindowContainer) : OfficialRoomEntryData
      {
         var _loc3_:* = null;
         if(this._navigator.data.officialRooms == null)
         {
            Logger.log("No official rooms data click");
            return null;
         }
         var _loc2_:int = param1.id;
         Logger.log("Got index: " + _loc2_);
         for each(_loc3_ in this._navigator.data.officialRooms.entries)
         {
            if(_loc3_.index == _loc2_)
            {
               return _loc3_;
            }
         }
         Logger.log("No room found " + _loc2_ + ", " + this._navigator.data.officialRooms.entries.length);
         return null;
      }
      
      private function refreshDetails(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.findChildByName("details_container"));
         _loc3_.visible = param2.showDetails;
         Logger.log("Refreshing details: " + _loc3_.visible);
         if(!param2.showDetails)
         {
            return;
         }
         Util.hideChildren(_loc3_);
         this.refreshEntryCaption(_loc3_,param2);
         this.refreshEntryDesc(_loc3_,param2);
         Logger.log("Refreshed: " + _loc3_.visible + ", " + _loc3_.rectangle);
      }
      
      private function refreshEntryCaption(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:ITextWindow = ITextWindow(param1.getChildByName("entry_caption"));
         _loc3_.visible = true;
         _loc3_.text = this.getPopupCaption(param2);
      }
      
      private function refreshEntryDesc(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:String = this.getPopupDesc(param2);
         if(_loc3_ == "")
         {
            return;
         }
         var _loc5_:ITextWindow = ITextWindow(param1.getChildByName("entry_desc"));
         _loc5_.text = _loc3_;
         _loc5_.visible = true;
      }
      
      public function getPopupCaption(param1:OfficialRoomEntryData) : String
      {
         if(param1.popupCaption != null && param1.popupCaption != "")
         {
            return param1.popupCaption;
         }
         if(param1.guestRoomData != null)
         {
            return param1.guestRoomData.roomName;
         }
         if(param1.publicRoomData != null)
         {
            return this._navigator.getPublicSpaceName(param1.publicRoomData.unitPropertySet,param1.publicRoomData.worldId);
         }
         if(param1.tag != null && param1.tag != "")
         {
            return param1.tag;
         }
         return "NA";
      }
      
      public function getPopupDesc(param1:OfficialRoomEntryData) : String
      {
         if(param1.popupCaption != null && param1.popupCaption != "")
         {
            return param1.popupDesc;
         }
         if(param1.guestRoomData != null)
         {
            return param1.guestRoomData.description;
         }
         if(param1.publicRoomData != null)
         {
            return this._navigator.getPublicSpaceDesc(param1.publicRoomData.unitPropertySet,param1.publicRoomData.worldId);
         }
         return "";
      }
   }
}
