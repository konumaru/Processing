PImage img;
int [] bright = new int [256];


void setup() {
  img = loadImage("sea.jpg");
  size(768, 600);
  image(img, 0, 0, img.width, height);
  filter(GRAY);
  
  for (int i=0; i<img.width; i++){
    for (int j=0; j<img.height; j++){
      color c = get(i, j);
      float temp = brightness(c);
      bright[round(temp)] ++;
    }
  }
}


void draw() {
  
  for (int i=0; i<bright.length; i++){
    stroke(255, 0, 0);
    line(1+i*3, height, 1+i*3, height-0.2*bright[i]);
  }
  
}