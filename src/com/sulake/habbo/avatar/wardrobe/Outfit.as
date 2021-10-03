package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.display.BitmapData;
   
   public class Outfit implements IOutfit, IAvatarImageListener
   {
       
      
      private var _controller:HabboAvatarEditor;
      
      private var _figure:String;
      
      private var var_906:String;
      
      private var var_16:OutfitView;
      
      private var var_778:Boolean;
      
      public function Outfit(param1:HabboAvatarEditor, param2:String, param3:String)
      {
         super();
         this._controller = param1;
         this.var_16 = new OutfitView(param1.windowManager,param1.assets,param2 != "");
         switch(param3)
         {
            case FigureData.const_77:
            case "m":
            case "M":
               param3 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param3 = "null";
         }
         this._figure = param2;
         this.var_906 = param3;
         this.update();
      }
      
      public function dispose() : void
      {
         if(this.var_16)
         {
            this.var_16.dispose();
            this.var_16 = null;
         }
         this._figure = null;
         this.var_906 = null;
         this.var_778 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_778;
      }
      
      public function update() : void
      {
         var _loc2_:* = null;
         var _loc1_:IAvatarImage = this._controller.avatarRenderManager.createAvatarImage(this.figure,AvatarScaleType.const_86,this.var_906,this);
         if(_loc1_)
         {
            _loc1_.setDirection(AvatarSetType.const_36,int(FigureData.const_770));
            _loc2_ = _loc1_.getImage(AvatarSetType.const_36,true);
            if(this.var_16)
            {
               this.var_16.udpate(_loc2_);
            }
            _loc1_.dispose();
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get gender() : String
      {
         return this.var_906;
      }
      
      public function get view() : OutfitView
      {
         return this.var_16;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.update();
      }
   }
}
