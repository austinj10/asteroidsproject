//Austin Jeon
//October 4, 2021
//1-4



boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;
UFO myUFO;
ArrayList<GameObject> myObjects;

//mode framework
int mode;
final int intro = 1;
final int game = 2;
final int pause = 3;
final int gameover = 4;
final int win = 5;

//text
PFont NightTrippers;

//score
int score;

//pallette
color grey = #585A64;
color white = #FFFFFF;
color black = #000000;

void setup() {
  mode = intro;
  
  //fullScreen(FX2D);
  size(800, 600, FX2D);
  imageMode(CENTER);
  rectMode(CENTER);
  myShip = new Ship(); 
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myUFO = new UFO();
  myObjects.add(myUFO);
  for(int x = 0; x < 4; x++){
  myObjects.add(new Asteroid());
  }
  

  int i = 0; 
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    i++;
  }
  
  //text
  textAlign(CENTER,CENTER);
  NightTrippers = createFont("Night Trippers.otf",200);
  
  //initialize 
  score = 0;
  
}

void draw() {
  
    if (mode == intro){
    intro();
  } else if (mode == game){
    game();
  } else if (mode == pause){
    pause();
  } else if (mode == gameover){
    gameover();
  } else if (mode == win){
    win();
  } else {
    println("Error: Mode = " + mode);
  }
  
}

void keyPressed() {
  if (keyCode == UP) upkey = true; 
  if (keyCode == DOWN) downkey = true; 
  if (keyCode == LEFT) leftkey = true; 
  if (keyCode == RIGHT) rightkey = true; 
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false; 
  if (keyCode == DOWN) downkey = false; 
  if (keyCode == LEFT) leftkey = false; 
  if (keyCode == RIGHT) rightkey = false; 
  if (key == ' ') spacekey = false;
}
