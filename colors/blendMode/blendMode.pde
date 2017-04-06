

void setup(){
  size(960, 540, P2D);
  //HSBカラーモード
  colorMode(HSB, 360, 100, 100, 100);
  //加算合成モード
  blendMode(ADD);
  noLoop();
}


void draw(){
  background(200, 99, 15);
  
  //ランダムな長方形
  for (int i=0; i<360; i++){
     float x = random(width);
     float y = random(height);
     float w = random(50, 100);
     float h = random(50, 100);
     
     int hue = (int)random(160, 230);
     int saturation = 80;
     int brightness = 30;
     
     noStroke();
     fill(hue, saturation, brightness);
     rect(x, y, w, h);
  }
}

void mousePressed(){
 redraw(); 
}