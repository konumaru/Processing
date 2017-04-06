class Circle {
  float current_mouseX, current_mouseY;

  float centerX, centerY, radius;
  color col;


  boolean start_flag = false;

  float tempoX, tempoY, tempo, tempoSpeed;
  float theta;
  float [] dotX = new float [16];
  float [] dotY = new float [16];

  boolean effectOn = false;
  boolean music_judge = false;
  int duple = 0;
  int trans = 220;
  int circleEffect = 0;
  int soundCount = 1;
  float posZ = 0;
  color c;

  int tempo_num;
  int pitch;
  int oct = 0;
  int instNum;

  Circle(float _x, float _y, float _r, color _col, float _tempoSpeed, int _oct) {
    centerX = _x;
    centerY = _y;
    radius = _r;
    col = _col;
    tempoSpeed = _tempoSpeed;
    oct = _oct;
    tempo += ( frameCount % quantize ) * tempoSpeed;
    for ( int i = 0; i < 8; i++ ) {
      if ( col == inst.c[i] ) instNum = i;
    }
  }

  Circle( String _data ) {

    String [] data = _data.split(",") ;

    centerX    = float(data[0]);
    centerY    = float(data[1]);
    radius     = float(data[2]);
    col        = int( data[3] );
    start_flag = boolean(data[4]);
    tempoX     = float(data[5]);
    tempoY     = float(data[6]);
    tempo      = float(data[7]);
    tempoSpeed = float(data[8]);
    theta      = float(data[9]);

    for ( int i = 0; i < 16; i++ ) {
      dotX[i] = float(data[10+i]);
    }

    for ( int i = 0; i < 16; i++ ) {
      dotY[i] = float(data[26+i]);
    }

    effectOn     = boolean(data[42]);
    music_judge  = boolean(data[43]);
    duple        = int(data[44]);
    trans        = int(data[45]);
    circleEffect = int(data[46]);
    soundCount   = int(data[47]);
    posZ         = float(data[48]);
    c            = int(data[49]);
    tempo_num    = int(data[50]);
    pitch        = int(data[51]);
    oct          = int(data[52]);
    instNum      = int(data[53]);
  }




  String toString() {
    String data = "";
    data += centerX + ",";
    data += centerY + ",";
    data += radius + ",";
    data += col + ",";
    data += start_flag + ",";
    data += tempoX+ ",";
    data += tempoY + ",";
    data += tempo + ",";
    data += tempoSpeed + ",";
    data += theta + ",";

    for ( int i = 0; i < 16; i++ ) {
      data += dotX[i] + ",";
    }

    for ( int i = 0; i < 16; i++ ) {
      data += dotY[i] + ",";
    }

    data += effectOn + ",";
    data += music_judge + ",";
    data += duple + ",";
    data += trans + ",";
    data += circleEffect + ",";
    data += soundCount + ",";
    data += posZ + ",";
    data += c + ",";
    data += tempo_num + ",";
    data += pitch + ",";
    data += oct + ",";
    data += instNum + ",";
    return data;
  }

  void setRadius(float r) {
    radius = r;
  }

  void setColor(color c ) {
    col = c;
  }

  void settempoSpeed( float s ) {
    tempoSpeed = s;
  }


  void draw() {

    pushMatrix();
    translate(0, 0, posZ);
    pushStyle();
    noFill();
    stroke(col);
    strokeWeight(8);
    ellipse( centerX, centerY, radius*2, radius*2);
    //線と赤丸を描画
    if ( start_flag == true ) {
      //中心の小さい円←これを楽器ごとでマークを変えてみたい
      fill( col );
      ellipse( centerX, centerY, 20, 20 ); 

      //線と円をテンポの分だけ書く
      //theta = theta + 0.03;
      for ( int i=0; i<tempo_num; i++ ) {
        //音がなる瞬間の円(音符)
        strokeWeight( 2 );
        stroke(col);
        line( centerX, centerY, dotX[i], dotY[i]  );      
        noStroke();
        fill( col );//// -80???する
        ellipse( dotX[i], dotY[i], 25, 25 );
      }

      //動いてる円()
      tempoX = centerX + radius*cos(tempo + theta);
      tempoY = centerY + radius*sin(tempo + theta);
      fill(255, 0, 0);
      translate( 0, 0, 3 );
      ellipse( tempoX, tempoY, 25, 25);
      tempo = tempo + tempoSpeed;
    }
    popStyle();
    popMatrix();
  }


  void degree( int _tempo_num ) {
    tempo_num = _tempo_num;
    theta = atan2(current_mouseY-centerY, current_mouseX-centerX);

    start_flag = true; //円の中の線と中心の円を書くスイッチをいれる

    for ( int i=0; i<tempo_num; i++ ) {
      //tempoの丸とlineの分だけ円上に点の座標を求める
      dotX[i] = centerX + radius * cos( theta + (TWO_PI/tempo_num)*i ) ;
      dotY[i] = centerY + radius * sin( theta + (TWO_PI/tempo_num)*i ) ;
    }
  }


  //effect & music 判定、出力
  void effect() {
    music_judge = false;

    //effect判定
    if ( (tempoSpeed < 0 ? -1 : 1) * tempo > TWO_PI / tempo_num * soundCount  ) {
      effectOn = true;
      music_judge = true;
      duple = tempoSpeed < 0 ? tempo_num - 1 - ( soundCount - 1 )  % tempo_num : soundCount % tempo_num;
      soundCount++;
    }


    if (effectOn) {
      pushMatrix();
      translate(0, 0, posZ);
      pushStyle();
      noStroke();
      fill(col, trans);
      ellipse(dotX[duple], dotY[duple], 30+circleEffect, 30+circleEffect);
      popStyle();
      popMatrix();
      trans -= 20;
      circleEffect += 7;
      if (trans < 0) {
        effectOn = false;
      }
      //音が出る
      if (music_judge) {
        music();
        music_judge = false;
      }
    } else {
      //値を初期化
      trans = 220;
      circleEffect = 0;
    }
  }
  void music() {
    float [] pitches = { 
      pitch, pitch + 4 , pitch + 7 //3音重ねる weatherがtrueで3,falseで4
    };
    //(音階, 音量, 長さ)
    sc[instNum].playChord( pitches, 80, 0.8);
  }

  void pitchJudge() {

    //radiusの大きさで音程をきめる
    if (radius<80) {
      pitch=60+(oct*12);
    } else if (radius<120) {
      pitch=62+(oct*12);
    } else if (radius<160) {
      pitch=64+(oct*12);
    } else if (radius<200) {
      pitch=65+(oct*12);
    } else if (radius<240) {
      pitch=67+(oct*12);
    } else if (radius<280) {
      pitch=69+(oct*12);
    } else if (radius<320) {
      pitch=71+(oct*12);
    } else {
      pitch=72+(oct*12);
    }
  }
  void moveZ(float z) {
    posZ += z;
  }
}

