class ToolIcon {

  int tempoFlag = 0;
  int upSwitchLight, underSwitchLight;//↑↓の矢印のスイッチを押した時に少しだけ光らせるための変数
  
  void draw() {
    for (int i=0; i<7; i++) {
      pushStyle();
      strokeWeight(3);
      stroke(0);
      if (toolFlag == i ) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      rect(width/2-90+i*30, height-80, 30, 30);
      popStyle();

      tool_var(i);
    }
    tool(toolFlag);
  }

  void tool(int i) {
    switch ( i ) {
    case 0:
      //創る
      cursor(ARROW);
      break;


    case 1:
      //楽器選択
      inst.draw(); 
      break;

    case 2:
      //オクターブ
      cursor(ARROW);
      fill( oct==-1 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-110, 30, 30);
      fill( oct==0 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-140, 30, 30);
      fill( oct==1 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-170, 30, 30);
      fill( oct==2 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-200, 30, 30);
      fill( oct==3 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-230, 30, 30);
      fill( oct==4 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-260, 30, 30);
      image(numberImage[1], width/2-87+i*30, height-77-30, 25, 25);
      image(numberImage[2], width/2-87+i*30, height-77-60, 25, 25);
      image(numberImage[3], width/2-87+i*30, height-77-90, 25, 25);
      image(numberImage[4], width/2-87+i*30, height-77-120, 25, 25);
      image(numberImage[5], width/2-87+i*30, height-77-150, 25, 25);
      image(numberImage[6], width/2-87+i*30, height-77-180, 25, 25);

      break;

    case 3:
      //速度変化
      fill( tempoNum==16 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-170, 30, 30);
      fill( tempoNum==8 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-140, 30, 30);
      fill( tempoNum==4 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-110, 30, 30);
      image(numberImage[4], width/2-87+i*30, height-77-30, 25, 25);
      image(numberImage[7], width/2-87+i*30, height-77-60, 25, 25);
      image(numberImage[0], width/2-87+i*30, height-77-90, 25, 25);
      break;

    case 4:
      //speedを変える
      fill( 255 - (upSwitchLight>0 ? 255 : 0), 255, 255);
      rect(width/2-90+i*30, height-140, 30, 30);
      fill( 255 - (underSwitchLight>0 ? 255 : 0), 255, 255);
      rect(width/2-90+i*30, height-110, 30, 30);
      image(downImage, width/2-87+i*30, height-77-30, 25, 25);
      image(upImg, width/2-87+i*30, height-77-60, 25, 25);
      if ( upSwitchLight > 0 )upSwitchLight--;
      if (underSwitchLight > 0)underSwitchLight--;
      break;

    case 5:
      //逆回り
      fill( speed<0 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-110, 30, 30);
      fill( speed>0 ? 0 : 255, 255, 255);
      rect(width/2-90+i*30, height-140, 30, 30);
      image(rightTurnImage, width/2-87+i*30, height-77-60, 25, 25);
      image(leftTurnImage, width/2-87+i*30, height-77-30, 25, 25);
      break;

    case 6:
      //保存
      fill( 255 - (upSwitchLight>0 ? 255 : 0), 255, 255);
      rect(width/2-90+i*30, height-140, 30, 30);
      fill( 255 - (underSwitchLight>0 ? 255 : 0), 255, 255);
      rect(width/2-90+i*30, height-110, 30, 30);
      
      fill(0);
      text( "S" ,width/2-82+i*30, height-115 );
      text( "L" ,width/2-82+i*30, height-85 );
      if ( upSwitchLight > 0 )upSwitchLight--;
      if (underSwitchLight > 0)underSwitchLight--;
      break;
    }
  }

