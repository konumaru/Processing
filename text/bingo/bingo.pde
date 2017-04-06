StringList data;
int flag = 0;
int stop_number = 0;

PFont font;
PImage img;


void setup() {
  fullScreen();
  textAlign(CENTER);
  img = loadImage("bcafe.png");
  font = createFont("MS明朝", 200);
  data = new StringList();
  String [] temp = loadStrings("data.txt");

  for (String name : temp) {
    data.append(name);
  }
}


void draw() {
  //初期化
  background(255);
  image(img, displayWidth-300, displayHeight-150, 524/2, 172/2);

  if (data != null) {
    if (flag==0) {
      data.shuffle();
      fill(0);
      textFont( font );
      text(data.get(0), width/2, height/2+50);
    } else if (flag==1) {
      fill(0);
      textFont( createFont("MS明朝", 200) );
      text(data.get(0), width/2, height/2+50);
    }
  }
}

void mousePressed() {
  flag = 1 - flag;
  if (data != null) data.remove(0);
}