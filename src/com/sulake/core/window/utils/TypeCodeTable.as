package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_746;
         param1["bitmap"] = const_761;
         param1["border"] = const_773;
         param1["border_notify"] = const_1421;
         param1["button"] = const_433;
         param1["button_thick"] = const_691;
         param1["button_icon"] = const_1660;
         param1["button_group_left"] = const_629;
         param1["button_group_center"] = const_783;
         param1["button_group_right"] = const_711;
         param1["canvas"] = const_664;
         param1["checkbox"] = const_875;
         param1["closebutton"] = const_1202;
         param1["container"] = const_348;
         param1["container_button"] = const_879;
         param1["display_object_wrapper"] = const_821;
         param1["dropmenu"] = const_450;
         param1["dropmenu_item"] = const_474;
         param1["frame"] = const_407;
         param1["frame_notify"] = const_1447;
         param1["header"] = const_877;
         param1["html"] = const_1141;
         param1["icon"] = const_1106;
         param1["itemgrid"] = const_1128;
         param1["itemgrid_horizontal"] = const_554;
         param1["itemgrid_vertical"] = const_721;
         param1["itemlist"] = const_1034;
         param1["itemlist_horizontal"] = const_353;
         param1["itemlist_vertical"] = const_381;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1595;
         param1["menu"] = const_1427;
         param1["menu_item"] = const_1511;
         param1["submenu"] = const_1077;
         param1["minimizebox"] = const_1403;
         param1["notify"] = const_1424;
         param1["AchievementData"] = const_618;
         param1["password"] = const_705;
         param1["radiobutton"] = const_734;
         param1["region"] = const_425;
         param1["restorebox"] = const_1588;
         param1["scaler"] = const_715;
         param1["scaler_horizontal"] = const_1506;
         param1["scaler_vertical"] = const_1623;
         param1["scrollbar_horizontal"] = const_452;
         param1["scrollbar_vertical"] = const_722;
         param1["scrollbar_slider_button_up"] = const_998;
         param1["scrollbar_slider_button_down"] = const_1217;
         param1["scrollbar_slider_button_left"] = const_1063;
         param1["scrollbar_slider_button_right"] = const_1163;
         param1["scrollbar_slider_bar_horizontal"] = const_1162;
         param1["scrollbar_slider_bar_vertical"] = const_1037;
         param1["scrollbar_slider_track_horizontal"] = const_1220;
         param1["scrollbar_slider_track_vertical"] = const_1062;
         param1["scrollable_itemlist"] = const_1507;
         param1["scrollable_itemlist_vertical"] = const_456;
         param1["scrollable_itemlist_horizontal"] = const_1023;
         param1["selector"] = const_825;
         param1["selector_list"] = const_718;
         param1["submenu"] = const_1077;
         param1["tab_button"] = const_470;
         param1["tab_container_button"] = const_1153;
         param1["tab_context"] = const_533;
         param1["tab_content"] = const_1055;
         param1["tab_selector"] = const_692;
         param1["text"] = const_453;
         param1["input"] = const_850;
         param1["toolbar"] = const_1432;
         param1["tooltip"] = const_399;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
