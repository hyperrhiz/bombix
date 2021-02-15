import processing.serial.*;

// testing atom
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
int lux;
String [] riddle  = {
  "times of year", "weaving threads", "hairy threads", "sallow flesh", "soon I climb", "leafy tips", "bombyx mori", "craft small balls", "twists of fate"
};

PFont f;  // Global font variable

void setup()
{
  //size(800, 800);
  fullScreen();
  f = createFont("Arial",16,true);
  background(255);
  //fill(0);
  textFont(f,16);
  textAlign(LEFT);

 // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  int x = int(random(width));
  int y = int(random(height));
  int choose = int(random(riddle.length));

  while (myPort.available() > 0) {
    String inBuffer = myPort.readString();
    int lux = int(inBuffer);
    //println(inBuffer);
    if (inBuffer != null) {
      if (lux <= 25) {
        println(lux);
        fill(0);
        text("I see you",x,y);
      }
      else {
        println(lux);
        fill(240, 224, 136);
        text(riddle[choose],x,y);
      }
    }
  }
}
