import Toybox.Application;
import Toybox.Lang;
import Toybox.Position;
import Toybox.WatchUi;
import Toybox.System;
var mytrackdistance = 0 ;
var myposition;
var trip1 = 0 ;
var trip2 = 0 ;
var daynight = 0;
var AboutPage = 0;
class mathspeedoApp extends Application.AppBase {



function onPosition( info as Position.Info ) as Void {
    //System.println( "Position " + info.position.toGeoString( Position.GEO_DM ) );
}

function initializeListener() as Void {
    Position.enableLocationEvents( Position.LOCATION_CONTINUOUS, method( :onPosition ) );
   
   	if (Application.Storage.getValue("Track") != null) {
    mytrackdistance = Application.Storage.getValue("Track");
    }
    if (Application.Storage.getValue("Trip1") != null) {
    trip1 = Application.Storage.getValue("Trip1");
    }
    if (Application.Storage.getValue("Trip2") != null) {
    trip2 = Application.Storage.getValue("Trip2");
    }
    if (Application.Storage.getValue("DayNight") != null) {
    daynight = Application.Storage.getValue("DayNight");
    }
    
    if (Application.Storage.getValue("Position") != null) {
	myposition = Application.Storage.getValue("Position");
	}

}

    function initialize() {
        AppBase.initialize();
   
    }

    // onStart() is called on application start up
      function onStart(state) {
      
     //   Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
     	SpeedCorrection = 3.6;
     	fps=4;
     	 
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    
    Storage.setValue("Track", mytrackdistance);
    Storage.setValue("Position", myposition);
       Storage.setValue("Trip1", trip1);
          Storage.setValue("Trip2", trip2);
           Storage.setValue("DayNight", daynight);
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
         initializeListener(); 
        return [ new mathspeedoView(), new mathspeedoDelegate() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as mathspeedoApp {
    return Application.getApp() as mathspeedoApp;
}