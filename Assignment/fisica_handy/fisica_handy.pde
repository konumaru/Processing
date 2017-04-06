import org.gicentre.handy.*;
import fisica.*;

FWorld world;
HandyRenderer h;
ArrayList<FCircle> Balls;

void setup() {
  size(500, 500);
  smooth();

  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  Balls = new ArrayList<FCircle>();

  h = new HandyRenderer(this);
}

void draw() {
  background(255);

  world.step();
  //world.draw();
  if (Balls != null) {
    for (FCircle ball : Balls) {
      fill(255, 0, 0);
      h.ellipse(ball.getX(), ball.getY(), ball.getSize(), ball.getSize());
    }
  }
}

void mousePressed() {
  float radius = random(20, 50);
  FCircle ball = new FCircle(radius);
  ball.setPosition(mouseX, mouseY);
  ball.setDensity(0.2);
  ball.setFill(120, 120, 190);
  ball.setRestitution(0.8);
  ball.setNoStroke();
  ball.setStatic(false);
  world.add(ball);
  Balls.add(ball);
}