import fisica.*; //<>//

boolean finish = false;

FWorld world;
FBox floor;
FCircle target;
FCompound cage;
FBox finish_flag;
int radius = 20;

ArrayList<FCompound> object;
FCompound ropes;
float x, y, px, py;
float lineWeight = 10;

void setup() {
  size(800, 600);
  smooth();

  Fisica.init(this);

  world_init();

  object = new ArrayList<FCompound>();
  ropes = new FCompound();
  ropes.setStatic(false);
}


void draw() {
  background(0);
  draw_title();

  world.step();
  world.draw();

  if (ropes != null) ropes.draw(this);
}

void mousePressed() {
  if (world.getBody(mouseX, mouseY) != null) return;
  ropes = new FCompound();
}

void mouseDragged() {
  px = pmouseX;
  py = pmouseY;
  x = mouseX;
  y = mouseY;

  float box_len = sqrt( sq( x - px ) + sq( y - py ) ) + 10;
  FBox rope = new FBox(box_len, lineWeight);
  rope.setFill(255);
  rope.setNoStroke();
  rope.setPosition( (x+px)/2, (y+py)/2 );
  rope.setRotation( atan2(y-py, x-px) );
  ropes = ropeConnection(ropes, rope);
}

void mouseReleased() {
  if (ropes != null) {
    ropes.setBullet(true);
    ropes.setGrabbable(false);
    world.add(ropes);
    object.add(ropes);
  }
}


void keyPressed() {
  if (key == BACKSPACE) {
    for (FCompound temp : object) {
      world.remove(temp);
      ropes = null;
    }
    world_init();
  }
}