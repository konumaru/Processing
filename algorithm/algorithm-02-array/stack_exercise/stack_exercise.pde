int box_w = 60;
int box_h = 30;
int value_max = 1000;

boolean stepForward = false;
IntArrayViewer viewer;

boolean isPush = false;

void setup() {
  size(1000, 200);

  stack_init();

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
  text("'p': push 'o': pop", 0, 24);

  if (stepForward) {
    if (isPush) {
      int value = (int)random(value_max - 1) + 1;
      int ret = stack_pushValue(value);
      if (ret >= 0) {
        text(ret, 10, 50);
        text("has been pushed.", 70, 50);
      } else {
        text("Stack overflow.", 10, 50);
      }
    } else {
      int ret = stack_popValue();
      if (ret >= 0) {
        text(ret, 10, 50);
        text("has been popped.", 70, 50);
      } else {
        text("Stack underflow.", 10, 50);
      }
    }
    stepForward = false;
  }
  viewer.draw(a, 0, 100);
  viewer.drawPointer(head, "head", 0, 100, 0);
}

void keyReleased() {
  stepForward = true;
  if (key == 'o') {
    isPush = false;
  } else {
    isPush = true;
  }
  redraw();
}