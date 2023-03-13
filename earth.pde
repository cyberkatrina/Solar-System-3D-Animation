class earth {
  PImage earthtex;
  PShape earth;
  PImage moontex;
  PShape moon;
  int radius, dist;
  float thetad;
  float thetamd =0;
  float pos = 0;
  float phi = 0;
  float phid = 0.2;
  earth(int radius, int dist, float thetad) {
    // load moon and earth texture
    earthtex = loadImage("earth.jpg");
    moontex = loadImage("moon.jpeg");
    this.dist = dist;
    this.thetad = thetad;
    //make moon and earth and apply texture
    earth = createShape(SPHERE, radius);
    moon = createShape(SPHERE, 20);
    earth.setTexture(earthtex);
    earth.setStroke(0);
    moon.setTexture(moontex);
    moon.setStroke(0);

  }


  void move() {
    //move to position of the earth
    pushMatrix();
    rotateY(pos);
    translate(dist, 0, 0);
    pushMatrix();
    rotateY(-pos);
    rotateX(PI/3);
    rotateZ(phi);
    shape(earth);
    popMatrix();
    // move to poistion of the moon
    rotateZ(0.1);
    rotateX(0.1);
    rotateY(thetamd);
    translate(135, 0, 0);
    shape(moon);
    popMatrix();
    pos+=thetad;
    phi+=phid;
    thetamd-=0.1;
  }
}
