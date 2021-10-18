class Asteroid extends GameObject {

  Asteroid() {
    lives = 1;
    location = new PVector (random(0, width), random(0, height));
    velocity = new PVector (random(0.5,1.5), random(0.5,1.5));
    velocity.rotate(random(0, TWO_PI) );
    size = 100;
  }

  //broken asteroids
  Asteroid(float s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (random(0.5,1.5), random(0.5,1.5));
    velocity.rotate(random(0, TWO_PI) );
    size = s;
  }

  void show() {
    pushMatrix();
    fill(white);
    stroke(0);
    ellipse(location.x, location.y, size, size);
    popMatrix();
  }

  void act() {
    super.act();
    
    //reappear on screen
    if (location.y < -50) location.y = height+50;
    if (location.y > height + 50) location.y = -50;
    if (location.x < -50) location.x = width+50;
    if (location.x > width+50) location.x = -50;
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && !myObj.UFObullet) {
        
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
         
          lives=0;
          score++;
          if (lives == 0 && size > 30) {
            //myObjects.add(new particles());
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
          }
          for (int j=0; j<random(10, 20); j++) myObjects.add(new particles(location.x, location.y, 125));
        }
      }
      i++;
    }
  }
}
