void pause(){
  //text
  fill(255);
  textFont(NightTrippers);
  textSize(100);
  text("pause",width/2,height/2-50);
}

void pauseClicks(){
  if (mouseX > 0 && mouseX <  width && mouseY > 0 && mouseY < height){
    mode = game;
  }
}
