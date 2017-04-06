//ex 4-1
//2015/10/12
//小沼 塁void setup() {
Ball [] ball = new Ball[50];
triangle [] tri = new triangle[50];
star [] hosi = new star[50];

void setup() {
  size( 400, 300 );
  for (int i=0; i<50; i++){
    ball[i] = new Ball();
    tri[i] = new triangle();
    hosi[i] = new star();
  }
}

void draw() {
  background(255);
  for (int i=0; i<50; i++) {
    ball[i].move();
    ball[i].display();
    tri[i].display();
    tri[i].move();
    hosi[i].display();
    hosi[i].move();
  }
}

