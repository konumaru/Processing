int[] a;

IntArrayViewer viewer;
boolean stepForward = false;

int target;

void setup() {
  size(1000, 400);
  a = new int[16];
  a[0] = 0;
  for (int i=1; i<a.length; i++) {
    a[i] = a[i-1] + (int)random(10);
  }
  viewer = new IntArrayViewer(width, 60, 30, a);

  frameRate(15);
  noLoop();
  thread("searchloop");
}

void searchloop() {
  while (true) {
    background(192);
    target = (int)random(a[a.length - 1] + 1);
    int ret = binsearch(a, target);
    if (ret >= 0) {
      text("Found!", 10, 130);
    } else {
      text("Not found.", 10, 130);
    }
    step();
  }
}

int binsearch(int[] a, int target) {
  return mysearch(a, target, viewer);
}

void step() {
  redraw();
  while (!stepForward) {
    delay(100);
  }
  stepForward = false;
}

void draw() {
  background(192);
  viewer.draw(a, 0, 0);
  textAlign(LEFT, BOTTOM);
  text("Target: ", 10, 100);
  text(target, 110, 100);
}

void keyReleased() {
  stepForward = true;
}