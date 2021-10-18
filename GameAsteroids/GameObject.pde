class GameObject {

  int lives;
  float size;
  float size1;
  PVector location;
  PVector velocity;
  boolean UFObullet;

  GameObject() {
  }

  void show() {

  }

  void offScreen(){
  if (location.x < 0 || location.x > width || location.y <0 || location.y > height)
      lives = 0;
  } 
  

  void act() {
    location.add(velocity); 


   
  }
}
