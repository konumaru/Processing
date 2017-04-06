boolean validationMode = false; // 'true' to validate your sort function.

int array_size = 30;
int value_max = 1000;

boolean stepForward = false;
boolean muso = false;
int mainDelay = 100;
boolean isFinished = false;
boolean isValid = true;

IntArrayBarViewer viewer;

void setup() {
  size(800, 800);

  int bar_w = width / array_size;
  viewer = new IntArrayBarViewer(width, height - bar_w, bar_w, value_max);

  noLoop();
  Thread sortbody = new Thread() {
    public void run() {
      Validator validator = new Validator(array_size, viewer);
      if (validationMode) {
        isValid = validator.runTestSuite();
        isFinished = true;
        redraw();
      } else {
        boolean result = true;
        while (result) {
          result = validator.monkeyTest();
        }
        isValid = false;
        redraw();
      }
    }
  };
  sortbody.start();
}

void step() {
  redraw();

  do {
    delay(mainDelay);
  }   
  while (!muso && !stepForward);

  stepForward = false;
}

void draw() {
  background(192);
  viewer.draw(0, 0);
  if (isFinished && isValid) {
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(0, 0, 255);
    text("VALIDATED!", width/2, height/2);
  }
  if (!isValid) {
    textSize(150);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    text("FAILED!", width/2, height/2);
  }
}

void keyReleased() {
  if (key == 'm') {
    muso = !muso;
    mainDelay = (muso)?5:100;
  }
  stepForward = true;
}

