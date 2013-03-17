/*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 *
 *  mix of House of Cards video data https://code.google.com/p/radiohead/
 *  Lee Byron library Mesh http://www.leebyron.com/else/mesh/
 *  and Diana Lang examples http://www.openprocessing.org/sketch/85413
 *
 *  to make it works you need a folder data with .csv with point coordinates
 *  they are all there -> https://code.google.com/p/radiohead/downloads/detail?name=HoC_AnimationData1_v1.0.zip
 *
 *//////////////////////////////////////////////////////////////

import processing.opengl.*;
import megamu.mesh.*;

PointCloud pc;
int cloudSize;

int frameCounter = 0;

void setup(){
  //String filename = "1.csv";
  size(1024,768, P3D);
  
  strokeWeight(1);
  //background (230);
  stroke (5);
  strokeWeight (0.5);
}
void draw(){
  frameCounter++;
  // We'll use a black background
  background(0);
  // The data has 0,0,0 at the center and we want to draw that point at the center of our screen
  translate(width/2, height/2); 
  // Lets adjust our center slightly
  translate(-150,-150);
  // Lets draw things bigger
  scale(2);
    // Here we load the current frame data into an array
  String[] raw = loadStrings(frameCounter+".csv");
  // Now we'll loop through each line of the raw data
  pc = new PointCloud (raw.length);
  float lastX = float(split(raw[0],',')[0]);
  float lastY = float(split(raw[0],',')[1]);
  for(int i = 1; i < raw.length;i++){
    // For each line we're going to divide up each paramety
    String[] thisLine = split(raw[i],',');
    // Now we will make a variable for each parameter specified in the file. They will be decimal values. 
    float x = float(thisLine[0]);
    float y = float(thisLine[1]);
    int intensity = int(thisLine[3]);
    pc.addParticel(new Particle (lastX, lastY, x, y,intensity));
    lastX = x;
    lastY = y;
  }
  pc.draw();
  //If we get to the end of the data we'll exit the program
  if(frameCounter<2){
//    String nowDate = "";
//    int s = second();  // Values from 0 - 59
//    int m = minute();  // Values from 0 - 59
//    int h = hour();    // Values from 0 - 23
//    int [] hms = {h, m, s};
//    for(int i = 0; i < hms.length; i++){
//      nowDate += String.valueOf(hms[i])+"_";
//    }
//    save("outs/"+nowDate+".jpg");
    //
    save("outs/"+frameCounter+".jpg");
    println("done");  
  }
  else{
    exit();
  }
}
