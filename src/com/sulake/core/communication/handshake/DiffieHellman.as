package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_884:BigInteger;
      
      private var var_2135:BigInteger;
      
      private var var_1609:BigInteger;
      
      private var var_2222:BigInteger;
      
      private var var_1334:BigInteger;
      
      private var var_1608:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1334 = param1;
         this.var_1608 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1334.toString() + ",generator: " + this.var_1608.toString() + ",secret: " + param1);
         this.var_884 = new BigInteger();
         this.var_884.fromRadix(param1,param2);
         this.var_2135 = this.var_1608.modPow(this.var_884,this.var_1334);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1609 = new BigInteger();
         this.var_1609.fromRadix(param1,param2);
         this.var_2222 = this.var_1609.modPow(this.var_884,this.var_1334);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2135.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2222.toRadix(param1);
      }
   }
}
