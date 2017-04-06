

String url = "http://rss.weather.yahoo.co.jp/rss/days/4410.xml";
String description;
void setup() {
  XML xml = loadXML(url);
  XML []items=xml.getChild("channel").getChildren("item");
  description=items[1].getChild("description").getContent();
  println(description);
  if ( description.indexOf("雨") != -1 ){
    println( "rain" );
  }else{
    println( "hare" );
  }
}
void draw() {
  background(0);
  fill(255);
  
 
}
void mouseDragged() { // Scroll the list by dragging 
}

