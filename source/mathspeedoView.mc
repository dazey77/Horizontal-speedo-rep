import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.System;
import Toybox.Position;
using Toybox.System;





 
class mathspeedoView extends WatchUi.View {
var myspeed =0;
var rawspeed = 3;
var prevposition; 
var myTimer;
    var lastFrame;
  
 var tripupdatedelay = 0;

 

var char1 =0;
var char2 =0;
var char3 =0;
var char4 =0;
var char5 =0;
var deltadistance;

//var bgdcolour = Graphics.COLOR_WHITE;
//const customcolour =  0x5e1e96;
//const customcolournight = 0x890fff;

const purple66 = 0x7400b8;
const purple56 = 0x8500cc ;
const purple46 = 0x9c56c2 ;
const purple36 = 0x9865b3 ;
const purple26 = 0x9e7cb1 ;
const purple16 = 0xbeabc9;
//var colourArray = [0xbeabc9, 0x9e7cb1, 0x9865b3, 0x9c56c2, 0x8500cc, 0x7400b8];
const tripfont=  Graphics.WatchUi.loadResource(Rez.Fonts.id_font_trip);


// total segments = 33





//mtb range 30mph/48kph
//van range 90mph/145kph
//moto range 186mph/300kph

//mph mtb 15=16 20= 21 seg 30= 33 seg  
//kph mtb    20=   13      30 =20      45kph =30seg
//mph van     30=11    50=18    70=25
//kph van     50 =11   90=20   120=27
//mph moto   30=5      50= 9   70=13  150=27  
//kph moto     50=5    90=10   130=14  250 = 27





  function initialize() {
        View.initialize();
       
    }
    
    
    
   
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        //  lastFrame = Toybox.System.getTimer();
         myTimer = new Timer.Timer();  //FPS timer
    	myTimer.start(method(:timerCallback), (1000 / fps), true);
    	        // System.println("refresh timer start" + fps);

    	        
    }




    
    function timerCallback() {
     WatchUi.requestUpdate();  // calls the onUpdate at 3-10 frames per second.
 
	}  


 
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    if (AboutPage == 0){
	

	if (daynight == 1){
	  dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_WHITE);	
	 dc.clear();
	

	}else if(daynight == 0){
	View.onUpdate(dc);
	

	}
	
	
	//- with the below line KPH, calcspeed and act speed are white text background is white!!
	 //dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);    
	 
	 






	
	
	if (TimerUpdateFlag == 1) {
	myTimer.stop();
	myTimer.start(method(:timerCallback), (1000 / fps), true);
	TimerUpdateFlag = 0;

	}
	
	
	tripupdatedelay = tripupdatedelay + 1 ;
//  ----------------------this is the bit that updates trips, it now just flashes a FPS dot
if (tripupdatedelay == 2) {
    			 dc.setColor(purple36,Graphics.COLOR_TRANSPARENT);
    			 dc.drawText(87, -2,  Graphics.FONT_SMALL,  ". "  ,  Graphics.TEXT_JUSTIFY_LEFT); 	
    			 tripupdatedelay = 0; 
    	}
//  --------------end--------this is the bit that updates trips





//======= Refresh position info, refresth the raw speed and myspeed (corrected into mph/kph)
 var positionInfo = Position.getInfo();

// System.println(myspeed);
               if (positionInfo.speed != null) {
               rawspeed = positionInfo.speed;
    				myspeed = (positionInfo.speed * SpeedCorrection);
    			}
//===end position refresh		
    			
    			
    			
    			
    			
    	
 


  
 
                






