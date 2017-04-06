int bar_w = 30;
int value_max = 1000;

boolean stepForward = false;
boolean muso = false;
int focus = 0;
IntArrayBarViewer viewerA, viewerB;

int[] a, b;

void setup() {
  size(800, 800);

  a = new int[20];
  b = new int[20];
  for (int i=0; i<a.length; i++) {
    a[i] = (int)random(value_max);
  }

  viewerA = new IntArrayBarViewer(width, height/2 - 10, bar_w, a, value_max);
  viewerB = new IntArrayBarViewer(width, height/2 - 10, bar_w, b, value_max);

  noLoop();
  thread("selection_sort");
}

void selection_sort() {
  step();
  for (int i=0; i<a.length ; i++) {
    int min = a[0];
    int min_i = 0;
    for (int j=0; j<a.length - i; j++) {
      focus = j;
      step();
      if (min > a[j]) {
        min_i = j;
        min = a[j];
      }
    }
    b[i] = min;
    int j;
    for (j=min_i; j<a.length - 1; j++) {
      a[j] = a[j+1];
      step();
    }
    a[j] = 0;
  }
}

void step() {
  redraw();

  do {
    delay(10);
  }   
  while (!muso && !stepForward);

  stepForward = false;
}

void draw() {
  background(192);
  viewerA.draw(a, 0, 0, focus);
  viewerB.draw(b, 0, height/2);
}

void keyReleased() {
  if (key == 'm') {
    muso = true;
  }
  stepForward = true;
}

