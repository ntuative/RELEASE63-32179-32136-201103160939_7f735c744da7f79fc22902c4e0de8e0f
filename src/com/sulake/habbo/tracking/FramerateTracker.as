package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1642:int;
      
      private var var_2308:int;
      
      private var var_1083:int;
      
      private var var_531:Number;
      
      private var var_2310:Boolean;
      
      private var var_2309:int;
      
      private var var_1641:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2308 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2309 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2310 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1083;
         if(this.var_1083 == 1)
         {
            this.var_531 = param1;
            this.var_1642 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1083);
            this.var_531 = this.var_531 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2310 && param3 - this.var_1642 >= this.var_2308 && this.var_1641 < this.var_2309)
         {
            _loc5_ = 1000 / this.var_531;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1641;
            this.var_1642 = param3;
            this.var_1083 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
