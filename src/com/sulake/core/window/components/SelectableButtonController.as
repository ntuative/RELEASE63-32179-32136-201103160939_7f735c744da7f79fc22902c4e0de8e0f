package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class SelectableButtonController extends ButtonController implements ISelectableWindow
   {
       
      
      public function SelectableButtonController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get selector() : ISelectorWindow
      {
         var _loc1_:* = null;
         if(_parent)
         {
            _loc1_ = _parent as WindowController;
            while(_loc1_)
            {
               if(_loc1_ is ISelectorWindow)
               {
                  return _loc1_ as ISelectorWindow;
               }
               _loc1_ = _loc1_.parent;
            }
         }
         return null;
      }
      
      public function get isSelected() : Boolean
      {
         return testStateFlag(WindowState.const_54);
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         setStateFlag(WindowState.const_54,param1);
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2.type == WindowNotifyEvent.const_371)
         {
            if(_parent)
            {
               if(!(_parent is ISelectorWindow))
               {
                  _loc3_ = _parent.parent as WindowController;
                  while(_loc3_)
                  {
                     if(_loc3_ is ISelectorWindow)
                     {
                        _loc4_ = WindowNotifyEvent.allocate(WindowNotifyEvent.WINDOW_NOTIFY_CHILD_ACTIVATED,this,null);
                        _loc3_.update(this,_loc4_);
                        _loc4_.recycle();
                        break;
                     }
                     _loc3_ = _loc3_.parent as WindowController;
                  }
               }
            }
         }
         return super.update(param1,param2);
      }
      
      public function select() : Boolean
      {
         if(getStateFlag(WindowState.const_54))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = WindowNotifyEvent.allocate(WindowNotifyEvent.const_489,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         setStateFlag(WindowState.const_54,true);
         _loc1_.type = WindowNotifyEvent.const_388;
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function unselect() : Boolean
      {
         if(!getStateFlag(WindowState.const_54))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = WindowNotifyEvent.allocate(WindowNotifyEvent.const_861,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         setStateFlag(WindowState.const_54,false);
         _loc1_.type = WindowNotifyEvent.const_779;
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
   }
}
