package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.GetPetInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetSelectedBadgesMessageComposer;
   
   public class UserDataManager implements IUserDataManager
   {
      
      private static const const_1239:int = 1;
      
      private static const const_1240:int = 2;
      
      private static const const_1695:int = 3;
       
      
      private var var_675:Map;
      
      private var _userDataByIds:Map;
      
      private var var_836:Map;
      
      private var var_1542:Array;
      
      private var _connection:IConnection;
      
      public function UserDataManager()
      {
         this.var_1542 = [];
         super();
         this.var_675 = new Map();
         this._userDataByIds = new Map();
         this.var_836 = new Map();
      }
      
      public function dispose() : void
      {
         this._connection = null;
         this.var_675.dispose();
         this.var_675 = null;
         this._userDataByIds.dispose();
         this._userDataByIds = null;
         this.var_836.dispose();
         this.var_836 = null;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function getUserData(param1:int) : IUserData
      {
         return this.getUserDataByType(param1,const_1239);
      }
      
      public function getUserDataByType(param1:int, param2:int) : IUserData
      {
         var _loc3_:* = null;
         var _loc4_:Map = this.var_675.getValue(param2);
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_.getValue(param1);
         }
         return _loc3_;
      }
      
      public function getUserDataByIndex(param1:int) : IUserData
      {
         return this._userDataByIds.getValue(param1);
      }
      
      public function getUserBadges(param1:int) : Array
      {
         if(this._connection != null)
         {
            this._connection.send(new GetSelectedBadgesMessageComposer(param1));
         }
         var _loc2_:* = this.var_836.getValue(param1) as Array;
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         return _loc2_;
      }
      
      public function getUserGivableBadges() : Array
      {
         return this.var_1542;
      }
      
      public function setUserData(param1:IUserData) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.removeUserDataByIndex(param1.id);
         var _loc2_:Map = this.var_675.getValue(param1.type);
         if(_loc2_ == null)
         {
            _loc2_ = new Map();
            this.var_675.add(param1.type,_loc2_);
         }
         _loc2_.add(param1.webID,param1);
         this._userDataByIds.add(param1.id,param1);
      }
      
      public function removeUserDataByIndex(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:IUserData = this._userDataByIds.remove(param1);
         if(_loc2_ != null)
         {
            _loc3_ = this.var_675.getValue(_loc2_.type);
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.remove(_loc2_.webID);
               if(_loc4_ != null)
               {
               }
            }
         }
      }
      
      public function setUserBadges(param1:int, param2:Array) : void
      {
         this.var_836.remove(param1);
         this.var_836.add(param1,param2);
      }
      
      public function setUserGivableBadges(param1:Array) : void
      {
         this.var_1542 = param1;
      }
      
      public function updateFigure(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:IUserData = this.getUserDataByIndex(param1);
         if(_loc4_ != null)
         {
            _loc4_.figure = param2;
            _loc4_.sex = param3;
         }
      }
      
      public function updateCustom(param1:int, param2:String) : void
      {
         var _loc3_:IUserData = this.getUserDataByIndex(param1);
         if(_loc3_ != null)
         {
            _loc3_.custom = param2;
         }
      }
      
      public function updateAchievementScore(param1:int, param2:int) : void
      {
         var _loc3_:IUserData = this.getUserDataByIndex(param1);
         if(_loc3_ != null)
         {
            _loc3_.achievementScore = param2;
         }
      }
      
      public function updateNameByIndex(param1:int, param2:String) : void
      {
         var _loc3_:IUserData = this.getUserDataByIndex(param1);
         if(_loc3_ != null)
         {
            _loc3_.name = param2;
         }
      }
      
      public function getPetUserData(param1:int) : IUserData
      {
         return this.getUserDataByType(param1,const_1240);
      }
      
      public function requestPetInfo(param1:int) : void
      {
         var _loc2_:IUserData = this.getPetUserData(param1);
         if(_loc2_ != null && this._connection != null)
         {
            this._connection.send(new GetPetInfoMessageComposer(_loc2_.webID));
         }
      }
   }
}
