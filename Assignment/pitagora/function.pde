/*
画像はその画像の中心が座標として与えられている。
 そこを基準にvertext();の処理を考えれば面倒な事なしで完成！！
 */
FCompound mochi() {
  FCompound m = new FCompound();
  return m;
}

FPoly draw_mikan() {
  PImage mikan_image = loadImage("mikan.png");

  FPoly result = new FPoly();
  result.vertex(-2, -12);
  result.vertex(1, -16);
  result.vertex(5, -18);
  result.vertex(5, -14);
  result.vertex(3, -12);
  result.vertex(7, -12);
  result.vertex(12, -9);
  result.vertex(16, -3);
  result.vertex(17, 2);
  result.vertex(16, 8);
  result.vertex(13, 13);
  result.vertex(9, 16);
  result.vertex(2, 18);
  result.vertex(-16, 10);
  result.vertex(-19, 3);
  result.vertex(-15, -6);
  result.vertex(-6, -12);
  result.vertex(-2, -13);
  result.attachImage(mikan_image);

  return result;
}

void draw_tree() {
  FBox b1 = new FBox(70, 5);
  b1.setStatic(true);
  b1.setFill(0);
  b1.setNoStroke();
  b1.setPosition(455, 393);
  b1.setRestitution(1.3);
  b1.setRotation(radians(2));
  world.add(b1);

  FBox b2 = new FBox(50, 5);
  b2.setStatic(true);
  b2.setFill(0);
  b2.setNoStroke();
  b2.setPosition(532, 344);
  b2.setRestitution(2);
  b2.setRotation(radians(7));
  world.add(b2 );
}

FPoly draw_ema() {
  PImage emaImage = loadImage("ema.png");

  FPoly result = new FPoly();
  result.vertex(-224.0, -72.0);
  result.vertex(-195.0, -68.0);
  result.vertex(-193.0, -89.0);
  result.vertex(-141.0, -85.0);
  result.vertex(-114.0, -57.0);
  result.vertex(204.0, -13.0);
  result.vertex(215.0, -9.0);
  result.vertex(200.0, -3.0);
  result.vertex(-117.0, -43.0);
  result.vertex(-145.0, -31.0);
  result.vertex(-219.0, -45.0);
  result.vertex(-196.0, -57.0);
  result.vertex(-222.0, -63.0);
  result.attachImage(emaImage);
  return result;
}




FPoly draw_sisimai() {
  PImage sisimai_image = loadImage("sisimai.png");

  FPoly result = new FPoly();
  result.attachImage(sisimai_image);
  result.vertex(286, -30);
  result.vertex(171, -26);
  result.vertex(119, -32);
  result.vertex(32, -25);
  result.vertex(-46, -15);
  result.vertex(-189, -5);
  result.vertex(-223, -6);
  result.vertex(-226, 33);
  result.vertex(-187, 12);
  result.vertex(-137, 7);
  result.vertex(-90, 19);
  result.vertex(-54, 28);
  result.vertex(-2, 25);
  result.vertex(38, 8);
  result.vertex(81, -12);
  result.vertex(114, -9);
  result.vertex(176, 3);
  result.vertex(218, 4);
  result.vertex(282, -25);
  return result;
}