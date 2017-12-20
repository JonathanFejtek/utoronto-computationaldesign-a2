class DynaBox{
  Agent agent1;
  Agent agent2;
  ArrayList<Agent> agents = new ArrayList<Agent>();
  ArrayList<LineSeg> line_segments = new ArrayList<LineSeg>();
  int wthresh;
  int hthresh;
  PVector pos;
  int w;
  int h;
  
  DynaBox(int x, int y, int w, int h,float sx, float sy ){
    pos = new PVector(x,y);
    this.w = w;
    this.h = h;
    wthresh = w/9;
    hthresh = h/9;
    PVector r = new PVector(sx,sy);
    agent1 = new Agent(w/2,h/2);
    agent2 = new Agent(w/2,h/2);
    agent1.addForce(r.x,r.y);
    agent2.addForce(r.x+random(-0.4,0.4),r.y+random(-0.4,0.4));
    
    agents.add(agent1);
    agents.add(agent2);
  }
  
  void display(){
    for(int i = 0; i < 12000; i++){
      println(i);
      for(Agent a : agents){
      if(a.pos.x < this.pos.x+wthresh){
        a.addForce(0.01,0);
      }
  
      if(a.pos.x > (this.pos.x+this.w)-wthresh){
        a.addForce(-0.01,0);
      }
  
      if(a.pos.y < this.pos.y+hthresh){
        a.addForce(0,0.01);
      }
  
      if(a.pos.y > this.pos.y+this.h-hthresh){
        a.addForce(0,-0.01);
      }
  
     a.display();
      

    }
    for(int k = 1; k < agents.size(); k++){
      Agent a1 = agents.get(k-1);
      Agent a2 = agents.get(k);
      line_segments.add(new LineSeg(a1.pos.get(),a2.pos.get()));
      pushStyle();
      colorMode(HSB,255);
      strokeWeight(0.1);
      stroke(map(k,0,agents.size(),250,180),100,100,map(k,0,agents.size(),80,0));
     line(a1.pos.x,a1.pos.y,a2.pos.x,a2.pos.y);
      popStyle();
    }

    
  }
  }
  
  PVector getUV(float u, float v){
    return line_segments.get((int)map(u,0,1,0,line_segments.size()-1)).getPosAtParam(v);
  }
  
  void drawCircle(){
    pushStyle();
    int fid = 1028;
    int c1 = 0;
    int c2 = 0;
    for(float a = 0.01; a < 1; a+=0.01){
      c1++;
    for(float i = 1*(TWO_PI/1028); i < TWO_PI; i+=TWO_PI/1028){

      float x = map(a*cos(i),-1,1,0,1);
      float y = map(a*sin(i),-1,1,0,1);
      float x2 = map(a*cos(i-1*(TWO_PI/1028)),-1,1,0,1);
      float y2 = map(a*sin(i-1*(TWO_PI/1028)),-1,1,0,1);
      PVector p1 = getUV(x,y);
      PVector p2 = getUV(x2,y2);
      
      stroke(250,50);
      strokeWeight(0.1);
      line(p1.x,p1.y,p2.x,p2.y);
      
      c2++;
      
    }
    
    }
    popStyle();
  }
  

  
    void drawRectStrip(){
    int fid_u = 5000;
    int fid_v = 200;
    float t = 0;
    float p = 0;
    noiseSeed(0);
    for(int i = 1; i < fid_u; i+=2){
      int r = (int)(120*noise(t));
      int iter = int(10*sin(12*p)+11);
      for(int j = r; j < fid_v-r; j+=iter){
      PVector p1 = getUV(map(i,0,fid_u,0,1),map(j-1,0,fid_v,0,1));
      PVector p2 = getUV(map(i,0,fid_u,0,1),map(j,0,fid_v,0,1));
      PVector p3 = getUV(map(i-1,0,fid_u,0,1),map(j-1,0,fid_v,0,1));
      PVector p4 = getUV(map(i-1,0,fid_u,0,1),map(j,0,fid_v,0,1));
      colorMode(HSB,255);
      if(i%6==0){
        noFill();
        noStroke();
      }
      else if(i%7==0){
        noFill();
        noStroke();
        strokeWeight(0.7);
        stroke(180,map(i,1,fid_u,20,0));
        line(p1.x,p1.y,p2.x,p2.y);
      }
      else{
      fill(map(i,1,fid_u,250,180),50,map(i,1,fid_u,250,100),map(i,1,fid_u,200,0));
      noStroke();
      }
      beginShape();
      vertex(p1.x,p1.y);
      vertex(p2.x,p2.y);
      vertex(p4.x,p4.y);
      vertex(p3.x,p3.y);
      
      endShape(CLOSE);

    }
    t+=0.001;
    p+=TWO_PI/1024;
    }
    
  }
  
}