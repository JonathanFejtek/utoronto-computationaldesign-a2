class Agent{
  PVector pos;
  PVector vel;
  PVector acc;
  
  Agent(float x, float y){
    this.pos = new PVector(x,y);
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
  }
  
  void addForce(float x, float y){
    this.acc.add(x,y,0);
    
  }
  
  void display(){
    pushStyle();
    noStroke();
    vel.add(acc);
    pos.add(vel);
    fill(250,80);
    //ellipse(pos.x,pos.y,1,1);
    acc.setMag(0);
    popStyle();
  }
  
}