package com.sulake.habbo.avatar.torso
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   
   public class TorsoModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      public function TorsoModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory(FigureData.const_246);
         initCategory(FigureData.const_179);
         initCategory(FigureData.CHEST_ACCESSORIES);
         initCategory(FigureData.const_237);
         var_191 = true;
         if(!var_16)
         {
            var_16 = new TorsoView(this,controller.windowManager,controller.assets);
            if(var_16)
            {
               var_16.init();
            }
         }
      }
   }
}
