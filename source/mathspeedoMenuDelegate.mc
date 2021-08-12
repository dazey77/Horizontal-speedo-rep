import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Graphics;



class mathspeedoMenuDelegate extends WatchUi.MenuInputDelegate {
 private var _view as RecordSampleView;
     private var _session as Session?;
 
 
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :item_1) {
        AboutPage = 1;
		   
            
        } 
         if (item == :item_2) {
            //System.println("item 2");  Future ability to go to vertical mode here.
    
         
        }
      if (item == :item_3) {
                mytrackdistance = 0 ;
                trip1 = 0;
                trip2 = 0;
        }
    }

}