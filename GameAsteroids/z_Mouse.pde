void mouseReleased(){
  if (mode == intro){
    introClicks();
  } else if (mode == game){
    gameClicks();
  } else if (mode == pause){
    pauseClicks();
  } else if (mode == gameover){
    gameoverClicks();
  } else if (mode == win){
    winClicks();
  } else {
    println("Error: Mode = " + mode);
  }
}
