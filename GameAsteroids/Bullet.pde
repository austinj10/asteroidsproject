class Bullet extends GameObject {

  //bullet off screen
  int timer;

  //constructor(s)
  Bullet() {
    timer = 60;
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    size = 10;
    UFObullet = false;
  }
  
  Bullet(float locx, float locy, float velx, float vely) {
    timer = 60;
    lives = 1;
    location = new PVector(locx, locy);
    velocity = new PVector(velx, vely);
    velocity.setMag(7);
    size = 10;
    UFObullet = true;
  }

  void show() {
    stroke(255);
    fill(155, 155, 155);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}
