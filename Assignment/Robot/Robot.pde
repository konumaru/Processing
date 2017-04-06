import java.awt.Robot;
Robot robot;

Myrobot roboot;

void setup() {
  size( 400, 400 );
  roboot = new Myrobot();
  try {
    robot = new Robot();
  } 
  catch( Exception e ) {
  }
}

void draw() {
  //マウスの位置を変えられなくする
  roboot.stay();
}