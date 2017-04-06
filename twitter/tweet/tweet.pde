import twitter4j.conf.*;
import twitter4j.internal.async.*;
import twitter4j.internal.org.json.*;
import twitter4j.internal.logging.*;
import twitter4j.http.*;
import twitter4j.internal.util.*;
import twitter4j.api.*;
import twitter4j.util.*;
import twitter4j.internal.http.*;
import twitter4j.*;
 
String msg = "たすけて";
 
String consumerKey = "lI5qulQJ6Vb0O1oMP6vto13y5";
String consumerSecret = "QQe4hLinfjC840m1rdIxUemv2aihjyzxPFMQMwCcltsNcUIRCS";
String accessToken = "3145665278-GtmihU22LRZpiVzZHdbFsMD3JKdMVY2u39stiaW";
String accessSecret = "e1PZQ48qodxd0zlOpQ6Sd1EUNHis6lct23A8zOZlHcBQs";
Twitter myTwitter;
 
int ms;
color bg = color(0, 0, 0);
 
void setup() {
  size(400, 400);
  frameRate(60);
 
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(consumerKey);
  cb.setOAuthConsumerSecret(consumerSecret);
  cb.setOAuthAccessToken(accessToken);
  cb.setOAuthAccessTokenSecret(accessSecret);
  myTwitter = new TwitterFactory(cb.build()).getInstance();
}
 
void draw() {
  background(bg);
  if (millis() - ms > 1000) {
    bg = color(0, 0, 0);
  }
}
 
void mousePressed() {
  try {
    Status st = myTwitter.updateStatus(msg);
    println("Successfully updated the status to [" + st.getText() + "].");
    ms = millis();
    bg = color(0, 0, 255);
  }catch (TwitterException e) {
    println(e.getStatusCode());
    bg = color(255, 0, 0);
  }
}
 
String getDate() {
  String monthStr, dayStr, hourStr, minuteStr, secondStr;
 
  if (month() < 10) {
    monthStr = "0" + month();
  } 
  else {
    monthStr = "" + month();
  }
  if (day() < 10) {
    dayStr = "0" + day();
  } 
  else {
    dayStr = "" + day();
  }
  if (hour() < 10) {
    hourStr = "0" + hour();
  } 
  else {
    hourStr = "" + hour();
  }
  if (minute() < 10) {
    minuteStr = "0" + minute();
  } 
  else {
    minuteStr = "" + minute();
  }
  if (second() < 10) {
    secondStr = "0" + second();
  } 
  else {
    secondStr = "" + second();
  }
 
  return monthStr + "/" + dayStr + ", " + hourStr + ":" + minuteStr + ":" + secondStr;
}