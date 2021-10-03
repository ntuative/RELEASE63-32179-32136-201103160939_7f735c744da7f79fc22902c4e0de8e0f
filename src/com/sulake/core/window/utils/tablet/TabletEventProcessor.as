package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2871:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_142 = param1.desktop;
         var_74 = param1.var_1260 as WindowController;
         var_174 = param1.var_1263 as WindowController;
         var_150 = param1.renderer;
         var_830 = param1.var_1262;
         param2.begin();
         param2.end();
         param1.desktop = var_142;
         param1.var_1260 = var_74;
         param1.var_1263 = var_174;
         param1.renderer = var_150;
         param1.var_1262 = var_830;
      }
   }
}
