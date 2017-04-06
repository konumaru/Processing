//ex 4-1
//2015/10/12
//小沼 塁

PlanetSatellite [] en = new PlanetSatellite[10];

void setup() {
  size(400, 300);
  for (int i=0; i<10; i++) {
    en[i] = new PlanetSatellite();
  }
}

void draw() {
  background(255);
  for (int i=0; i<10; i++) {
    en[i].display();
    en[i].move();
  }
}

