import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Timer;

var SpeedCorrection;
var TimerUpdateFlag = 0;
var fps = 6;
const van = 40.233601; // speed range in m/s 90mph, 144kph, 40.2336 m/s
const mtb = 13.41; // speed range in m/s 13.41m/s 48kph 30mph
const moto = 83.333; // 300kph, 186 MPH, 83.333 m/s
var CurrentRange = van;
var increment = 1.2573; //increment in ms per segment 0.4191 mtb, 1.2573 van, 2.604 Moto


class mathspeedoDelegate extends WatchUi.BehaviorDelegate {
 var  buttonTimer = new Timer.Timer();  //FPS timer
 var backLightStatus = 0;
   var pressedKey = 0;
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new mathspeedoMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    
    
    		     function onKey(keyEvent) { 
		    
    	AboutPage = 0;  //if someone is in the about page, clear it.
    	//System.println(AboutPage);
		        
		         pressedKey = keyEvent.getKey();  //set the key that was pressed		      
		        		    		if (pressedKey == 2) {      												
		     						 	//start the timer 
		     						 	 buttonTimer.start(method(:timerBtnCallback), 3000, true);
		   							}
		     						 if (pressedKey == 3) {   
		     						 //start the timer  
		     						 	 buttonTimer.start(method(:timerBtnCallback), 3000, true);
								    }
								    
								  	if (pressedKey == 5) {      			  //-----quits app when Quit is pressed
									WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
								    }
								    
								    if (pressedKey == 11) {      		//left arrow- day/night																	
										if (daynight ==1) {
										daynight = 0;
										Toybox.Attention.backlight(true);
										backLightStatus=1;
										}else if (daynight ==0) {
										daynight = 1;
										Toybox.Attention.backlight(false);
										backLightStatus=0;
										}
									}
									
									
								    if (pressedKey == 12) {      			//Right arrow- backlight	
										if (backLightStatus ==1) {
											backLightStatus = 0;
											Toybox.Attention.backlight(false);
											}else if (backLightStatus ==0) {
											backLightStatus = 1;
											Toybox.Attention.backlight(true);
											}
										}
									
								    if (pressedKey == 13) {      			
										SpeedCorrection = 3.6;
									    }
									    
								    if (pressedKey == 8) {      			
										SpeedCorrection = 2.236936;
										}
										
								  	if (pressedKey == 6) {      	//find key.  Add fps up to 10		
											if (fps < 9){
											fps = fps + 2;
											TimerUpdateFlag = 1;
											}
									}
									
								    if (pressedKey == 17) {      	//page key.  remove fps down to 2		
											if (fps > 3){
											fps = fps - 2;
											TimerUpdateFlag = 1;
											}
								    }
								    
								   if (pressedKey == 4) {      	//cycle the speed ranges with enter key	
											if (CurrentRange == van){
											CurrentRange = moto;
											increment = 2.604;
																						
											}else if (CurrentRange == moto){
												CurrentRange = mtb;
											increment = 0.4191;
											
											}else if (CurrentRange == mtb){
											CurrentRange = van;
											increment = 1.2573;
											}
								    }
								    
								    
		        return true;
		    }
    
    function onKeyReleased(keyEvent) {
		//timer only runs as long as key held down    						 	
		buttonTimer.stop();   
    }
    
  function timerBtnCallback() {
 			 if (pressedKey == 2) {      			
				trip1= mytrackdistance;
				//System.println("trip 1 reset");
		   		}
		      if (pressedKey == 3) {    
		     	 //  System.println("trip 2 reset");
				trip2= mytrackdistance;
				}
	}  
    
    
    

}