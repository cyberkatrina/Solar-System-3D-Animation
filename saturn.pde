class saturn {
  // create PImage for saturn texture
  PImage saturnex;
  // create PShape for saturn object
  PShape saturn;
  // create radius and distance variables
  int radius, dist;
  float thetad;
  float thetamd =0;
  // initiate position to start at 50
  float pos = 50;
  float phi = 0;
  float phid = 0.2;
  saturn(int radius, int dist, float thetad) {
    // load the texture file for the planet into the variable saturnex
    saturnex = loadImage("saturn.jpeg");
    this.dist = dist;
    this.thetad = thetad;
    // creates the saturn shape that is a sphere with the given radius
    saturn = createShape(SPHERE, radius);
    // sets the texture of the planet
    saturn.setTexture(saturnex);
    // set stroke to be white
    saturn.setStroke(255);
  }

  // this function revolves the planet around the sun, rotates it, and creates the counter-rotating rings
  void move() {
    pushMatrix();
    rotateY(pos);
    translate(dist, 0, 0);
    pushMatrix();
    rotateY(-pos);
    rotateX(PI/3);
    rotateZ(phi);
    // display the saturn shape
    shape(saturn);
    rotateZ(-2 * phi);
    // make rings
    noFill();
    // inner ring thickest
    strokeWeight(9);
    stroke(92, 141, 255);
    ellipse(0, 0, 550, 550);
    strokeWeight(8);
    stroke(43, 86, 255);
    ellipse(0, 0, 650, 650);
    // outer ring thinnest
    strokeWeight(7);
    stroke(118, 204, 222);
    ellipse(0, 0, 700, 700);
    strokeWeight(9.5);
    // added a slight, thicker arc onto the outer ring to make the rotation of the rings visible
    arc(0, 0, 700, 700, 0, HALF_PI);
    popMatrix();
    rotateZ(0.1);
    rotateX(0.1);
    rotateY(thetamd);
    translate(135,0,0);  
    popMatrix();
    // increment variables in order to continue and loop animation
    pos+=thetad;
    phi+=phid;
    thetamd-=0.09;
  }
}
