class Ship extends GameObject {

  //1. instance variables
  PVector direction;
  int shotTimer, threshold;
  boolean immunity;
  int immunitytimer;

  //2 constructor(s)
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.08);
    shotTimer = 0;
    threshold = 30;
    
    immunity = true;
    immunitytimer = 0;
  }

  //3 behaviour functions
  void show() {
    
    if (immunity == true){
      pushMatrix();
      //strokeWeight(5);
      translate(location.x, location.y);
      rotate(direction.heading());
      popMatrix();
    } else {
      noFill();
      //strokeWeight(0);
    }
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    stroke(255);
    triangle(-20, -10, -20, 10, 20, 0);
    popMatrix();
  } 

  void act() {
    super.act();

    shotTimer++;

    //go back on screen
    if(location.x > width+50) location.x = -50;
    if(location.x < -50) location.x = width+50;
    if(location.y > height+50) location.y = -50;
    if(location.y < -50) location.y = height+50;
  
    //keys
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire()); 
      myObjects.add(new Fire()); 
      //myObjects.add(new Fire());
    }
    if (downkey) velocity.sub(direction);
    if (rightkey) direction.rotate(radians(3));
    if (leftkey) direction.rotate(-radians(3));
    if (spacekey && shotTimer > threshold) {
      shotTimer = 0;
      myObjects.add(new Bullet());
    }

    //speed cap
    if (velocity.mag() > 5) {
      velocity.setMag(5);
    }    

    //slow velocity
    if (upkey == false) velocity.setMag(velocity.mag()*0.991);
    if (downkey == false) velocity.setMag(velocity.mag()*0.991);
  
  
  //immunity
   if (immunity == true) {
      immunitytimer++;
    }
    if (immunitytimer > 300) {
      immunity = false;
      immunitytimer = 0;
    }
    
  //lose lives
  int i = 0;  
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Asteroid || obj instanceof UFO || obj instanceof Bullet && obj.UFObullet) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size) {
          if (immunity == false) {
            lives--;
            immunitytimer = 0;
            immunity = true;
            for (int j=0; j<random(10, 20); j++) myObjects.add(new particles(location.x, location.y, 245));
            }
         }
      }
      i++;
    }
    if (myShip.lives == 0) mode = gameover;
  }
}
