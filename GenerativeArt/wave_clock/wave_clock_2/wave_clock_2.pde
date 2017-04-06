//Wave clock 2
size(500, 500);
background(255);
int centx = 250, centy = 250;
float radius = 200;
float clr = 0;
for(float ang=0; ang<=180; ang++){
  float oppang = ang+PI;
  float x1 = centx + radius*cos(ang);
  //float x2 = centx + radius*cos(oppang);
  float y1 = centy + radius*sin(ang);
  //float y2 = centy + radius*sin(oppang);
  
  stroke(clr);
  line(centx, centy, x1, y1 );
  clr += 255.0/180.0;
}