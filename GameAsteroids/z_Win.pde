void win(){
  background(#585A64);
  textSize(100);
  text ("you win!", width/2, height/2);
}

void winClicks(){
   setup();
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    mode = intro;
  }
}
