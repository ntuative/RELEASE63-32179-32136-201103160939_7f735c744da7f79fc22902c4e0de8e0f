package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["AchievementData"] = const_200;
         param1["bound_to_parent_rect"] = const_97;
         param1["child_window"] = const_1165;
         param1["embedded_controller"] = const_1048;
         param1["resize_to_accommodate_children"] = const_65;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_847;
         param1["mouse_dragging_target"] = const_272;
         param1["mouse_dragging_trigger"] = const_393;
         param1["mouse_scaling_target"] = const_305;
         param1["mouse_scaling_trigger"] = const_541;
         param1["horizontal_mouse_scaling_trigger"] = const_240;
         param1["vertical_mouse_scaling_trigger"] = const_217;
         param1["observe_parent_input_events"] = const_1097;
         param1["optimize_region_to_layout_size"] = const_435;
         param1["parent_window"] = const_1098;
         param1["relative_horizontal_scale_center"] = const_193;
         param1["relative_horizontal_scale_fixed"] = const_128;
         param1["relative_horizontal_scale_move"] = const_369;
         param1["relative_horizontal_scale_strech"] = const_368;
         param1["relative_scale_center"] = const_1177;
         param1["relative_scale_fixed"] = const_788;
         param1["relative_scale_move"] = const_1214;
         param1["relative_scale_strech"] = const_1145;
         param1["relative_vertical_scale_center"] = const_194;
         param1["relative_vertical_scale_fixed"] = const_129;
         param1["relative_vertical_scale_move"] = const_383;
         param1["relative_vertical_scale_strech"] = const_317;
         param1["on_resize_align_left"] = const_797;
         param1["on_resize_align_right"] = const_451;
         param1["on_resize_align_center"] = const_436;
         param1["on_resize_align_top"] = const_851;
         param1["on_resize_align_bottom"] = const_454;
         param1["on_resize_align_middle"] = const_471;
         param1["on_accommodate_align_left"] = const_1087;
         param1["on_accommodate_align_right"] = const_519;
         param1["on_accommodate_align_center"] = const_907;
         param1["on_accommodate_align_top"] = const_1088;
         param1["on_accommodate_align_bottom"] = const_570;
         param1["on_accommodate_align_middle"] = const_668;
         param1["route_input_events_to_parent"] = const_523;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1225;
         param1["scalable_with_mouse"] = const_1191;
         param1["reflect_horizontal_resize_to_parent"] = const_579;
         param1["reflect_vertical_resize_to_parent"] = const_524;
         param1["reflect_resize_to_parent"] = const_280;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1180;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
