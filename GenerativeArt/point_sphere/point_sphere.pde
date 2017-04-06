float v =0;
float a = 0.05;

void setup() {
  size(1080, 960, P3D);
}


void draw() {
  background(0, 15, 30);

  pushMatrix();
  upperLeft();
  popMatrix();

  pushMatrix();
  upperRight();
  popMatrix();

  pushMatrix();
  lowerLeft();
  popMatrix();
}

void upperLeft() {
  //原点を移動
  translate(width/3-40, height/4);
  //回転
  rotateX(frameCount*0.006);
  rotateZ(frameCount*0.001);

  //円状に点を書く
  float radius = 200;

  //球体を作成

  for (int s=0; s<180; s+=10) {
    float radS = radians(s);
    float z = radius * cos(radS);
    for (int t=0; t<360; t+=10) {
      //角度をラジアンに
      float radT = radians(t);

      //点の座標を求める
      float x = radius * sin(radS) * cos(radT);
      float y = radius * sin(radS) * sin(radT);

      //点を描画
      stroke(0, 128, 128);
      strokeWeight(8);
      point(x, y, z);
    }
  }
}


void upperRight() {
  //原点を移動
  translate(2*width/3+40, height/4);
  //回転
  rotateX(frameCount*0.001);
  rotateZ(-frameCount*0.007);

  //円状に点を書く
  float radius = 200;
  float s=0, t=0;
  float lastX=0, lastY=0, lastZ=0;
  //球体を作成

  while ( s <= 180 ) {
    float radianS = radians(s);
    float radianT = radians(t);
    //現在の座標を更新
    float x = radius * sin(radianS) * cos(radianT);
    float y = radius * sin(radianS) * sin(radianT);
    float z = radius * cos(radianS);

    //点を描画
    stroke(0, 128, 128);
    strokeWeight(8);
    point(x, y, z);
    //線を描画
    if (lastX != 0) {
      strokeWeight(1);
      line(lastX, lastY, lastZ, x, y, z);
    }

    lastX = x;
    lastY = y;
    lastZ = z;

    //sとtを同時に更新
    s++;
    t += 10;
  }
}


void lowerLeft() {
  //原点を移動
  translate(width/3-40, 3*height/4-20);
  //回転
  rotateX(frameCount*0.002);
  rotateZ(-frameCount*0.008);

  //円状に点を書く
  float radius = 200;
  float s=0, t=0;
  float lastX=0, lastY=0, lastZ=0;
  //球体を作成

  while ( s <= 180 ) {
    float radianS = radians(s);
    float radianT = radians(t);
    //現在の座標を更新
    float x = radius * sin(radianS) * cos(radianT);
    float y = radius * sin(radianS) * sin(radianT);
    float z = radius * cos(radianS);

    //点を描画
    stroke(0, 128, 128);
    strokeWeight(8);
    point(x, y, z);
    //線を描画
    if (lastX != 0) {
      strokeWeight(1);
      line(lastX, lastY, lastZ, x, y, z);
    }

    lastX = x;
    lastY = y;
    lastZ = z;

    //sとtを同時に更新
    s++;
    t += v;
  }
  
  v+=a;
}