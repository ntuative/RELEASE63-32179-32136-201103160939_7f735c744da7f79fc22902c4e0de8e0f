package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1658:int;
      
      private var _name:String;
      
      private var var_1440:int;
      
      private var var_2708:int;
      
      private var var_2250:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var _figure:String;
      
      private var var_2706:int;
      
      private var var_2707:int;
      
      private var var_2709:int;
      
      private var var_2677:int;
      
      private var var_2449:int;
      
      private var _ownerName:String;
      
      private var var_534:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1658;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1440;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2708;
      }
      
      public function get experience() : int
      {
         return this.var_2250;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2706;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2707;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2709;
      }
      
      public function get respect() : int
      {
         return this.var_2677;
      }
      
      public function get ownerId() : int
      {
         return this.var_2449;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_534;
      }
      
      public function flush() : Boolean
      {
         this.var_1658 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1658 = param1.readInteger();
         this._name = param1.readString();
         this.var_1440 = param1.readInteger();
         this.var_2708 = param1.readInteger();
         this.var_2250 = param1.readInteger();
         this.var_2706 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2707 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2709 = param1.readInteger();
         this._figure = param1.readString();
         this.var_2677 = param1.readInteger();
         this.var_2449 = param1.readInteger();
         this.var_534 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
