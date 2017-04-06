/*スペースキーを押したらスタート・ゴールしたことがわかるようにする*/
// http://www.ricardmarxer.com/fisica/reference/index.html
import fisica.*;
PImage daruma, sisimai_face, tree;

FWorld world;
FPoly mikan;
FCircle target;

void setup() {
  size(768, 432);
  smooth();

  Fisica.init(this);

  daruma = loadImage("daruma.jpg");
  sisimai_face = loadImage("sisimai_face.png");
  tree = loadImage("tree.png");

  world = new FWorld();
  world.setEdges(this, color(255));
  world.remove(world.top);
  world.setGravity(0, 500);

  FPoly sisimai = new FPoly();
  sisimai = draw_sisimai();
  sisimai.setPosition(365, 100);
  sisimai.setRotation(radians(-4));
  sisimai.setStatic(true);
  world.add(sisimai);
  
  mikan = new FPoly();
  mikan = draw_mikan();
  mikan.setPosition(678, -100);
  mikan.setStatic(true);
  world.add(mikan);
  
  FBox mochi = new FBox(100, 30);
  mochi.setStatic(true);
  mochi.setPosition(680, 90);
  world.add(mochi);
  FBox _mochi = new FBox(80, 30);
  _mochi.setStatic(true);
  _mochi.setPosition(680, 60);
  world.add(_mochi);
  
  draw_tree();
  
  FPoly ema = new FPoly();
  ema = draw_ema();
  ema.setStatic(true);
  ema.setPosition(200, 280);
  world.add(ema);
  
  target = new FCircle(20);
  target.setFill(0);
  target.setPosition(678, 10);
  target.addForce(-300, 0);
  world.add(target);
}

void draw() {
  background(255);
  image(daruma, 558, 225, 200, 200);

  if (dist(target.getX(), target.getY(), 689, 293)<15){
    target.setPosition(689, 293);
    target.setStatic(true);
  }else{
    target.setStatic(false);
  }
  if (dist(target.getX(), target.getY(), 164, 95)<15){
    target.addForce(-300, 0);
  }

  world.step();
  world.draw(this);
  
  image(sisimai_face, 95, 10);
  image(tree, 350, 275);
}

void mousePressed(){
  println(mouseX, mouseY);
}

void keyPressed(){
  if (key==' '){
    mikan.setStatic(false);
  }
}