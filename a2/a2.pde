//Intellectual Property of Jonathan Fejtek, 2017.
//Please do not use or distribute without permission
//Written for ARC180 @ UofT, 2017. (1000131724)
//Documentation available upon request. 
//Enjoy!!

//The following sketch is an experiment in producing a
//2D parametric surfaces by lofting (linearly) the paths
//produced by particles in a classical dynamical system.

//patterns are drawn on this surface
//different random seeds produce different surfaces




DynaBox db;

void setup(){
  size(displayWidth,displayHeight);
  background(0);
  randomSeed(8);
  db = new DynaBox(0,0,width,height,random(-1,1),random(-1,1));
  db.display();
  db.drawCircle();
  db.drawRectStrip();
}

void draw(){

}

void keyReleased(){
  save("im.png");
}