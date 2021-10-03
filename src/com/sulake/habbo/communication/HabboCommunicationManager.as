package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.messages.outgoing.handshake.DisconnectMessageComposer;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private const const_1977:int = 2;
      
      private var var_290:ICoreCommunicationManager;
      
      private var var_153:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_554:int = 0;
      
      private var var_1452:IMessageConfiguration;
      
      private var var_38:String = "";
      
      private var var_238:Array;
      
      private var var_397:int = -1;
      
      private var var_1301:Timer;
      
      private var var_848:int = 1;
      
      private var var_125:String = "";
      
      private var var_2107:Boolean = false;
      
      private var var_2108:Boolean = false;
      
      private var var_2109:Boolean = false;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1452 = new HabboMessages();
         this.var_238 = [];
         this.var_1301 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),this.onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationInit);
         param1.events.addEventListener(Event.UNLOAD,this.unloading);
      }
      
      public function get mode() : int
      {
         return this.var_554;
      }
      
      public function set mode(param1:int) : void
      {
         this.var_554 = param1;
      }
      
      public function get port() : int
      {
         if(this.var_238.length == 0 || this.var_397 < 0 || this.var_397 >= this.var_238.length)
         {
            return 0;
         }
         return this.var_238[this.var_397];
      }
      
      private function unloading(param1:Event) : void
      {
         if(this._connection)
         {
            this._connection.send(new DisconnectMessageComposer());
            this._connection.dispose();
            this._connection = null;
         }
      }
      
      override public function dispose() : void
      {
         if(this._connection)
         {
            this._connection.dispose();
            this._connection = null;
         }
         if(this.var_290)
         {
            this.var_290.release(new IIDCoreCommunicationManager());
            this.var_290 = null;
         }
         if(this.var_153)
         {
            this.var_153.release(new IIDHabboConfigurationManager());
            this.var_153 = null;
         }
         super.dispose();
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            this.var_290 = param2 as ICoreCommunicationManager;
            this.var_290.connectionStateListener = this;
            this.var_290.registerProtocolType(HabboProtocolType.const_1125,WedgieProtocol);
            this._connection = this.var_290.createConnection(HabboConnectionType.const_245,ConnectionType.const_1061);
            _loc3_ = this.var_290.getProtocolInstanceOfType(HabboProtocolType.const_1125);
            this._connection.registerMessageClasses(this.var_1452);
            this._connection.protocol = _loc3_;
            this._connection.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            this._connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this._connection.addEventListener(Event.CONNECT,this.onConnect);
         }
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param2 != null)
         {
            Logger.log("Habbo Communication Manager: init based on configuration: " + this.var_153);
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            this.var_153 = param2 as IHabboConfigurationManager;
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            this.var_238 = [];
            this.var_38 = this.var_153.getKey("connection.info.host",null);
            if(this.var_38 == null)
            {
               Core.crash("connection.info.host was not defined",Core.const_292);
               return;
            }
            _loc3_ = this.var_153.getKey("connection.info.port",null);
            if(_loc3_ == null)
            {
               Core.crash("connection.info.port was not defined",Core.const_292);
               return;
            }
            if(this.var_153.keyExists("local.environment") && this.var_153.getKey("local.environment") == "true")
            {
               this.var_38 = this.var_153.getKey("connection.info.host.local");
               _loc3_ = this.var_153.getKey("connection.info.port.local");
            }
            _loc4_ = this.validateHost();
            if(!_loc4_)
            {
               Core.crash("Tried to connect to an invalid host: " + this.var_38,Core.const_292);
               return;
            }
            _loc5_ = _loc3_.split(",");
            for each(_loc6_ in _loc5_)
            {
               this.var_238.push(parseInt(_loc6_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + this.var_38);
            Logger.log("Connection Host: " + this.var_38);
            Logger.log("Connection Ports: " + this.var_238);
            Logger.log("Habbo Connection Info:" + this._connection);
            this.var_2108 = true;
            if(this.var_2109)
            {
               this.nextPort();
            }
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      private function validateHost() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Array = this.var_38.split(".");
         if(_loc1_.length >= 2)
         {
            _loc2_ = _loc1_.length - 1;
            if(_loc1_[_loc2_] == "com" && (_loc1_[_loc2_ - 1] == "habbo" || _loc1_[_loc2_ - 1] == "sulake"))
            {
               return true;
            }
            if(_loc1_[_loc2_] == "net" && _loc1_[_loc2_ - 1] == "varoke")
            {
               return true;
            }
         }
         return false;
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_245:
               if(this.var_153 == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_292);
                  return;
               }
               if(this._connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_292);
                  return;
               }
               this.var_2109 = true;
               if(this.var_2108)
               {
                  this.nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      private function nextPort() : void
      {
         var _loc1_:int = 0;
         if(this._connection.connected)
         {
            Logger.log("Warning: Already connected so will not try to connect again!");
            return;
         }
         ++this.var_397;
         if(this.var_397 >= this.var_238.length)
         {
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + this.var_848);
            ++this.var_848;
            _loc1_ = this.const_1977;
            if(this.var_238.length == 1)
            {
               _loc1_++;
            }
            if(this.var_848 > _loc1_)
            {
               if(this.var_2107)
               {
                  return;
               }
               this.var_2107 = true;
               Core.error("Connection failed to host " + this.var_38 + " ports " + this.var_238,true,Core.const_292);
               return;
            }
            this.var_397 = 0;
         }
         this._connection.timeout = this.var_848 * 10000;
         this._connection.init(this.var_38,this.var_238[this.var_397]);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + this.var_238[this.var_397]);
         this.tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + this.var_848 + " attempts");
      }
      
      private function tryNextPort() : void
      {
         this.var_1301.addEventListener(TimerEvent.TIMER,this.onTryNextPort);
         this.var_1301.start();
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         this.var_1301.stop();
         this.nextPort();
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + this.var_238[this.var_397]);
         this.tryNextPort();
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!this.var_290 ? this.var_290.queueConnection(HabboConnectionType.const_245,param1) : null;
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         if(this.var_290)
         {
            this.var_290.addConnectionMessageEvent(HabboConnectionType.const_245,param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = this.var_153.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1504,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1584,String(param2));
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1458,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1576,param1 + " " + param2);
         if(this.var_125.length > 0)
         {
            this.var_125 += ",R:" + param1;
         }
         else
         {
            this.var_125 = "R:" + param1;
         }
         if(this.var_125.length > 150)
         {
            this.var_125 = this.var_125.substring(this.var_125.length - 150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",this.var_125);
      }
      
      public function messageSent(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1580,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1612,param1 + " " + param2);
         if(this.var_125.length > 0)
         {
            this.var_125 += ",S:" + param1;
         }
         else
         {
            this.var_125 = "S:" + param1;
         }
         if(this.var_125.length > 150)
         {
            this.var_125 = this.var_125.substring(this.var_125.length - 150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",this.var_125);
      }
   }
}
