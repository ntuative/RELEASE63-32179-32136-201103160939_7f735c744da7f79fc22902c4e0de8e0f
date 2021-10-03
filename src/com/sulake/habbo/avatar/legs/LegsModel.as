package com.sulake.habbo.avatar.legs
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   
   public class LegsModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      public function LegsModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory(FigureData.TROUSERS);
         initCategory(FigureData.const_220);
         initCategory(FigureData.const_273);
         var_191 = true;
         if(!var_16)
         {
            var_16 = new LegsView(this,controller.windowManager,controller.assets);
            if(var_16)
            {
               var_16.init();
            }
         }
      }
   }
}
