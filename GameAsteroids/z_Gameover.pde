void gameover(){
  background(#585A64);
  textSize(100);
  text ("you lose!", width/2, height/2);
}


void gameoverClicks(){
    setup();
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    mode = intro;
  }
   
}
