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

import org.gicentre.handy.*;

static String consumer_key = "lI5qulQJ6Vb0O1oMP6vto13y5";
static String consumer_secret = "QQe4hLinfjC840m1rdIxUemv2aihjyzxPFMQMwCcltsNcUIRCS";
static String oauth_token = "3145665278-GtmihU22LRZpiVzZHdbFsMD3JKdMVY2u39stiaW";
static String oauth_token_secret = "e1PZQ48qodxd0zlOpQ6Sd1EUNHis6lct23A8zOZlHcBQs";

String keywords[] = {"異能力を授ける"};

TwitterStream twStream;
HandyRenderer h;

String tweet = "";
boolean flag = false;

void setup() {
  fullScreen();
  frameRate(15);
  background(0);
  PFont myFont = createFont("Meiryo", 20);
  textFont(myFont);
  
  smooth();
  h = new HandyRenderer(this);
  
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setDebugEnabled(true);
  cb.setOAuthConsumerKey(consumer_key);
  cb.setOAuthConsumerSecret(consumer_secret);
  cb.setOAuthAccessToken(oauth_token);
  cb.setOAuthAccessTokenSecret(oauth_token_secret);
  
  twStream = new TwitterStreamFactory(cb.build()).getInstance();
  twStream.addListener(listener);
  
  FilterQuery filterQuery = new FilterQuery();
  filterQuery.track(keywords);
  twStream.filter(filterQuery);
  
}

void draw() {
  //fadeToBlack();

  if(flag) {
    h.setRoughness(5);
    
    int dx = int(random(width / 2));
    int dy = int(random(height / 2));

    strokeWeight(5);
    fill(230);
    stroke(0,255,255); 
    h.rect(dx, dy, 700, 250);
    fill(0,0,0);
    text(tweet, dx+140, dy+60, 500, 500);
    
    flag = false;
  }
}

// This listens for new tweet
StatusListener listener = new StatusListener() {
  public void onStatus(Status status) {

    if(!status.isRetweet()) {
      flag = true;
      println("@" + status.getUser().getScreenName() + " - " + status.getText());

      tweet = status.getText();
    }
  }

  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
//    System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
//    System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
  public void onScrubGeo(long userId, long upToStatusId) {
//    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }
  public void onStallWarning(StallWarning warning) {
//    System.out.println("Got stall warning: " + warning);
  }
  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};

void fadeToBlack(){
  noStroke();
  fill(0,10);
  rectMode(CORNER);
  rect(0,0,width,height);
}