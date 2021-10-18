  PImage [] gif;
  int numberofFrames;
  int f;

void intro(){
  
  //gif
  numberofFrames = 49;
  gif = new PImage[numberofFrames];
  
  int i = 0;
  while (i < numberofFrames){
    gif[i] = loadImage("frame_"+i+"_delay-0.04s.gif"); 
    i = i + 1;
  }
  
  //draw gif
  image(gif[f], width/2, height/2, 800, 600);
  println(frameCount);
  if (frameCount % 1 == 0) f = f + 1;
  if (f == numberofFrames) f = 0;
  
  //title text
  fill(black);
  textFont(NightTrippers);
  textSize(100);
  text("asteroids!",width/2,200);
}

void introClicks(){
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    mode = game;
  }
}
