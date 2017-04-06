size(600,400);
beginShape();
vertex(30,20);
vertex(100,20);
vertex(100,90);
vertex(30,90);
endShape(CLOSE); //最後に閉じる

noFill(); //塗りつぶさない
beginShape();
vertex(130,20);
vertex(200,20);
vertex(200,90);
vertex(130,90);
endShape(); //閉じない

beginShape(); //多角形の場合
vertex(230,20);
vertex(220,50);
vertex(240,90);
vertex(280,30);
vertex(250,5);
endShape(CLOSE); //最後に閉じる

fill(255); //白で塗りつぶす
beginShape(TRIANGLES); //3点セットで，三角形を次々書く（下記の例では２つ）
vertex(330,90);
vertex(340,20);
vertex(350,90);
vertex(360,20);
vertex(370,90);
vertex(380,20);
endShape(); 

beginShape(TRIANGLE_STRIP); //直近3点を使って三角形を帯状に次々書く（下記の例では6つ）
vertex(430,90);
vertex(440,20);
vertex(450,90);
vertex(460,20);
vertex(470,90);
vertex(480,20);
vertex(490,90);
vertex(550,50);
endShape(); 

beginShape(QUADS); //4点をセットで，四角形を次々書く（下記の例では２つ）
vertex(30,120);
vertex(30,190);
vertex(50,190);
vertex(50,120);
vertex(80,120);
vertex(80,190);
vertex(85,190);
vertex(85,120);
endShape(); 

beginShape(QUAD_STRIP); //2点毎の4点セットで，四角形を帯状に次々書く（下記の例では３つ，順番に注意！）
vertex(130,120);
vertex(130,190);
vertex(150,120);
vertex(150,190);
vertex(180,120);
vertex(180,190);
vertex(185,120);
vertex(185,190);
endShape(); 

beginShape(TRIANGLE_FAN); //最初に定義する中心点回りに三角形を次々描く（下記の例では4つ）
vertex(230,160);
vertex(250,120);
vertex(280,140);
vertex(260,190);
vertex(230,210);
vertex(210,160);
endShape();

noFill();
beginShape();
curveVertex(384,191);//開曲線の場合は最初の最後は同じ点を指定する
curveVertex(384,191);//同上
curveVertex(368,119);
curveVertex(321,117);
curveVertex(332,200);//同上
curveVertex(332,200);//同上
endShape();

fill(255);
beginShape();
curveVertex(410,110);
curveVertex(450,130);
curveVertex(490,110);
curveVertex(470,150);
curveVertex(410,110);//閉曲線の場合は初めの３点と同じ点を繰り返す
curveVertex(450,130);//同上
curveVertex(490,110);//同上
endShape();

beginShape();
curveVertex(550,130);//開曲線は2回繰り返す
curveVertex(550,130);//同上
curveVertex(590,110);
curveVertex(570,150);
curveVertex(590,190);//開曲線は2回繰り返す
curveVertex(590,190);//同上
vertex(530,150);//曲線と線分の混合の場合
vertex(510,110);
endShape(CLOSE);
