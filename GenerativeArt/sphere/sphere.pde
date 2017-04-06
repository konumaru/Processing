import processing.opengl.*;

size(500, 300, OPENGL);
//どれくらい細部まで描くか
sphereDetail(40);


//Z軸は奥がマイナス、手前がプラス////150にすると球の中にいるように見える
translate(width/2, height/2, 0);
//球を描画
sphere(100);
