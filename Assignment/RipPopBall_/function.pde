

void imageLoad() {
  iconImage[0] = loadImage("circle.png");
  iconImage[1] = loadImage("music.png");
  iconImage[2] = loadImage("tempo.png");
  iconImage[3] = loadImage("turn.png");
  iconImage[4] = loadImage("piano.png");
  iconImage[5] = loadImage("save.png");
  iconImage[6] = loadImage("up_down.png");
  iconImage[7] = loadImage("cross.png");
  numberImage[0] = loadImage("sixteen.png");
  numberImage[1] = loadImage("one.png");
  numberImage[2] = loadImage("two.png");
  numberImage[3] = loadImage("three.png");
  numberImage[4] = loadImage("four.png");
  numberImage[5] = loadImage("five.png");
  numberImage[6] = loadImage("six.png");
  numberImage[7] = loadImage("eight.png");
  upImg     = loadImage("up.png");
  downImage = loadImage("down.png");
  rightTurnImage = loadImage("right_turn.png");
  leftTurnImage  = loadImage("left_turn.png");
}


void instSelect(){
  if ( mouseX > width - 150 && toolFlag==1) {
    //音
    instColor = get(mouseX, mouseY);
    instSelectEffect = true;
  }
}

void instSelectEffecting(){
  if( instSelectEffect ){
      pushStyle();
      noFill();
      stroke(0);
      strokeWeight( 5 ); 
      ellipse( mouseX, mouseY, 40, 40 );
      popStyle();
  }
}
