//import com.onformative.leap.*;

import de.voidplus.leapmotion.*;
import development.*;

//LeapMotionP5 _leap;

LeapMotion leap;


int z = 0;

public void setup() {
  size(800, 600, P3D);
  leap = new LeapMotion(this);
  //_leap = new LeapMotionP5(this);
}

public void draw() {
  background(50);
  pushMatrix();
  translate(0, 0, z);
  println("z:" + z);
  fill(255);
  ellipse(width/2, height/2, 300, 300);
  popMatrix();
  //----------------------------------------
  for (Hand hand : leap.getHands ()) {
    //手を描画
    hand.draw();
    //-------------------------------------------------------
    Finger  finger_thumb       = hand.getThumb();
    Finger  finger_indexfinger = hand.getIndexFinger();
    PVector thumb_vector = finger_thumb.getPosition();
    PVector index_vector = finger_indexfinger.getPosition();

    int pinch_distance = (int)PVector.dist(thumb_vector, index_vector);

    if (pinch_distance > 80 ) {
      z += 0.1*( pinch_distance );
    } else if (pinch_distance < 80) {
      z -= 0.1*( pinch_distance );
    } else {
    }

    //println( (int)PVector.dist(thumb_vector, index_vector) );
    println(pinch_distance);
  }
  //----------------------------------------------------------
  /*
  for (Finger finger : leap.getFingers()) {
   PVector finger_position   = finger.getPosition();
   pushStyle();
   fill(255, 0, 0);
   noStroke();
   ellipse(finger_position.x, finger_position.y, 10, 10);
   popStyle();
   }
   */
}

