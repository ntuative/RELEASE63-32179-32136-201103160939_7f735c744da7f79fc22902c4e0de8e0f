package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_147:String = "hex";
      
      public static const const_41:String = "int";
      
      public static const const_265:String = "uint";
      
      public static const const_254:String = "Number";
      
      public static const const_39:String = "Boolean";
      
      public static const const_53:String = "String";
      
      public static const const_260:String = "Point";
      
      public static const const_228:String = "Rectangle";
      
      public static const const_148:String = "Array";
      
      public static const const_234:String = "Map";
       
      
      private var var_601:String;
      
      private var var_180:Object;
      
      private var _type:String;
      
      private var var_2452:Boolean;
      
      private var var_2828:Boolean;
      
      private var var_2453:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_601 = param1;
         this.var_180 = param2;
         this._type = param3;
         this.var_2452 = param4;
         this.var_2828 = param3 == const_234 || param3 == const_148 || param3 == const_260 || param3 == const_228;
         this.var_2453 = param5;
      }
      
      public function get key() : String
      {
         return this.var_601;
      }
      
      public function get value() : Object
      {
         return this.var_180;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2452;
      }
      
      public function get range() : Array
      {
         return this.var_2453;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_147:
               return "0x" + uint(this.var_180).toString(16);
            case const_39:
               return Boolean(this.var_180) == true ? "true" : "false";
            case const_260:
               return "Point(" + Point(this.var_180).x + ", " + Point(this.var_180).y + ")";
            case const_228:
               return "Rectangle(" + Rectangle(this.var_180).x + ", " + Rectangle(this.var_180).y + ", " + Rectangle(this.var_180).width + ", " + Rectangle(this.var_180).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_234:
               _loc3_ = this.var_180 as Map;
               _loc1_ = "<var key=\"" + this.var_601 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_148:
               _loc4_ = this.var_180 as Array;
               _loc1_ = "<var key=\"" + this.var_601 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_260:
               _loc5_ = this.var_180 as Point;
               _loc1_ = "<var key=\"" + this.var_601 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_228:
               _loc6_ = this.var_180 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_601 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_147:
               _loc1_ = "<var key=\"" + this.var_601 + "\" value=\"" + "0x" + uint(this.var_180).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_601 + "\" value=\"" + this.var_180 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
