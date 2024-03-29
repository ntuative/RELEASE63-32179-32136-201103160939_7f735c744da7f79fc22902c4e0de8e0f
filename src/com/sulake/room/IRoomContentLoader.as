package com.sulake.room
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import flash.events.IEventDispatcher;
   
   public interface IRoomContentLoader
   {
       
      
      function dispose() : void;
      
      function getPlaceHolderType(param1:String) : String;
      
      function getPlaceHolderTypes() : Array;
      
      function getContentType(param1:String) : String;
      
      function hasInternalContent(param1:String) : Boolean;
      
      function loadObjectContent(param1:String, param2:IEventDispatcher) : Boolean;
      
      function insertObjectContent(param1:int, param2:int, param3:IAssetLibrary) : Boolean;
      
      function getVisualizationType(param1:String) : String;
      
      function getLogicType(param1:String) : String;
      
      function getVisualizationXML(param1:String) : XML;
      
      function getAssetXML(param1:String) : XML;
      
      function getLogicXML(param1:String) : XML;
      
      function method_2(param1:String) : IGraphicAssetCollection;
   }
}
