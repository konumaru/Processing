//文字が回る廻る
PFont font;
float red=255, green=255, blue=255;
int [][] flag;
int start=800;
int h=0;
float x, y;
float r=0;
int radius;
int pradius;

int mouseFlag=0;

String str = "本";


void setup() {
  size(640, 480, P3D);
  flag = new int [width][height];
  background(0);
  fill(red, green, blue);

  //
  radius = start-height/2;
  pradius = radius; 

  ///文字
  font = createFont("MS明朝", 200);
  textFont(font);
  //２文字が限界
  if (str.length()==1) text(str, 220, 300);
  else if (str.length()==2) text(str, 120, 300);


  //色取得
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      color c = get(x, y);
      if (red(c)==255 && green(c)==255 && blue(c)==255) flag[x][y] = 1;
    }
  }
}

void draw() {
  //初期化
  background(255); 

  if (mouseFlag==0) {

    //カメラ
    //円の関数を使って、少しずつ半径を狭めていく。
    //カメラの視点だけを変化させていけばいけるはず
    radius -= 1;
    if (h<=400) h++;
    //println(h);
    x = width/2 + ( radius*cos(radians(r)) );
    y = height/2 + ( radius*sin(radians(r)) );
    r++;
    //camera(視点X, 視点Y, 視点Z, 中心点X, 中心点Y, 中心点Z, 天地X, 天地Y, 天地Z);
    camera(x, y, h, width/2, height/2, 0, 0, 1, 0);
  } else {
    //カメラに変数を入れないとリセットされる！
    camera();
  }

  noStroke();
  fill(0);
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      if (flag[x][y] == 1) {    
        pushMatrix();  
        translate(x, y);
        box(1, 1, 100);
        popMatrix();
      }
    }
  }


  //文字の座標を確かめた。
  /*
  fill(255, 0, 0);
   ellipse(220, 300, 10, 10);
   */
}

void mousePressed() {
  mouseFlag = 1-mouseFlag;
}