if (daynight == 1){
	  dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple26,Graphics.COLOR_TRANSPARENT);	
}

  	
  			if (SpeedCorrection == 3.6) {

 		
  			dc.drawText(150,-5,Graphics.FONT_LARGE,"kp/h",Graphics.TEXT_JUSTIFY_CENTER);
  			
  			
  			if (CurrentRange == mtb) {
  			dc.drawText(28, 298, tripfont,"2", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(28, 285, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(28, 208, tripfont,"3", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(28, 195, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(27, 66, tripfont,"4", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 53, tripfont,"5", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			}
  			
  			
  			  			if (CurrentRange == van) {
  			dc.drawText(27, 323, tripfont,"5", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 310, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(27, 200, tripfont,"9", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 190, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(27, 121, tripfont,"1", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 110, tripfont,"2", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 97, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  		
  			}
  			
  					  			if (CurrentRange == moto) {
  			dc.drawText(132, 377, tripfont,"5", Graphics.TEXT_JUSTIFY_LEFT);
  			//dc.drawText(133, 365, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(55, 375, tripfont,"9", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(55, 362, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  		dc.drawText(28, 290, tripfont,"1", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(28, 277, tripfont,"3", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(28, 264, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(27, 121, tripfont,"2", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 110, tripfont,"5", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 97, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			}
  			
  			
  			}
  			
  					if (SpeedCorrection == 2.236936) {

  			
  			dc.drawText( 150,-5, Graphics.FONT_LARGE, "mph",Graphics.TEXT_JUSTIFY_CENTER);
  			// these are still not in the right place
  			if (CurrentRange == mtb) {
  			dc.drawText(28, 298, tripfont,"1", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(28, 285, tripfont,"5", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(28, 193, tripfont,"2", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(28, 180, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(27, 40, tripfont,"3", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 27, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			}
  			
  			if (CurrentRange == van) {
  			dc.drawText(27, 323, tripfont,"3", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 310, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(27, 230, tripfont,"5", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 217, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(27, 140, tripfont,"7", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 127, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			}
  			
  				if (CurrentRange == moto) {
  			dc.drawText(132, 377, tripfont,"3", Graphics.TEXT_JUSTIFY_LEFT);
  			//dc.drawText(133, 365, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(80, 375, tripfont,"5", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(80, 362, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  		dc.drawText(28, 298, tripfont,"7", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(28, 285, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			
  			dc.drawText(27, 121, tripfont,"1", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 110, tripfont,"5", Graphics.TEXT_JUSTIFY_LEFT);
  			dc.drawText(27, 97, tripfont,"0", Graphics.TEXT_JUSTIFY_LEFT);
  			}
  			
  			
  			
  			
  			
  			
  			}
 //---------------print the speed horizontally============== 			
 // dc.setColor(customcolour,Graphics.COLOR_TRANSPARENT);
 if (daynight == 1){
	  dc.setColor(purple66,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple16,Graphics.COLOR_TRANSPARENT);	
}
 
  
	char1 = ((myspeed.format("%03d")).substring(0,1));	

	char2 = ((myspeed.format("%03d")).substring(1,2));
	
	char3 = ((myspeed.format("%03d")).substring(2,3));

    	dc.drawText(150,170,Graphics.WatchUi.loadResource(Rez.Fonts.id_font_speed),char1,Graphics.TEXT_JUSTIFY_CENTER);  
    		
        dc.drawText(150,70, Graphics.WatchUi.loadResource(Rez.Fonts.id_font_speed),char2,Graphics.TEXT_JUSTIFY_CENTER);   
          
        dc.drawText(150, -30, Graphics.WatchUi.loadResource(Rez.Fonts.id_font_speed), char3, Graphics.TEXT_JUSTIFY_CENTER);
 //--------end-------print the speed horizontally============== 	               
               
               
    if (daynight == 1){
	  dc.setColor(purple26,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
}               

                
                 dc.drawText(
      45,                      // gets the width of the device and divides by 2
   0,                     // gets the height of the device and divides by 2
        Graphics.FONT_SMALL,                    // sets the font sized
      "FPS " + fps ,                          // the String to display
        Graphics.TEXT_JUSTIFY_LEFT            // sets the justification for the textss
                ); 
                  

      if (daynight == 1){
	  dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple26,Graphics.COLOR_TRANSPARENT);	
}          
                
                var stringforparsing;
                stringforparsing = ((mytrackdistance-trip1).format("%05.1f"));
                	char1 =  ((stringforparsing).substring(0,1));	
                	char2 =  ((stringforparsing).substring(1,2));	
                	char3 =  ((stringforparsing).substring(2,3));	
                	char4 =  ((stringforparsing).substring(3,4));	
                	char5 =  ((stringforparsing).substring(4,5));	
                   dc.drawText(3, 335, tripfont,char1, Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(3, 320, tripfont,char2, Graphics.TEXT_JUSTIFY_LEFT);
                     dc.drawText(3, 305, tripfont,char3, Graphics.TEXT_JUSTIFY_LEFT);
                     
                           if (daynight == 1){
	  dc.setColor(purple36,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple46,Graphics.COLOR_TRANSPARENT);	
}   
                      dc.drawText(16, 282, tripfont,".", Graphics.TEXT_JUSTIFY_LEFT);
                       dc.drawText(3, 277, tripfont,char5, Graphics.TEXT_JUSTIFY_LEFT);
                
                 stringforparsing = ((mytrackdistance-trip2).format("%05.1f"));
                	char1 =  ((stringforparsing).substring(0,1));	
                	char2 =  ((stringforparsing).substring(1,2));	
                	char3 =  ((stringforparsing).substring(2,3));	
                	char4 =  ((stringforparsing).substring(3,4));	
                	char5 =  ((stringforparsing).substring(4,5));	
                	   dc.drawText(233, 282, tripfont,".", Graphics.TEXT_JUSTIFY_LEFT);
                       dc.drawText(218, 277, tripfont,char5, Graphics.TEXT_JUSTIFY_LEFT);
                       
                           if (daynight == 1){
	  dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple26,Graphics.COLOR_TRANSPARENT);	
}     
                   dc.drawText(218, 335, tripfont,char1, Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(218, 320, tripfont,char2, Graphics.TEXT_JUSTIFY_LEFT);
                     dc.drawText(218, 305, tripfont,char3, Graphics.TEXT_JUSTIFY_LEFT);
                   
               
                       stringforparsing = ( (mytrackdistance).format("%05d"));
                	char1 =  ((stringforparsing).substring(0,1));	
                	char2 =  ((stringforparsing).substring(1,2));	
                	char3 =  ((stringforparsing).substring(2,3));	
                	char4 =  ((stringforparsing).substring(3,4));	
                	char5 =  ((stringforparsing).substring(4,5));	
                   dc.drawText(3, 60, tripfont,char1, Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(3, 45, tripfont,char2, Graphics.TEXT_JUSTIFY_LEFT);
                     dc.drawText(3, 30, tripfont,char3, Graphics.TEXT_JUSTIFY_LEFT);
                      dc.drawText(3, 15, tripfont,char4, Graphics.TEXT_JUSTIFY_LEFT);
                       dc.drawText(3, 1, tripfont,char5, Graphics.TEXT_JUSTIFY_LEFT);
                

    
	
    //----static text (Horiz)

 
   if (daynight == 1){
	  dc.setColor(purple26,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
}     
    
       dc.drawText(3, 375, tripfont,"T", Graphics.TEXT_JUSTIFY_LEFT);
          dc.drawText(3, 360, tripfont,"1", Graphics.TEXT_JUSTIFY_LEFT);
          
             //dc.setColor(purple26,Graphics.COLOR_TRANSPARENT);
             
    dc.drawText(218, 375, tripfont,"T", Graphics.TEXT_JUSTIFY_LEFT);
          dc.drawText(218, 360, tripfont,"2", Graphics.TEXT_JUSTIFY_LEFT);
          dc.drawText(218, 0, tripfont,"%", Graphics.TEXT_JUSTIFY_LEFT);
           dc.drawText(3, 88, tripfont,"O", Graphics.TEXT_JUSTIFY_LEFT);
           dc.drawText(3, 105, tripfont,"D", Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(3, 122, tripfont,"O", Graphics.TEXT_JUSTIFY_LEFT);
            
            
               if (daynight == 1){
	  dc.setColor(purple16,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple66,Graphics.COLOR_TRANSPARENT);	
}
            // dc.setColor(purple16,Graphics.COLOR_TRANSPARENT);
                 dc.drawText(1, 260, tripfont,"k", Graphics.TEXT_JUSTIFY_LEFT);
                  dc.drawText(9, 241, tripfont,"m", Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(218, 260, tripfont,"k", Graphics.TEXT_JUSTIFY_LEFT);
                  dc.drawText(226, 241, tripfont,"m", Graphics.TEXT_JUSTIFY_LEFT);
     //------     
          
                if (daynight == 1){
	  dc.setColor(purple46,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple36,Graphics.COLOR_TRANSPARENT);	
}         
          
          //------draws battery level (horiz)
         var stats = System.getSystemStats();
    	var batstring = stats.battery.format("%02d");
		char1 = ((batstring).substring(0,1));	
		char2 = ((batstring).substring(1,2));
 		dc.drawText(215, 32, tripfont,char1, Graphics.TEXT_JUSTIFY_LEFT);
  		dc.drawText(215, 20, tripfont,char2, Graphics.TEXT_JUSTIFY_LEFT);
  		//---
    			
    			
    
    
    
                    if (daynight == 1){
	  dc.setColor(purple16,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
}    
    
//=====draw the static bars-----------    
    for (var i = 0; i < 10; i += 1) {
 		dc.drawRectangle((195-(13*i)), (356-i), 14, 30); 
	}
    
       for (var i = 0; i < 23; i += 1) {
  		dc.drawRectangle(50, (334-(13*i)), 30, 14); 
	} 
//===end==draw the static bars-----------    

//=====fill the speed bars-----------  

  if (daynight == 1){
	  dc.setColor(purple16,Graphics.COLOR_TRANSPARENT);	
	}else {
	  dc.setColor(purple66,Graphics.COLOR_TRANSPARENT);	
	}    

 
    for (var i = 0; i < 10; i += 1) {
		    if (i > 5){
				    if (daynight == 1){
					  dc.setColor(purple26,Graphics.COLOR_TRANSPARENT);	
					}else {
					  dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
				}    
		    }
   		if (i < ((rawspeed)/increment)) {
			 dc.fillRectangle((195-(13*i)+1), ((356-i)+1), 12, 28);  
  		}
	}
      
    
    if (daynight == 1){
			  dc.setColor(purple36,Graphics.COLOR_TRANSPARENT);	
			}else {
			  dc.setColor(purple46,Graphics.COLOR_TRANSPARENT);	
		}      
    
    for (var i = 0; i < 23; i += 1) {
    		 if (i > 5){
					    if (daynight == 1){
						  dc.setColor(purple46,Graphics.COLOR_TRANSPARENT);	
						}else {
						  dc.setColor(purple36,Graphics.COLOR_TRANSPARENT);	
					}    
			}
		        if (i > 10){
					    if (daynight == 1){
						  dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
						}else {
						  dc.setColor(purple26,Graphics.COLOR_TRANSPARENT);	
					}    
		    }
		    
		          if (i > 15){
						    if (daynight == 1){
							  dc.setColor(purple66,Graphics.COLOR_TRANSPARENT);	
							}else {
							  dc.setColor(purple16,Graphics.COLOR_TRANSPARENT);	
						}    
		   			 }  
 		if (i < ((rawspeed)/increment)-10) {
  			dc.fillRectangle((50+1), ((334-(13*i))+1), 28, 12);  
  		}
	} 
//===end==fill the speed bars-----------  	
 
 
 
 
          
          
          
          
          
          
          
 //--------------get position and increment distance to odo-----
      if (positionInfo.position != null) {
		  	 if (myposition != null) {
		  	 prevposition = myposition;
		  	 }
    					myposition = positionInfo.position.toRadians();
		
  			  				if (prevposition != null) {
		  	 	  		  	deltadistance = (Geodetic_distance_rad(prevposition[0],prevposition[1],myposition[0],myposition[1]));
		  	 	     		mytrackdistance=mytrackdistance + (deltadistance/1000);
    						}
    	}
  //--------------end get position     
    
    
    
    
    
    
    
    
    
    
//======================the about Page-------------    
       	    }else {
        			Toybox.Attention.backlight(true);
	     			dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_WHITE);	
	   				dc.clear();
	      			dc.setColor(purple56,Graphics.COLOR_TRANSPARENT);	
                 	dc.drawText(1, 1, Graphics.FONT_SMALL,"Trip Reset press & hold +/- for T1/T2", Graphics.TEXT_JUSTIFY_LEFT);
                   	dc.drawText(1, 30, Graphics.FONT_SMALL,"Enter key- Cycle Speed ranges:", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 50, Graphics.FONT_SMALL,"Van 0-90MPH", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 70, Graphics.FONT_SMALL,"Moto 0-186MPH", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 90, Graphics.FONT_SMALL,"MTB 0-30MPH", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 120, Graphics.FONT_SMALL,"Left key- Cycle through Day/Night", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 150, Graphics.FONT_SMALL,"Right key- Backlight on/off", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 180, Graphics.FONT_SMALL,"Up key- km/h speed", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 200, Graphics.FONT_SMALL,"Down- mph speed (km distance)", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 230, Graphics.FONT_SMALL,"Find/Page- Refresh speed 2-10fps", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 270, Graphics.FONT_SMALL,"Trips & Odo in km, unique to app", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 290, Graphics.FONT_SMALL,"Persist after quit/reboot", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 310, Graphics.FONT_SMALL,"Trip range 0-999.9km", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 330, Graphics.FONT_SMALL,"ODO range 0-99,999km", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 360, Graphics.FONT_SMALL,"Vertical mode- Future!", Graphics.TEXT_JUSTIFY_LEFT);
                    dc.drawText(1, 380, Graphics.FONT_SMALL,"www.dazedproductions.co.uk  2021", Graphics.TEXT_JUSTIFY_LEFT);
	    			}
//============END==========the about Page-------------       
    
    
                }
       
  
  
  
    function onHide() {
    }
    
    
    
// find distance between two coordinates------------------
function Geodetic_distance_rad(lat1, lon1, lat2, lon2) {
	var dy = (lat2-lat1);
	var dx = (lon2-lon1);
	var sy = Math.sin(dy / 2);
	sy *= sy;
	var sx = Math.sin(dx / 2);
	sx *= sx;
	var a = sy + Math.cos(lat1) * Math.cos(lat2) * sx;
	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	var R = 6371000; // radius of earth in meters
	return R * c;
}
// end find distance between two coordinates---------------------

}