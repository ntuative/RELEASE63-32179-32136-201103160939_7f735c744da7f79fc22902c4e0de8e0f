package com.sulake.habbo.help.cfh
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.help.CallForHelpMessageComposer;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.HelpViewController;
   import com.sulake.habbo.help.help.IHelpViewController;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class CallForHelpTextInput extends HelpViewController implements IHelpViewController
   {
      
      private static const const_1263:int = 30;
      
      private static const const_1264:int = 253;
      
      private static const const_1265:int = 10;
       
      
      public function CallForHelpTextInput(param1:HelpUI, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
      }
      
      override public function render() : void
      {
         if(container != null)
         {
            container.dispose();
         }
         if(main.component.callForHelpData.userSelected)
         {
            container = buildXmlWindow("report_user_send") as IWindowContainer;
         }
         else
         {
            container = buildXmlWindow("help_cfh_send") as IWindowContainer;
         }
         if(container == null)
         {
            return;
         }
         var _loc1_:IWindow = container.findChildByName("send");
         if(_loc1_ != null)
         {
            _loc1_.setParamFlag(WindowParam.const_30);
            _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onSend);
         }
         var _loc2_:IWindow = container.findChildByName("cancel");
         if(_loc2_ != null)
         {
            _loc2_.setParamFlag(WindowParam.const_30);
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCancel);
         }
         super.render();
      }
      
      private function onSend(param1:WindowMouseEvent) : void
      {
         this.sendCallForHelp();
      }
      
      private function onCancel(param1:WindowMouseEvent) : void
      {
         main.showUI(HabboHelpViewEnum.const_184);
      }
      
      override public function update(param1:* = null) : void
      {
         super.update(param1);
         if(container == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = container.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(WindowEvent.const_104,this.onTextWindowEvent);
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = container.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.maxChars = const_1264;
         if(_loc2_.numLines < const_1265)
         {
            return;
         }
         _loc2_.text = _loc2_.text.slice(0,_loc2_.text.length - 1);
         _loc2_.maxChars = _loc2_.length;
      }
      
      private function sendCallForHelp() : void
      {
         if(container == null)
         {
            return;
         }
         var inputField:ITextFieldWindow = container.findChildByName("input") as ITextFieldWindow;
         if(inputField == null)
         {
            return;
         }
         if(inputField.text == "")
         {
            windowManager.alert("${generic.alert.title}","${help.cfh.error.nomsg}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return;
         }
         if(inputField.text.length < const_1263)
         {
            windowManager.alert("${generic.alert.title}","${help.cfh.error.msgtooshort}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return;
         }
         main.sendMessage(new CallForHelpMessageComposer(inputField.text,1,main.component.callForHelpData.topicIndex,main.component.callForHelpData.reportedUserId));
         main.hideUI();
      }
   }
}
