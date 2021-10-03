package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1936:int = 1;
      
      public static const const_1558:int = 2;
       
      
      private var var_919:String;
      
      private var var_2348:int;
      
      private var var_2346:int;
      
      private var var_2353:int;
      
      private var var_2349:int;
      
      private var var_2347:Boolean;
      
      private var var_2161:Boolean;
      
      private var var_2265:int;
      
      private var var_2267:int;
      
      private var var_2350:Boolean;
      
      private var var_2351:int;
      
      private var var_2352:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_919 = param1.readString();
         this.var_2348 = param1.readInteger();
         this.var_2346 = param1.readInteger();
         this.var_2353 = param1.readInteger();
         this.var_2349 = param1.readInteger();
         this.var_2347 = param1.readBoolean();
         this.var_2161 = param1.readBoolean();
         this.var_2265 = param1.readInteger();
         this.var_2267 = param1.readInteger();
         this.var_2350 = param1.readBoolean();
         this.var_2351 = param1.readInteger();
         this.var_2352 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_919;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2348;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2346;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2353;
      }
      
      public function get responseType() : int
      {
         return this.var_2349;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2347;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2161;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2265;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2267;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2350;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2351;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2352;
      }
   }
}