  void tool_var(int i) {
    int flag = i;
    switch (flag) {
    case 0: // 創る
      image(iconImage[0], width/2-87+i*30, height-77, 25, 25);
      break;
    case 1: 
      // 楽器
      image(iconImage[4], width/2-87+i*30, height-77, 25, 25);
      break;
    case 2: // 音
      image(iconImage[1], width/2-87+i*30, height-77, 25, 25);
      break;
    case 3: // 速さ
      image(iconImage[2], width/2-87+i*30, height-77, 25, 25);
      break;
    case 4: // 拍
      image(iconImage[6], width/2-87+i*30, height-77, 25, 25);
      break;
    case 5: 
      // 逆回り
      image(iconImage[3], width/2-87+i*30, height-77, 25, 25);
      break;

    case 6: 
      // コピー
      image(iconImage[5], width/2-87+i*30, height-77, 25, 25);
      break;
    }
  }
  
  void iconSelect() {
    //tool 選択
    switch (key) {
    case 'a':
      if (toolFlag>0) toolFlag--;
      break;
    case 'd':
      if (toolFlag!=6) toolFlag++;
      break;
    }
  }
  
  void octChange() {
    if ( toolFlag == 2 ) {
      switch (key) {
      case 's':
        if (oct>-1) oct--;
        break;
      case 'w':
        if (oct<4) oct++;
        break;
      }
    }
  }
  
  void tempoChange() {
    if (toolFlag == 3 ) {
      switch (key) {
      case 's':
        if (tempoFlag>0) tempoFlag--;
        break;
      case 'w':
        if (tempoFlag!=2) tempoFlag++;
        break;
      }

      if (tempoFlag==0) tempoNum = 4;
      if (tempoFlag==1) tempoNum = 8;
      if (tempoFlag==2) tempoNum = 16;
    }
  }

  void tempoSpeedChange() {
    if ( toolFlag == 4 ) {
      if ( speed > 0 ) {
        if ( speed<6 && key == 'w' ) {
          speed++;
          upSwitchLight=5;
        }
        if ( speed>1 && key == 's' ) {
          speed--;
          underSwitchLight=5;
        }
      } else {
        if ( speed>-6 && key == 'w' ) {
          speed--;
          upSwitchLight=5;
        }
        if ( speed < -1 && key == 's') {
          speed++;
          underSwitchLight=5;
        }
      }
    }
  }

  void reverseSpin() {
    if ( toolFlag == 5 ) {
      if ( speed > 0 && key == 's' ) {
        speed = -speed;
      }
      if ( speed < 0 && key == 'w' ) {
        speed = -speed;
      }
    }
  }
  
  void save() {
    if ( toolFlag == 6 ) {
      String [] saveData = new String [circle_list.size()];
      for ( int i = 0; i < circle_list.size (); i++ ) {
        saveData[i] = circle_list.get(i).toString();
      }
      saveStrings("./data/circle.txt", saveData);
      upSwitchLight = 5;
    }
  }
  
  void load() {
    if ( toolFlag == 6 ) {
      allDelete();
      String [] loadData = loadStrings("./data/circle.txt");
      for ( int i = 0; i < loadData.length; i++ ) {
        Circle c = new Circle( loadData[i] ) ;
        circle_list.add( c ) ;
      }
      underSwitchLight = 5;
    }
  }

  void circleDelete() {
    if ( keyCode == BACKSPACE ) {
      if ( circle_list.size() > 0 ) {
        circle_list.remove(circle_list.size() - 1 );
      }
    }
    if ( keyCode == ENTER ) {
      allDelete();//とりあえずいれてるだけ
    }
  }

  void allDelete() {
    for (int i = circle_list.size () - 1; i >= 0; i--  ) {
      circle_list.remove(i);
    }
  }
  
/*
  void weather() {
    //とりあえずのメジャーマイナー反転させるもの
    if ( toolFlag == 6 ) {
      if ( keyCode == UP ) {
        weather_flag = false;
        println(weather_flag);
      }
      if ( keyCode == DOWN ) {
        weather_flag = true;
        println(weather_flag);
      }
    }
  }
  */
}