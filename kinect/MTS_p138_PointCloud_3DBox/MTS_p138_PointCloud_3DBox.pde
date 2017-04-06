import processing.opengl.*;
import SimpleOpenNI.*;

SimpleOpenNI kinect;

float rotation = 0;

int boxSize = 150;
PVector boxCenter = new PVector(0, 0, 600);

//この変数は、ズームのために使われる。最初は通常状態。
float s = 1;
void setup() {
  size(1024, 768, OPENGL);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
}

void draw() {
  background(0);
  kinect.update();

  translate(width/2, height/2, -1000);
  rotateX(radians(180));

  //スケーリング時に中心が近くなるように、座標変換の数値を増やした。
  translate(0, 0, 1400);
  rotateY(radians(map(mouseX, 0, width, -180, 180)));

  //全てを大きく表示、つまりズームインする。
  translate(0, 0, s*-1000);
  scale(s);
  println(s);
  stroke(255);
  PVector [] depthPoints = kinect.depthMapRealWorld();

  //このフレームでボックスの内部にあるとわかったポイントの
  //合計数を保存するために、変数を初期化
  int depthPointsInBox = 0;

  for (int i=0; i<depthPoints.length; i+=10) {
    PVector currentPoint = depthPoints[i];

    //入れ子になったif文をループに中で実行
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

  println(depthPointsInBox);

  //色の透過性を設定。０個で透明、100個で完全に不透明な赤
  float boxAlpha = map(depthPointsInBox, 0, 1000, 0, 255);

  translate(boxCenter.x, boxCenter.y, boxCenter.z);


  //fill();の４番目の引数は「アルファ」。これによって色の透過性が決まる
  //これを、ポイントの数に基づいて設定する
  fill(255, 0, 0, boxAlpha);
  stroke(255, 0, 0);
  box(boxSize);
}

//キーを使ってズームをコントロール
//上向き矢印でズームイン、下向き矢印でズームアウト
//sはdraw()の中でscale()に渡される
void keyPressed() {
  //「UP」は「38」と置き換えてもいい
  if (keyCode == 38) {
    s = s+0.01;
  }
  //「DOWN」は「40」と置き換えてもいい
  if (keyCode ==40){
    s = s - 0.01;
  }
}

void mousePressed(){
  save("touchedPoint.png");
}



















