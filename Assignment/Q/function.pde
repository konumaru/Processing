
FCompound ropeConnection(FCompound connected, FBox connect) {
  FCompound result = new FCompound();
  result = connected;
  result.addBody(connect);

  return result;
}

FCompound createCage() {

  FBox b1 = new FBox(110, 12);
  b1.setPosition(0, -12);
  b1.setFill(255);
  b1.setNoStroke();

  FBox b2 = new FBox(10, 110);
  b2.setPosition(-b1.getWidth()/2, -b2.getHeight()/2-6);
  b2.setFill(255);
  b2.setNoStroke();

  FBox b3 = new FBox(10, 110);
  b3.setPosition(b1.getWidth()/2, -b2.getHeight()/2-6);
  b3.setFill(255);
  b3.setNoStroke();

  FCompound result = new FCompound();
  result.addBody(b1);
  result.addBody(b2);
  result.addBody(b3);
  return result;
}


void world_init() {
  world = new FWorld();
  world.setGravity(0, 400);
  world.setEdges();
  world.remove(world.top);
  world.setEdgesRestitution(1);

  floor = new FBox(width, 4);
  floor.setFill(0, 0, 0);
  floor.setPosition(width/2, height-10);
  floor.setStatic(true);
  world.add(floor);

  target = new FCircle(20);
  target.setPosition(width/2, height-target.getSize());
  target.setFill(255, 50, 150);
  target.setGrabbable(false);
  target.setFriction(0);
  world.add(target);
  
  cage = createCage();
  cage.setPosition(width/2, height);
  cage.setBullet(true);
  cage.setGrabbable(false);
  world.add(cage);
}


void draw_title() {
  if (target.isTouchingBody(floor)) fill(255, 50, 120);
  else fill(255);
  textSize(50);
  textAlign(CENTER);
  text("Take Ball Out Of The Cup !!!!!!", width/2, 60);
  fill(255);
  textSize(20);
  textAlign(RIGHT);
  text("BACKSPACE == RESET", width-20, 100);
}