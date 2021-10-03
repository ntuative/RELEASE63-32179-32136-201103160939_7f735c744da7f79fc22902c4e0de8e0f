package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1628:IID;
      
      private var var_778:Boolean;
      
      private var var_1074:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1628 = param1;
         this.var_1074 = new Array();
         this.var_778 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1628;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_778;
      }
      
      public function get receivers() : Array
      {
         return this.var_1074;
      }
      
      public function dispose() : void
      {
         if(!this.var_778)
         {
            this.var_778 = true;
            this.var_1628 = null;
            while(this.var_1074.length > 0)
            {
               this.var_1074.pop();
            }
            this.var_1074 = null;
         }
      }
   }
}
