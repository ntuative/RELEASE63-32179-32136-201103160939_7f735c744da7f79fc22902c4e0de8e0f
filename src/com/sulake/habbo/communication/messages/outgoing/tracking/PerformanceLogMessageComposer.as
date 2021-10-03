package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2396:int = 0;
      
      private var var_1499:String = "";
      
      private var var_1934:String = "";
      
      private var var_2395:String = "";
      
      private var var_2392:String = "";
      
      private var var_1681:int = 0;
      
      private var var_2391:int = 0;
      
      private var var_2394:int = 0;
      
      private var var_1498:int = 0;
      
      private var var_2393:int = 0;
      
      private var var_1496:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2396 = param1;
         this.var_1499 = param2;
         this.var_1934 = param3;
         this.var_2395 = param4;
         this.var_2392 = param5;
         if(param6)
         {
            this.var_1681 = 1;
         }
         else
         {
            this.var_1681 = 0;
         }
         this.var_2391 = param7;
         this.var_2394 = param8;
         this.var_1498 = param9;
         this.var_2393 = param10;
         this.var_1496 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2396,this.var_1499,this.var_1934,this.var_2395,this.var_2392,this.var_1681,this.var_2391,this.var_2394,this.var_1498,this.var_2393,this.var_1496];
      }
   }
}
