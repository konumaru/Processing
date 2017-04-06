//piano
//2015/07/20
//1-3-19 小沼塁

//A〜F、J〜Lで白鍵を弾ける
//W,E,U,I,O,Pで黒鍵を弾ける
//左右の方向キーを押すか右下にあるボタンをクリックで音階を変えられる

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine0, sine1;

int [] push_white=new int[22];
int [] push_black=new int[22];
int [] black=new int[28];
int music_rank=0, dx=0, rank=0;
SineWave [] sine=new SineWave[18];

void setup() {
  size(1200, 750 );
  frameRate(120);
  for (int i=0; i<28; i+=7) {
    black[2+i]=black[6+i]=1;
  }
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
}

void draw() {
  pushMatrix();  
  scale(3);
  background(255);
  if(rank>4) rank=4;
  if(rank<-3) rank=-3;
  //Slide_right
  if (music_rank==1) dx-=2;
  if (dx<=-350) {
    dx=0;
    music_rank=0;
  }
  //Slide_left
  if (music_rank==-1) dx+=2;
  if (dx>=350) {
    dx=0;
    music_rank=0;
  }
  //白鍵＿配置
  for (int i=0; i<22; i++) {
    if (push_white[i]==0) fill(255);
    else if (push_white[i]==1) fill(123);
    stroke(0);
    rect((-350+i*50)+dx, 0, 50, 200);
  }
  //黒鍵＿配置
  for (int i=0; i<22; i++) {
    if (black[i]==0) {
      if (push_black[i]==0) fill(0);
      else if (push_black[i]==1) fill(100);
      rect((-350+30+i*50)+dx, 0, 40, 100);
    }
  }
  control();
  popMatrix();
}


//音階＿キー入力
void keyPressed() {
  if (keyCode==RIGHT) {
    if (rank<4) music_rank++;
    rank=rank+music_rank;
  }
  if (keyCode==LEFT) {
    if (rank>-3) music_rank--;
    rank=rank+music_rank;
  }
  onkai_open();
}
//音階＿マウス
void mousePressed() {
  if ( dist(mouseX, mouseY, 320*3, 225*3)<15*3 ) {
    if (rank<4) music_rank++;
    rank=rank+music_rank;
  }
  if( dist(mouseX, mouseY, 280*3, 225*3)<15*3 ){
    if (rank>-3) music_rank--;
    rank=rank+music_rank;
  }
}
void keyReleased() {
  onkai_close();
}
void stop() {
  out.close();
  minim.stop();
  super.stop();
}

//control
void control() {
  //ボタン
  fill(255);
  ellipse(320, 225, 30, 30);
  ellipse(280, 225, 30, 30);
  fill(0);
  triangle(312, 216, 312, 235, 332, 226);
  triangle(288, 216, 288, 235, 268, 226);
  //音階
  fill(0);
  textSize(36);
  text(rank, 40, 235);
}

//音を出す
void onkai_open() {
  switch(key) {
    //白鍵
  case 'a':
    push_white[7]=1;
    float oct=pow(2, int (0/7)+rank);
    sine[0] = new SineWave(261.63*oct, 0.5, out.sampleRate());
    out.addSignal(sine[0]);
    break;
  case 's': 
    push_white[8]=1;
    oct=pow(2, int (1/7)+rank);
    sine[1] = new SineWave(293.66*oct, 0.5, out.sampleRate());
    out.addSignal(sine[1]);
    break;
  case 'd': 
    push_white[9]=1;
    oct=pow(2, int (2/7)+rank);
    sine[2] = new SineWave(329.63*oct, 0.5, out.sampleRate());
    out.addSignal(sine[2]);
    break;
  case 'f': 
    push_white[10]=1;
    oct=pow(2, int (3/7)+rank);
    sine[3] = new SineWave(349.23*oct, 0.5, out.sampleRate());
    out.addSignal(sine[3]);
    break;
  case 'j': 
    push_white[11]=1;
    oct=pow(2, int (4/7)+rank);
    sine[4] = new SineWave(392.00*oct, 0.5, out.sampleRate());
    out.addSignal(sine[4]);
    break;
  case 'k': 
    push_white[12]=1;
    oct=pow(2, int (5/7)+rank);
    sine[5] = new SineWave(440.00*oct, 0.5, out.sampleRate());
    out.addSignal(sine[5]);
    break;
  case 'l': 
    push_white[13]=1;
    oct=pow(2, int (6/7)+rank);
    sine[6] = new SineWave(493.88*oct, 0.5, out.sampleRate());
    out.addSignal(sine[6]);
    break;
  case ';':
    push_white[14]=1;
    oct=pow(2, int (7/7)+rank);
    sine[7] = new SineWave(261.63*oct, 0.5, out.sampleRate());
    out.addSignal(sine[7]);
    break;
    //黒鍵
  case 'w': 
    oct=pow(2, int (0/7)+rank);
    sine[10] = new SineWave(277.18*oct, 0.5, out.sampleRate());
    out.addSignal(sine[10]);
    push_black[7]=1;
    break;
  case 'e': 
    oct=pow(2, int (1/7)+rank);
    sine[11] = new SineWave(311.13*oct, 0.5, out.sampleRate());
    out.addSignal(sine[11]);
    push_black[8]=1;
    break;
  case 'u': 
    oct=pow(2, int (3/7)+rank);
    sine[13] = new SineWave(369.99*oct, 0.5, out.sampleRate());
    out.addSignal(sine[13]);
    push_black[10]=1;
    break;
  case 'i': 
    oct=pow(2, int (4/7)+rank);
    sine[14] = new SineWave(415.3*oct, 0.5, out.sampleRate());
    out.addSignal(sine[14]);
    push_black[11]=1;
    break;
  case 'o': 
    oct=pow(2, int (5/7)+rank);
    sine[15] = new SineWave(466.16*oct, 0.5, out.sampleRate());
    out.addSignal(sine[15]);
    push_black[12]=1;
    break;
  case 'p': 
    oct=pow(2, int (7/7)+rank);
    sine[17] = new SineWave(277.18*oct, 0.5, out.sampleRate());
    out.addSignal(sine[17]);
    push_black[14]=1;
    break;
  }
}
//音を止める
void onkai_close() {
  switch(key) {
    //白鍵
  case 'a': 
    push_white[7]=0;
    out.removeSignal(sine[0]);
    break;
  case 's': 
    push_white[8]=0;
    out.removeSignal(sine[1]);
    break;
  case 'd': 
    push_white[9]=0;
    out.removeSignal(sine[2]);
    break;
  case 'f': 
    push_white[10]=0;
    out.removeSignal(sine[3]);
    break;
  case 'j': 
    push_white[11]=0;
    out.removeSignal(sine[4]);
    break;
  case 'k': 
    push_white[12]=0;
    out.removeSignal(sine[5]);
    break;
  case 'l': 
    push_white[13]=0;
    out.removeSignal(sine[6]);
    break;
  case ';': 
    push_white[14]=0;
    out.removeSignal(sine[7]);
    break;
    //黒鍵
  case 'w': 
    push_black[7]=0;
    out.removeSignal(sine[10]);
    break;
  case 'e': 
    push_black[8]=0;
    out.removeSignal(sine[11]);
    break;
  case 'u': 
    push_black[10]=0;
    out.removeSignal(sine[13]);
    break;
  case 'i': 
    push_black[11]=0;
    out.removeSignal(sine[14]);
    break;
  case 'o': 
    push_black[12]=0;
    out.removeSignal(sine[15]);
    break;
  case 'p': 
    push_black[14]=0;
    out.removeSignal(sine[17]);
    break;
  }
}