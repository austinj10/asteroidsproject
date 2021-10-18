class Fire extends GameObject { 

  //instance variable
  int t;//transparency

  PVector nudge;

  //constructor
  Fire() {
    lives = 1;
    size = int(random(5, 15));
    t = int(random(150, 255));
    //location = new PVector(myShip
    location = myShip.location.copy();
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(30);
    location.add(nudge);

    velocity = myShip.direction.copy();
    velocity.rotate(PI+random(-0.5, 0.5));//180 degrees change
    velocity.setMag(3);//how many pixels per frame moved
  }



  void show() {
    noStroke();
    fill(#40414B, t);
    square(location.x, location.y, size);
  }



  void act() {
    super.act();
    t = t - 8;
    if (t <= 0) lives = 0;
  }
}
