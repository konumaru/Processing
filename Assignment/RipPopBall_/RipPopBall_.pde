


//tool選択関係は全て矢印キー
//saveのアイコンの時に"s"で保存　　"l"でロード
//baclspace(mac->delete)で一つ前のもの消去　ENTERで全消去


////やること
//楽器選択でひからせてUIをよくする




import arb.soundcipher.*;
import arb.soundcipher.constants.*;


ArrayList<Circle> circle_list;
Circle current_circle = null;
Instrument inst       = null; 
SoundCipher [] sc = new SoundCipher [8];
ToolIcon toolicon;


color instColor = color(255);
int speed = 3;
int tempoNum = 4;
int quantize = 48;
int oct =0;//オクターブ

boolean circleCancel = false;
boolean instSelectEffect = false;

//String url = "http://rss.weather.yahoo.co.jp/rss/days/4410.xml";
//String description;
//boolean weather_flag = false;


PImage [] iconImage = new PImage [8];
PImage [] numberImage = new PImage [8];
PImage upImg, downImage, rightTurnImage, leftTurnImage;



int toolFlag = 0;


void setup() {
  
  fullScreen(P3D);
  
  circle_list = new ArrayList<Circle>();
  inst        = new Instrument();
  toolicon    = new ToolIcon();
    for ( int i = 0; i < 8; i++ ) {
    sc[i]     = new SoundCipher(this);
  }
  
  textSize( 29 );
  inst.instIn();
  imageLoad();

  //天気取得
  //XML xml = loadXML(url);
  //XML []items=xml.getChild("channel").getChildren("item");
  //description=items[1].getChild("description").getContent();
  //println(description);
  //if ( description.indexOf("雨") != -1 ) {
    //weather_flag = true;
  //}
}


void draw() {
  
  background(0);
  
  pushMatrix();
  translate( 0, 0, -3);
  for (Circle circle : circle_list ) {
    circle.draw();
    circle.effect();
  }
  popMatrix();
  
  instSelectEffecting();
  toolicon.draw();
  
}

void mousePressed() {

  if (mouseX < width && toolFlag==0) {
    Circle c = new Circle( mouseX, mouseY, 0, instColor, speed *  (PI / 384 ), oct );
    circle_list.add( c );  
    current_circle = c ;
    circleCancel = true;
  }
  
  instSelect(); //楽器選択

}

void mouseDragged() {
  if ( circleCancel ) {
    if (mouseX < width && mouseX > 0 && mouseY > 0 && mouseY < height) { // 画面内の時
      float r = dist( current_circle.centerX, current_circle.centerY, mouseX, mouseY );
      current_circle.setRadius(r);
    }
  }
}

void mouseReleased() {
  
  if ( circleCancel ) {
    current_circle.current_mouseX = mouseX;
    current_circle.current_mouseY = mouseY;
    current_circle.degree( tempoNum );//mouseRelesaseした時にテンポの数の分だけ角度をとった点の座標をとる
    current_circle.pitchJudge();//半径の大きさから音程を判定する（ドレミファソラシド）

    if ( dist( current_circle.centerX, current_circle.centerY, mouseX, mouseY ) < 40 ) {
      circle_list.remove(circle_list.size() - 1 ); //円が小さかった時は円を作らない
    }
    circleCancel = false;
  }
  instSelectEffect = false;
}


void keyPressed() {

  toolicon.iconSelect();
  toolicon.octChange();
  toolicon.tempoChange();
  toolicon.tempoSpeedChange();
  toolicon.reverseSpin();
  toolicon.circleDelete();
  //toolicon.weather();
  
  if ( keyCode == 'c' || keyCode == 'c' ) {
    toolicon.save();
  }
  if ( keyCode == 'v' || keyCode == 'v' ) {
    toolicon.load();
  }
}


void mouseWheel(MouseEvent event) {

  float e = event.getCount();

  for (Circle circle : circle_list) {
    circle.moveZ( e ); //mouseWheelでZ座標を動かす
  }
}




void stop() {
  for ( int i = 0; i < 8; i++ ) {
    sc[i].stop();
  }
}