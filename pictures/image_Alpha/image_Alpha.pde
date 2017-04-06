PGraphics pg = createGraphics(50, 50);
pg.beginDraw();
pg.line(0, 0, pg.width, pg.height);
pg.line(pg.width, 0, 0, pg.height);
pg.endDraw();
pg.save("image.png");

