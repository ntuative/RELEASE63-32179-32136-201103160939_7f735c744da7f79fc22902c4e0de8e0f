package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2846:uint;
      
      private var var_146:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_247:IWindowContext;
      
      private var var_1241:IMouseDraggingService;
      
      private var var_1237:IMouseScalingService;
      
      private var var_1239:IMouseListenerService;
      
      private var var_1238:IFocusManagerService;
      
      private var var_1240:IToolTipAgentService;
      
      private var var_1242:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2846 = 0;
         this.var_146 = param2;
         this.var_247 = param1;
         this.var_1241 = new WindowMouseDragger(param2);
         this.var_1237 = new WindowMouseScaler(param2);
         this.var_1239 = new WindowMouseListener(param2);
         this.var_1238 = new FocusManager(param2);
         this.var_1240 = new WindowToolTipAgent(param2);
         this.var_1242 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1241 != null)
         {
            this.var_1241.dispose();
            this.var_1241 = null;
         }
         if(this.var_1237 != null)
         {
            this.var_1237.dispose();
            this.var_1237 = null;
         }
         if(this.var_1239 != null)
         {
            this.var_1239.dispose();
            this.var_1239 = null;
         }
         if(this.var_1238 != null)
         {
            this.var_1238.dispose();
            this.var_1238 = null;
         }
         if(this.var_1240 != null)
         {
            this.var_1240.dispose();
            this.var_1240 = null;
         }
         if(this.var_1242 != null)
         {
            this.var_1242.dispose();
            this.var_1242 = null;
         }
         this.var_146 = null;
         this.var_247 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1241;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1237;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1239;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1238;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1240;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1242;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
