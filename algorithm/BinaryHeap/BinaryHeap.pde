HeapViewer viewer;

int ARRAY_MAX=15;

int[] array = new int[ARRAY_MAX + 1];
int array_size = 0;

boolean stepForward = false;
boolean commandWaiting = false;
boolean aborted = false;
boolean muso = false;
int command;
int mainDelay = 100;

void setup() {
  size(800, 800);
  randomSeed(0);

  viewer = new HeapViewer();

  noLoop();
  thread("mainloop");
}

void mainloop() {
  redraw();
  while (true) {
    if (muso) {
      commandWaiting = true;
      command = (int)random(2);
    }
    if (commandWaiting) {
      if (command == 0) {
        addElement((int)random(100));
      } else {
        removeElement();
      }
      commandWaiting = false;
    }
    redraw();
    delay(mainDelay);
    if (!validate(array, array_size)) {
      aborted = true;
      redraw();
      break;
    }
  }
}

void step() {
  redraw();
  while (!muso && !stepForward) {
    delay(mainDelay);
  }
  stepForward = false;
}

void draw() {
  if (commandWaiting) {
    background(192, 128, 128);
    drawUsage(true);
  } else {
    background(192);
    drawUsage(false);
  }
  viewer.draw(array, array_size);
  if (aborted) {
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Invalid link detected.", width/2, height/2);
    text("Program aborted.", width/2, height/2 + 32);
  }
}

void drawUsage(boolean percolating) {
  textAlign(LEFT, TOP);
  textSize(18);
  fill(0);
  if (percolating) {
    if (command == 0) {
      text("Percolating up.", 0, 0);
    } else {
      text("Percolating down.", 0, 0);
    }
    text("Push space key to proceed.", 0, 20);
  } else {
    text("Usage:", 0, 0);
    text("  'a' to add a number.", 0, 20);
    text("  'r' to remove a number.", 0, 40);
  }
}

void keyReleased() {
  if (key == ' ' && commandWaiting) {
    stepForward = true;
  } else if (key == 'a') {
    command = 0;
    commandWaiting = true;
  } else if (key == 'r') {
    command = 1;
    commandWaiting = true;
  } else if (key == 'm') {
    muso = !muso;
    mainDelay = (muso)?10:100;
  }
}

boolean validate(int[]a, int a_size) {
  for (int i=1; i<=a_size/2; i++) {
    if (a[i] > a[i*2]) {
      return false;
    }
    if (i*2+1 <= a_size && a[i] > a[i*2+1]) {
      return false;
    }
  }

  return true;
}