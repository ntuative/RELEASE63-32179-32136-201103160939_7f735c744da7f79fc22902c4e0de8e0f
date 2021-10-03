package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1868:int = 0;
      
      public static const const_1641:int = 1;
      
      public static const const_1569:int = 2;
      
      public static const const_1902:int = 3;
      
      public static const const_1838:int = 4;
      
      public static const const_1745:int = 5;
      
      public static const const_1568:int = 10;
      
      public static const const_1901:int = 11;
      
      public static const const_1897:int = 12;
      
      public static const const_1802:int = 13;
      
      public static const const_1964:int = 16;
      
      public static const const_1849:int = 17;
      
      public static const const_1907:int = 18;
      
      public static const const_1951:int = 19;
      
      public static const const_1800:int = 20;
      
      public static const const_1817:int = 22;
      
      public static const const_1793:int = 23;
      
      public static const const_1893:int = 24;
      
      public static const const_1885:int = 25;
      
      public static const const_1758:int = 26;
      
      public static const const_1762:int = 27;
      
      public static const const_1915:int = 28;
      
      public static const const_1794:int = 29;
      
      public static const const_1782:int = 100;
      
      public static const const_1747:int = 101;
      
      public static const const_1880:int = 102;
      
      public static const const_1844:int = 103;
      
      public static const const_1783:int = 104;
      
      public static const const_1789:int = 105;
      
      public static const const_1961:int = 106;
      
      public static const const_1815:int = 107;
      
      public static const const_1888:int = 108;
      
      public static const const_1891:int = 109;
      
      public static const const_1813:int = 110;
      
      public static const const_1779:int = 111;
      
      public static const const_1750:int = 112;
      
      public static const const_1744:int = 113;
      
      public static const const_1924:int = 114;
      
      public static const const_1806:int = 115;
      
      public static const const_1820:int = 116;
      
      public static const const_1886:int = 117;
      
      public static const const_1851:int = 118;
      
      public static const const_1925:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1641:
            case const_1568:
               return "banned";
            case const_1569:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
