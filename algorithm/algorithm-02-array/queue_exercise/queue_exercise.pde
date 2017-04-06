int box_w = 60;
int box_h = 30;
int value_max = 1000;

boolean stepForward = false;
IntArrayViewer viewer;

int[] a;
int head;
int tail;
boolean isPush = false;
boolean isPop = false;

void setup() {
  size(800, 400);

  queue_init();

  viewer = new IntArrayViewer(width, box_w, box_h, a, value_max);

  noLoop();
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
  textAlign(LEFT, BOTTOM);
  textSize(24);
  fill(0);
  text("'q': queue 'd': dequeue 'r': reset", 0, 24);

  if (stepForward) {
    if (isPush) {
      int value = (int)random(value_max - 1) + 1;
      int ret = queue_enqValue(value);
      text(ret, 10, 50);
      text("has been enqueued.", 70, 50);
      isPush = false;
    }
    if (isPop) {
      int ret = queue_deqValue();
      text(ret, 10, 50);
      text("has been dequeued.", 70, 50);
      isPop = false;
    }
    stepForward = false;
  }
  viewer.draw(a, 0, 100);
  viewer.drawPointer(head, "head", 0, 100, 0);
  viewer.drawPointer(tail, "tail", 0, 100, 80);
}

void keyReleased() {
  stepForward = true;
  if (key == 'r') {
    queue_reset();
  } else if (key == 'd') {
    isPop = true;
  } else {
    isPush = true;
  }
  redraw();
}