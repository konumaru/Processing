import ddf.minim.*;
import SimpleOpenNI.*;
import processing.opengl.*;

//minimのオブジェクト
Minim minim;
AudioPlayer player;

SimpleOpenNI kinect;

float rotation = 0;

//エッジ検出（ある瞬間だけ音を出す）に使用
boolean wasJustInBox = false;

int boxSize = 150;
PVector boxCenter = new PVector(0, 0, 600);

float s = 1;

void setup() {
  size(1024, 768, OPENGL);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();

  //MinimとAudioPlayerを初期化
  minim = new Minim(this);
  player = minim.loadFile("kick.wav");
}

void draw() {
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
  int depthPointsInBox = 0;

  for (int i=0; i<depthPoints.length; i+=10) {
    PVector currentPoint = depthPoints[i];
    if (currentPoint.x > boxCenter.x - 
      boxSize/2 && currentPoint.x < boxCenter.x + boxSize/2) {
      if (currentPoint.y > boxCenter.y - 
        boxSize/2 && currentPoint.y < boxCenter.y + boxSize/2) {
        if (currentPoint.z > boxCenter.z - 
          boxSize/2 && currentPoint.z < boxCenter.z + boxSize/2) {
          depthPointsInBox++;
        }
      }
    }
    point(currentPoint.x, currentPoint.y, currentPoint.z);
  }
  float boxAlpha = map(depthPointsInBox, 0, 1000, 0, 255);

  //エッジ検出。この時点でボックス内に存在するか
  boolean isInBox = (depthPointsInBox > 0);
  //ちょうど外から中に入ってきた場合だけ、再生を開始
  if (isInBox && !wasJustInBox) { 
    player.play();
  }
  
  //全て再生し終わったら、一時停止して巻き戻す
  if (!player.isPlaying()){
    //rewind()が巻き戻すための命令
    player.rewind();
    player.pause();
  }
  
  //次回のために、現在の状態を保存
  wasJustInBox = isInBox;
  
  translate(boxCenter.x, boxCenter.y, boxCenter.z);
  
  fill(255, 0, 0, boxAlpha);
  stroke(255, 0, 0);
  box(boxSize);
}


void stop(){
  player.close();
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





















