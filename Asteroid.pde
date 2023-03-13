class Asteroid {
  PShape asteroid;
  PShape smolAsteroid;
  float x;
  float y;
  float z;
  float x_og;
  float y_og;
  float z_og;
  float radius;
  float velocity;
  float dissipation;
  //color c = color(92,64,51);
  color c = color(255);
  float r;
  float count = 0;
  Asteroid(float xPos, float yPos, float zPos, float _r, float _v, float _d) {
    this.x = xPos;
    this.y = yPos;
    this.z = zPos;
    this.x_og = xPos;
    this.y_og = yPos;
    this.z_og = zPos;
    this.radius = _r;
    this.velocity = _v;
    this.dissipation = _d;
    pushMatrix();
    translate(x,y,z);
    asteroid = createShape(SPHERE, radius);
    smolAsteroid = createShape(SPHERE, radius/3);
    asteroid.setFill(c);
    smolAsteroid.setFill(c);
    asteroid.setStroke(0);
    smolAsteroid.setStroke(0);
    popMatrix();
  }
  void move() {
    r = int(random(3));
    if (count > 1000*dissipation) {
      count = 0;
      this.x = x_og;
      this.y = y_og;
      this.z = z_og;
    }
    else if (count > 500*dissipation) {
      x+=velocity/3;
      y+=velocity/3;
      z+=velocity/3;
      pushMatrix();
      translate(x,y,z);
      shape(smolAsteroid);
      popMatrix();
      pushMatrix();
      translate(x+10,y-10,z+10);
      shape(smolAsteroid);
      popMatrix();
      pushMatrix();
      translate(x-10,y+10,z+10);
      shape(smolAsteroid);
      popMatrix();
      pushMatrix();
      translate(x-10,y-10,z+10);
      shape(smolAsteroid);
      popMatrix();
      pushMatrix();
      translate(x+10,y+10,z-10);
      shape(smolAsteroid);
      popMatrix();
      pushMatrix();
      translate(x+10,y-10,z-10);
      shape(smolAsteroid);
      popMatrix();
      pushMatrix();
      translate(x-10,y+10,z-10);
      shape(smolAsteroid);
      popMatrix();
      pushMatrix();
      translate(x-10,y-10,z-10);
      shape(smolAsteroid);
      popMatrix();
    }
    else if (r == 0) {
      x+=velocity;
      pushMatrix();
      translate(x,y,z);
      shape(asteroid);
      popMatrix();
    } else if (r == 1) {
      y+=velocity;
      pushMatrix();
      translate(x,y,z);
      shape(asteroid);
      popMatrix();
    } else {
      z+=velocity;
      pushMatrix();
      translate(x,y,z);
      shape(asteroid);
      popMatrix();
    }
    count++;
  }
}
