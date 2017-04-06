float t = 0;
float s = 0;

void setup() {
  size(400, 400, P3D);
}


void draw() {
  background(255);
  translate(width/2, height/2, 0);

  rotateX(radians(s));
  s += 0.5;
  rotateY(radians(t));
  t++;


  float p = 0.2;
  float q = 1.5;
  
  applyMatrix( 
    1, 0, 0, 0, //X軸方向のせん断
    0, 1, 0, 0, //Y軸方向のせん断
    p, q, 1, 0, //Z軸方向のせん断
    0, 0, 0, 1
    );  

  fill(255, 190, 0);
  box(100);
}