int box_w = 60;
int box_h = 30;
int value_max = 1000;

boolean stepForward = false;
IntArrayViewer viewer;

int[] a;
int lastIdx;

void setup() {
  size(800, 800);

  a = new int[100];
  for (int i=0; i<a.length - 1; i++) {
    a[i] = (int)random(value_max);
  }
  
  viewer = new IntArrayViewer(width, box_w, box_h, a, value_max);

  noLoop();
  thread("insertion");
}

void step(int i) {
  lastIdx = i;
  redraw();
  while (!stepForward) {
    delay(100);
  }
  stepForward = false;
}

void draw() {
  background(192);
  viewer.draw(a, 0, 100);
  viewer.drawPointer(lastIdx, "i", 0, 100, 50);
}

void keyReleased() {
  stepForward = true;
}