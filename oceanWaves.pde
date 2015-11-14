

//This function simulates the movement of the 
//ocean waves by oscillating between the opacity
//or alpha of two versions of the same image that
//are on an overlapping off-set.
void oceanWaves() {
   
  tint(255,255);
  
  image(ocean1, 0,0);
  
  if(!tintOscillator) {
    tint(255, map(frameTintVar, 0, 20, 0, 255)); 
  }
  else {
    tint(255, map(frameTintVar, 0, 20, 255, 0));     
  }
  
  image(ocean2, 0,0);
  tint(255,255);
 
}
