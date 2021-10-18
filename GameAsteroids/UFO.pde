class UFO extends GameObject{
 
  int shotTimer, threshold;
  float x;

  //2 constructor(s)
  UFO() {
    lives = 1;
    x = (int)random(4);
    if (x==0){
      //spawn left 
      location = new PVector(0, height/2);
      velocity = new PVector(3, 0);
    } else if (x==1){
      //top 
      location = new PVector(width/2, 0);
      velocity = new PVector(0, 3);
    } else if (x==2){
      //right 
      location = new PVector(width, height/2);
      velocity = new PVector(-3,0);
    } else if (x==3){
      //bottom 
      location = new PVector(width/2, height);
      velocity = new  PVector(0, -3);
    } 
    shotTimer = threshold = 200;
  }

  //3 behaviour functions
  void show() {
    pushMatrix();
    stroke(255);
    noFill();
    square(location.x,location.y,40);
    popMatrix();
  } 

  void act() {
    super.act();
    shotTimer++;
    if (shotTimer>threshold) {
      shotTimer = 0;
      myObjects.add(new Bullet(location.x, location.y, myShip.location.x-location.x, myShip.location.y-location.y));
    }
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && !myObj.UFObullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size + myObj.size) {
          lives--;
          myObj.lives = 0;
          for (int j=0; j<random(10, 20); j++) myObjects.add(new particles(location.x, location.y, 125));
        }
      }
      i++;
    }
    shotTimer++;
    if (location.x < 0 || location.x > width || location.y <0 || location.y > height) {
      lives = 0;
    }
    if (shotTimer>threshold) {
      shotTimer = 0;
      myObjects.add(new Bullet(location.x, location.y, myShip.location.x-location.x, myShip.location.y-location.y));
    }
  




        
      
      
      
      i++;
      if (location.x < 0 || location.x > width || location.y <0 || location.y > height) {
      lives = 0;
      }
    }
  }

          
            
         
