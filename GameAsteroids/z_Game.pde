int timer;

void game(){
  background(grey);
  timer++;
  
  int i = 0;
  while ( i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myObjects.remove(i); 
    } else {
      i++;
    }
  }
  
  if (timer == 400){
    myObjects.add(new UFO());
    timer = 0;
  }
    
  //score text
  fill(255);
  textSize(40);
  text("lives:" + myShip.lives, 70,560);
  
  //lives text
  fill(255);
  textSize(40);
  text("score:" + score, 720,560);
  
  //win
  if (score == 28) mode = win;
  
  //lose
  if (myShip.lives == 0) mode = gameover;
  
  
}

void gameClicks(){
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    mode = pause;
  }
}
