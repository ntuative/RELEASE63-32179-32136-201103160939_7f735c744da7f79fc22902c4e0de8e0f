package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_2043:Boolean;
      
      protected var var_2040:Boolean;
      
      protected var var_2268:String;
      
      protected var var_2042:Boolean;
      
      protected var var_2041:Boolean;
      
      protected var var_2039:Boolean;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_2803:Boolean;
      
      protected var var_2805:String;
      
      protected var var_2804:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_2043 = false;
         this.var_2040 = false;
         this.var_2268 = "";
         this.var_2042 = false;
         this.var_2041 = false;
         this.var_2039 = false;
         this._confPartnerIntegration = false;
         this.var_2803 = false;
         this.var_2805 = "";
         this.var_2804 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  this.var_2043 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  this.var_2040 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  this.var_2042 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  this.var_2041 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  this.var_2039 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get coppa() : Boolean
      {
         return this.var_2043;
      }
      
      public function get voucher() : Boolean
      {
         return this.var_2040;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return this.var_2042;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return this.var_2041;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return this.var_2039;
      }
      
      public function get date() : String
      {
         return this.var_2268;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return this._confPartnerIntegration;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return this.var_2803;
      }
      
      public function get tracking_header() : String
      {
         return this.var_2805;
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return this.var_2804;
      }
   }
}
