class PlanetSatellite extends Object {
  int theta1 = (int)random(360);
  int theta2 = (int)random(360);
  int theta3 = (int)random(360);

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 30, 30);
    theta1 = theta1 + (int)random(1,10);
    theta2 = theta2 + (int)random(1,10);
    theta3 = theta3 + (int)random(1,10);
    int rx = (int)(x+30*sin(radians(theta1)));
    int ry = (int)(y+30*cos(radians(theta1)));

    int rx2 = (int)(x+30*sin(radians(theta2)+2));
    int ry2 = (int)(y+30*cos(radians(theta2)+2));

    int rx3 = (int)(x+30*sin(radians(theta3)+4));
    int ry3 = (int)(y+30*cos(radians(theta3)+4));
    ellipse(rx, ry, 10, 10);
    ellipse(rx2, ry2, 10, 10);
    ellipse(rx3, ry3, 10, 10);
  }
}

