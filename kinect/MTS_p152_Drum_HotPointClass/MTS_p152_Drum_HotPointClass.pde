import ddf.minim.*;
import SimpleOpenNI.*;
import processing.opengl.*;

SimpleOpenNI kinect;

float rotation = 0;

//今回は２個のAudioPlayerオブジェクトを使う
Minim minim;
AudioPlayer kick;
AudioPlayer snare;

//２個のHotpointオブジェクトを宣言
Hotpoint snareTrigger;
Hotpoint kickTrigger;

float s = 1;

void setup(){
  size(1024, 768, OPENGL);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  
  minim = new Minim(this);
  //２個のオーディオファイルをロードする。
  snare = minim.loadFile("hat.wav");
  kick = minim.loadFile("kick.wav");
  
  //ホットポイントをその中心点(x, y, z)とサイズで初期化
  snareTrigger = new Hotpoint(200, 0, 600, 150);
  kickTrigger = new Hotpoint(-200, 0, 600, 150);
}

void draw(){
  background(0);
  kinect.update();
  
  translate(width/2, height/2, -1000);
  rotateX(radians(180));

  translate(0, 0, 1400);
  rotateY(radians(map(mouseX, 0, width, -180, 180)));

  translate(0, 0, s*-1000);
  scale(s);

  stroke(255);

  PVector [] depthPoints = kinect.depthMapRealWorld();
  
  for (int i=0; i<depthPoints.length; i+=10) {
    PVector currentPoint = depthPoints[i];
    
    //各ホットポイントについて、currentPointを内部に含んでいるかを判定
    snareTrigger.check(currentPoint);
    kickTrigger.check(currentPoint);
    
    point(currentPoint.x, currentPoint.y, currentPoint.z);
  }
  
  println(snareTrigger.pointsIncluded);
  
  if (snareTrigger.isHit()){
    snare.play();
  }
  if (!snare.isPlaying()){
    snare.rewind();
    snare.pause();
  }
  
  if (kickTrigger.isHit()){
    kick.play();
  }
  if (!kick.isPlaying()){
    kick.rewind();
    kick.pause();
  }
  
  //各ホットポイントを表示して、ポイントのカウントを消去
  snareTrigger.draw();
  snareTrigger.clear();
  
  kickTrigger.draw();
  kickTrigger.clear();
}

void stop(){
  //AoudioPlayerオブジェクトを２つともクローズする
  kick.close();
  snare.close();
  
  minim.stop();
  super.stop();
}

//キーを使ってズームをコントロール
//↑でズームイン、↓でズームアウト
//sはdraw()内でscale()に渡される
void keyPressed(){
  if (keyCode == 38) s = s + 0.01;
  if (keyCode == 40) s = s - 0.01;
}
























