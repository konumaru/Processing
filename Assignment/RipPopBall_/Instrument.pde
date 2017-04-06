class Instrument {
  //コンストラクタで色だけ指定して
  //描画はdraw()に書く

  color [] c = new color [8];

  Instrument () {
    //色を保存
    c[0] = color( 255, 255, 255);
    c[1] = color( 30, 150, 255);
    c[2] = color( 0, 255, 200 );
    c[3] = color( 0, 255,40);
    c[4] = color( 250, 250, 0);
    c[5] = color( 255, 160, 0);
    c[6] = color( 255, 100, 150);
    c[7] = color( 185, 0, 250 );
  }

  void instIn() {
    sc[0].instrument(sc[0].KALIMBA);//KALIMBA
    sc[1].instrument(sc[1].GUITAR);//GUITAR
    sc[2].instrument(sc[2].DRUM);//DRUM
    sc[3].instrument(sc[3].CLAV);//CLAV
    sc[4].instrument(sc[4].EPIANO);//EPIANO
    sc[5].instrument(sc[5].FBASS);//FBASS GLOCK
    sc[6].instrument(sc[6].DISTORTED_GUITAR);//DISTORTED_GUITAR
    sc[7].instrument(sc[7].BASS);//BASS
  }

  void draw() {
    for (int i=0; i<c.length; i++) {
      fill( c[i] );
      rect( width-150, i*100, 150, 100 );
    }
    fill( 40, 200, 100);
    rect(width-150, 8*100, 150, 100);
    if(  mouseX > width - 150  ){
      cursor(HAND);
    }else{
      cursor(ARROW);
    }
  }
}

