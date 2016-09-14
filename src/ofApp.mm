/*
www.convivial.studio
*/

#include "ofApp.h"


//--------------------------------------------------------------
void ofApp::setup() {


	
//  ofxWin8TouchSetup();
  ofRegisterTouchEvents(this);

  touchObj.setup();

  gui.setup("gui");
  gui.add(distanceTriangle.setup("distance triangle", 400, 1, 1000));
  gui.add(errorToleranceTriangle.setup("errorToleranceTriangle", 0.2, 0.0, 1.0));
  gui.add(drawDebugB.setup("drawDebugB", true));
  //gui.add(fullScreenB.setup("fullScreenB", false));
  //gui.loadFromFile("gui.xml");

  
}


//--------------------------------------------------------------
void ofApp::update() {

	vector<ofPoint>pts;
	for (auto &i : touchMap) {
		auto &touch = i.second;

		pts.push_back(ofPoint(touch.x, touch.y));

	}
	touchObj.update(pts, distanceTriangle);


//	if (fullScreenB) {
//		fullScreenB = false;
//		ofToggleFullscreen();
//	}

}

//--------------------------------------------------------------
void ofApp::draw() {

	ofSetBackgroundColor(20+colorTouch, 20+colorTouch, 20+colorTouch);

    if(touchObj.getIndex().size()>0){
    
        colorTouch=140;
    }
    if(colorTouch>0){
        colorTouch-=5;
    }else if (colorTouch<0){
        colorTouch=0;
    }
    
	if(drawDebugB)touchObj.draw();
	
	ofSetColor(255, 255, 255);
	gui.draw();

}


void ofApp::touchDown(ofTouchEventArgs & touch) {
	touchMap[touch.id] = touch;
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch) {
	touchMap[touch.id] = touch;
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch) {
	touchMap.erase(touch.id);
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch) {

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch) {
	touchMap.erase(touch.id);
}


void ofApp::exit() {
	gui.saveToFile("gui.xml");
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}

