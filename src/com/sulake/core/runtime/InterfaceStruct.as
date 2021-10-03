package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1392:IID;
      
      private var var_1723:String;
      
      private var var_102:IUnknown;
      
      private var var_734:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1392 = param1;
         this.var_1723 = getQualifiedClassName(this.var_1392);
         this.var_102 = param2;
         this.var_734 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1392;
      }
      
      public function get iis() : String
      {
         return this.var_1723;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_102;
      }
      
      public function get references() : uint
      {
         return this.var_734;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_102 == null;
      }
      
      public function dispose() : void
      {
         this.var_1392 = null;
         this.var_1723 = null;
         this.var_102 = null;
         this.var_734 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_734;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_734) : uint(0);
      }
   }
}
