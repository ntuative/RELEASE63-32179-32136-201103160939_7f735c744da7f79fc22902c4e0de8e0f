package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1187:Sound = null;
      
      private var _soundChannel:SoundChannel = null;
      
      private var _volume:Number;
      
      private var var_1471:Boolean;
      
      public function HabboSound(param1:Sound)
      {
         super();
         this.var_1187 = param1;
         this.var_1187.addEventListener(Event.COMPLETE,this.onComplete);
         this._volume = 1;
         this.var_1471 = false;
      }
      
      public function play() : Boolean
      {
         this.var_1471 = false;
         this._soundChannel = this.var_1187.play(0);
         this.volume = this._volume;
         return true;
      }
      
      public function stop() : Boolean
      {
         this._soundChannel.stop();
         return true;
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function set volume(param1:Number) : void
      {
         this._volume = param1;
         if(this._soundChannel != null)
         {
            this._soundChannel.soundTransform = new SoundTransform(this._volume);
         }
      }
      
      public function get position() : Number
      {
         return this._soundChannel.position;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get length() : Number
      {
         return this.var_1187.length;
      }
      
      public function get ready() : Boolean
      {
         return !this.var_1187.isBuffering;
      }
      
      public function get finished() : Boolean
      {
         return !this.var_1471;
      }
      
      private function onComplete(param1:Event) : void
      {
         this.var_1471 = true;
      }
   }
}
