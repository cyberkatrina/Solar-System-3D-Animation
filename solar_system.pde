earth planet1;
saturn planet2;
Asteroid a1;
Asteroid[] ast;
PImage suntex;
PShape sun;
int r_x;
int r_y;
int r_z;
float x = 0;
float posx = 0;
float posz = 0;
float  phi = PI/20;
float theta = PI/2;
float R = 10e10;
float cameraR = -4000;

void setup() {
  size(900, 700, P3D);
  frameRate(60);
  sun = createShape(SPHERE, 500);
  suntex = loadImage("sun.jpg");
  sun.setTexture(suntex);
  sun.setStroke(0);
  planet1 = new earth(100, 1700, .006);
  // create a new planet from the saturn class called planet2
  planet2 = new saturn(250, 2000, .005);
  a1 = new Asteroid(400,400,0,10,0.8,5);
  ast = new Asteroid[10];
  for (int i=0;i<10;i++) {
    r_x = int(random(4000))-2000;
    r_y = int(random(4000))-2000;
    r_z = int(random(4000))-2000;
    ast[i] = new Asteroid(r_x,r_y,r_z,10,0.8,5);
  }
}

void draw() {
  ambientLight(255, 255, 255);

  background(0); 
  beginCamera();
  camera(cameraR*cos(theta), cameraR*sin(theta) * sin(phi), cameraR * sin(theta) * cos(phi), posx, -posz, 0, 0, 1, 0);

  endCamera();
  sphereDetail(1);
  pointLight(255, 228, 93, 0, 0, 0);
  shape(sun);
  x += 0.05;
  sphereDetail(40);
  planet1.move();
  // animate Saturn to move
  planet2.move();
  for (int i=0;i<10;i++) {
    //arr[i].twinkle();
    a1.move();
    ast[0].move();
    ast[1].move();
    ast[2].move();
    ast[3].move();
    ast[4].move();
    ast[5].move();
    ast[6].move();
    ast[7].move();
    ast[8].move();
    ast[9].move();
    //ast[10].move();
  }
}



void mouseDragged() {
  theta += (mouseX - pmouseX) * 0.001;
  phi += (mouseY - pmouseY)*0.001;
  phi %= 2*PI;
  theta %= 2*PI;
}

void keyPressed() {
  switch (keyCode) {
  case LEFT:
    posx += 100;
    break;
  case RIGHT:
    posx -= 100;
    break;
  case UP:
    posz +=100;
    break;
  case DOWN:
    posz -=100;
    break;
  case 32:
    posx = 0;
    posz = 0;
    phi = PI/20;
    theta = PI/2;
    R = 9e9;
    cameraR = -4000;
    break;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  cameraR -= e;
}
