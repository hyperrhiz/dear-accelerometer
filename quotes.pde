
//This function uses the ranges of the X, Y, and Z
//accelerometer data as the basis for changing the
//"Dear Accelerometer" quotes in the right-hand
//column of the Processing sketch. Presently, there
// are 8 quotes associated with this Arduino _2.
void quotes(int x, int y, int z) {
 
 println(x + ", " + y + ", " + z);
 
  if(x < 345) {
    
    if(y > 330) {
      
       if(z > 350) {
         
         image(quotes[0], 935, 159);
         println("0");
         
        }
        else if(z <= 350) {
          
         image(quotes[1], 935, 159);
         println("1");
         
        }
        
    }
    
    else if(y <= 330) {
     
        if(z > 350) {
          
         image(quotes[2], 935, 159);
         println("2");
         
        }
        
        else if(z <= 350) {
          
          image(quotes[3], 935, 159);
          println("3");
          
        }
        
    }
    
  }
    
  
  else if(x >= 345) {
    
    if(y > 330) {
      
       if(z > 350) {
         
         image(quotes[4], 935, 159);
         println("4");
         
        }
        
        else if(z <= 350) {
          
         image(quotes[5], 935, 159);
         println("5");
       
        }
      
  }
    
    else if(y <= 330) {
     
        if(z > 350) {
          
         image(quotes[6], 935, 159);
         println("6");
         
        }
        
        else if(z <= 350) {
          
          image(quotes[7], 935, 159);
          println("7");
          
        }
        
      }

    }
  
//end   
}
