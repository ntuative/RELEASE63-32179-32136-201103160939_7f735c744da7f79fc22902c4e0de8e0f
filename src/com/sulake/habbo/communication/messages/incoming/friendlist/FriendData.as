package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_906:int;
      
      private var var_799:Boolean;
      
      private var var_1827:Boolean;
      
      private var _figure:String;
      
      private var var_1400:int;
      
      private var var_1923:String;
      
      private var var_1925:String;
      
      private var var_1924:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_906 = param1.readInteger();
         this.var_799 = param1.readBoolean();
         this.var_1827 = param1.readBoolean();
         this._figure = param1.readString();
         this.var_1400 = param1.readInteger();
         this.var_1923 = param1.readString();
         this.var_1925 = param1.readString();
         this.var_1924 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_906;
      }
      
      public function get online() : Boolean
      {
         return this.var_799;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1827;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get categoryId() : int
      {
         return this.var_1400;
      }
      
      public function get motto() : String
      {
         return this.var_1923;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1925;
      }
      
      public function get realName() : String
      {
         return this.var_1924;
      }
   }
}
