package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2371:int;
      
      private var var_1928:String;
      
      private var var_2586:String;
      
      private var var_2589:Boolean;
      
      private var var_2588:Boolean;
      
      private var var_2585:int;
      
      private var var_2584:String;
      
      private var var_2587:String;
      
      private var var_1924:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2371 = param1.readInteger();
         this.var_1928 = param1.readString();
         this.var_2586 = param1.readString();
         this.var_2589 = param1.readBoolean();
         this.var_2588 = param1.readBoolean();
         param1.readString();
         this.var_2585 = param1.readInteger();
         this.var_2584 = param1.readString();
         this.var_2587 = param1.readString();
         this.var_1924 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2371;
      }
      
      public function get avatarName() : String
      {
         return this.var_1928;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2586;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2589;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2588;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2585;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2584;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2587;
      }
      
      public function get realName() : String
      {
         return this.var_1924;
      }
   }
}
