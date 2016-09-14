/*
www.convivial.studio
*/

#pragma once

#include "ofMain.h"
#include "ofxGui.h"
#include "ofxXmlSettings.h"
#include "touchObject.h"
#include "ofxiOS.h"


class ofApp : public ofxiOSApp {


public:

  void setup();
  void update();
  void draw();
  void exit();

    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);


  /* Touches */
  void touchDown(ofTouchEventArgs & touch);
  void touchMoved(ofTouchEventArgs & touch);
  void touchUp(ofTouchEventArgs & touch);
  void touchDoubleTap(ofTouchEventArgs & touch);
  void touchCancelled(ofTouchEventArgs & touch);
  map<int, ofTouchEventArgs> touchMap;

  ofxPanel gui;
  ofxFloatSlider distanceTriangle;
  ofxFloatSlider errorToleranceTriangle;
  ofxToggle drawDebugB;
 // ofxToggle fullScreenB;

  touchObject touchObj;


    int colorTouch;
    
    
};
