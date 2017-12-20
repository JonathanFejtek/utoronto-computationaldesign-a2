class LineSeg{
  PVector p1;
  PVector p2;
  
  LineSeg(int x1, int y1, int x2, int y2){
    p1 = new PVector(x1,y1);
    p2 = new PVector(x2,y2);
  }
  
  LineSeg(PVector p1, PVector p2){
    this.p1 = p1.get();
    this.p2 = p2.get();
  }
  
  void display(){
    line(p1.x,p1.y,p2.x,p2.y);
  }
  
  PVector getPosAtParam(float t){
    return PVector.lerp(p1,p2,t);
  }
  
}