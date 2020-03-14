boolean rightPressed,leftPressed,luz,downPressed,upPressed;
PVector posCam;
float camMov,z,x;

PShape piramide;
void setup(){
  size(1000,1000,P3D);
  x = width/2.0;
  z = width;
  camMov=0;
  posCam = new PVector(width/2,height/2,-2*width);

}


void draw(){
  background(200);
  print(posCam.z+"\n");
  if(luz){
    float val = (float)x/(float)width*float(255);
    ambientLight((int)val,0,0);
    directionalLight(50,200,50,-1,0,0);
    pointLight(204,153,0,x,height/2.0,400);
  }
  camera(posCam.x,posCam.y,posCam.z,x,height/2.0,0,0,1,0);
  
  cameraControl();
  
  pushMatrix();
    translate(width/4,height/2,width/4);
    sphere(75);
  popMatrix();
  
  pushMatrix();
    translate(3*width/4,height/2,width/4);
    sphere(75);
  popMatrix();
  
  pushMatrix();
    translate(width/4,height/2,3*width/4);
    sphere(75);
  popMatrix();
  
  pushMatrix();
    translate(3*width/4,height/2,3*width/4);
    sphere(75);
  popMatrix();
  
  pushMatrix();
    translate(width/4,height/2,-width);
    sphere(75);
  popMatrix();
  
  pushMatrix();
    translate(3*width/4,height/2,-width);
    sphere(75);
  popMatrix();

  
   pushMatrix();
    translate(width/4,height/2,-width/2);
    sphere(75);
  popMatrix();
  
  pushMatrix();
    translate(3*width/4,height/2,-width/2);
    sphere(75);
  popMatrix();

  pushMatrix();
    translate(width/4,height/2,-3*width/4);
    sphere(75);
  popMatrix();
  
  pushMatrix();
    translate(3*width/4,height/2,-3*width/4);
    sphere(75);
  popMatrix();
  
  
}



void cameraControl(){
  if(rightPressed){
    camMov-=1;
    camMov = camMov%360;
  }
  if(leftPressed){
    camMov+=1;
    camMov = camMov%360;
  }
  if(downPressed){
    posCam.sub(new PVector(0,0,5));
  }
  if(upPressed){
    if(posCam.add(new PVector(0,0,5)).z>-5)posCam.z=-2*width;
    posCam.add(new PVector(0,0,5));
  }
  
  x = (width/2.0)*(1 + sin(radians(camMov)));
  z = -(width/2.0)*(1 + cos(radians(camMov)));
  
}


void keyPressed() {
  if((key == 'v') || (key == 'V') ){
      luz= !luz;
  }
  if ( key == CODED) {
    if ( keyCode == UP) {
      upPressed=true;
    } else if ( keyCode == DOWN) { 
      downPressed=true;
    } else if ( keyCode == LEFT ) { 
      leftPressed=true;
    } else if ( keyCode == RIGHT) { 
      rightPressed=true;
    }
  }
}

void keyReleased() {
  if ( key == CODED) {
    if ( keyCode == UP) {
      upPressed=false;
    } else if ( keyCode == DOWN) { 
      downPressed=false;
    } else if ( keyCode == LEFT ) { 
      leftPressed=false;
    }else if ( keyCode == RIGHT) { 
      rightPressed=false;
    }
  }
}
