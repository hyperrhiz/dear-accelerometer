
//Import serial and sound (minim) libs
import processing.serial.*; 
import ddf.minim.*;

//Instantiate a serial object
Serial myPort;  

int[] wayveData = new int[3]; // Hold X, Y, Z data from accelerometer
String val; //
int sumMapped, sumMappedStable;
int tintMapped;
int changeTint;

Minim minim;

AudioPlayer   p0, //ocean sounds
              p1, //Dear Esther narration
              p2, //Voice of news reporter
              p3, //Voice of Greek islander expressing frustration
              p4, //Voice of migrant describing hardship
              p5; //Sounds of Greek demonstration against migrant boat landings
              
AudioPlayer[] p = { p0, p1, p2, p3, p4, p5 };

PImage bg1, bg2, bg, frame, ocean1, ocean2, q0, q100;
PImage q1, q2, q3, q4, q5, q6, q7, q8, q9, q10; 
PImage[] quotes = { q1, q2, q3, q4, q5, q6, q7, q8, q9, q10 };

int frameTintVar, tintChange, tintLengthCounter;
int[] tintLength = new int[3];
Boolean tintOscillator, wayveReader;

int sumStable;

void setup() {
  
  size(1366,768); 
  
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n'); 

  minim = new Minim(this);
    p[0] = minim.loadFile("x0.mp3", 512);
    p[1] = minim.loadFile("x1.mp3", 512);
    p[2] = minim.loadFile("y0.mp3", 512);
    p[3] = minim.loadFile("x0.mp3", 512);
    p[4] = minim.loadFile("z0.mp3", 512);
    p[5] = minim.loadFile("z1.mp3", 512);
    
    p[0].play(); 
    p[0].loop();
    p[1].play(); 
    p[1].loop(); 
    p[2].play();  
    p[2].loop();   
    p[3].play();     
    p[3].loop(); 
    p[4].play(); 
    p[4].loop();
    p[5].play(); 
    p[5].loop(); 

  wayveData[0] = 0;
  wayveData[1] = 0;
  wayveData[2] = 0;  

  //Load the quotes that will displayed
  //in right-hand column  
  quotes[0] = loadImage("q2.png");
  quotes[1] = loadImage("q3.png");
  quotes[2] = loadImage("q4.png");
  quotes[3] = loadImage("q5.png");
  quotes[4] = loadImage("q6.png");
  quotes[5] = loadImage("q7.png");
  quotes[6] = loadImage("q8.png");
  quotes[7] = loadImage("q9.png");
  quotes[8] = loadImage("q10.png");


  // The two ocean images used to 
  //simulate moving ocean waves
  ocean1 = loadImage("ocean1.png");
  ocean2 = loadImage("ocean2.png");
  //The rectangular frame with cutouts
  //in which everything is displayed
  frame = loadImage("frame.png");

  
  sumMapped = 0; //
  sumMappedStable = sumMapped; //
  
  frameTintVar = 0; // 
  tintOscillator = false; // false, it gets bigger, true it gets smaller
  wayveReader = false; //
  tintChange = 0; //
  
  tintLength[0] = 20;
  tintLength[1] = 60;
  tintLength[2] = 40;
  tintLengthCounter = 0;
  
  sumMapped = 0;
    
}

void draw() {
  
  background(200);
    
  p[0].setGain(map(wayveData[0], 269, 406, -30, 14.0));
  p[1].setGain(map(wayveData[0], 269, 406, -30, 14.0));
  p[2].setGain(map(wayveData[1], 188, 198, -30, 3.0)); 
  p[3].setGain(map(wayveData[1], 198, 188, -30, 14.0));
  p[2].setGain(map(wayveData[2], 165, 240, -30, 3.0)); 
  p[3].setGain(map(wayveData[2], 240, 165, -30, 14.0));
  
  myPort.write("_2");
  
  delay(100);
    
  frameTintVar++;
  
  if(frameTintVar > 20) {
    frameTintVar = 0;
    
    if(tintOscillator) {
      tintOscillator = false;
    }
    else {
      tintOscillator = true;
    }
  }
    
  oceanWaves();
 
  image(frame,0,0);
 
  if(wayveReader) {
    quotes(wayveData[0], wayveData[1], wayveData[2]);
  }

}

void serialEvent( Serial myPort) {

   val = myPort.readStringUntil('\n');
   
   if (val != null) {
      
     val = trim(val);
             
     parseData(val);

     wayveReader = true;
     
     myPort.clear();
 
     }
}  



