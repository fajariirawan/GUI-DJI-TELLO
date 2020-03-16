import processing.opengl.*;
import hypermedia.net.*;
import java.util.Map;
import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
//import org.gamecontrolplus.gui.*;
//import org.gamecontrolplus.*;
//import net.java.games.input.*;
ControlP5 cp5;
UDP udp;

//ControlIO control;
//ControlDevice stick;
//ControlHat hat;

//background
PImage img,_compas;


int pX, pY, pZ;

//ToxiclibsSupport gfx;
char[] teapotPacket = new char[14];  // InvenSense Teapot packet
int serialCount = 0;                 // current packet byte position
int aligned = 0;
int interval = 0;

float[] q = new float[4];

float[] gravity = new float[3];
float[] euler = new float[3];
float[] ypr = new float[3];

HashMap<String, Float> hm = new HashMap<String, Float>(17);

color yellow_ = color(200, 200, 20), green_ = color(46, 209, 2), red_ = color(120, 30, 30), blue_ = color (0, 102, 200);
color white_ = color(255, 255, 255), black_ = color(0, 0, 0), pink_ = color(255, 0, 255);


PShape Base, Atas, Motor, Propeller;

float rotX, rotY;
float angle = 0;
Float angleDirection=1.0;
float speed = 0.005;

PFont font8, font9, font12, font15, font30, font50;
float a, b, h, angx, angy, head;
int xObj        = 100;        
int yObj        = 400;

int multiType;
int QUADX       =1;
int BI          =2;

int byteMP[] = new int[8];  // Motor Pins.  Varies by multiType and Arduino model (pro Mini, Mega, etc).

int PosXslider = 550;
int PosYslider = 100;

float sudut_roll, sudut_pitch, sudut_yaw;
int bat, temp, _temp, compas, alt, time;

int[] rc_command=new int[4];
void setup() {
  size(800, 600, OPENGL);
  img=loadImage("img.png");
 _compas=loadImage("compas.png");
 
  lights();
  smooth();
  //frameRate(20);
  font8 = createFont("Arial bold", 8, false);
  font9 = createFont("Arial bold", 9, false);
  font12 = createFont("Arial bold", 12, false);
  font15 = createFont("Arial bold", 15, false);
  font30 = createFont("Arial bold", 30, false);
    font50 = createFont("Arial bold", 50, false);
  
  Base      = loadShape("Base.obj");
  Atas      = loadShape("atas.obj");
  Motor     = loadShape("Motor1.obj");
  Propeller = loadShape("propeller1.obj");

  Base.disableStyle();
  Atas.disableStyle();
  Motor.disableStyle();
  Propeller.disableStyle();

  //  cp5 = new ControlP5(this);
  //
  //  cp5.addSlider("sudut_roll")
  //    .setPosition(PosXslider, PosYslider+(20*1))
  //      .setRange(-180, 180)
  //        ;
  //
  //  cp5.addSlider("sudut_pitch")
  //    .setPosition(PosXslider, PosYslider+(20*2))
  //      .setRange(-180, 180)
  //        ;
  //
  //  cp5.addSlider("sudut_yaw")
  //    .setPosition(PosXslider, PosYslider+(20*3))
  //      .setRange(0, 360)
  //        ;

  multiType=1;

  //    control = ControlIO.getInstance(this);
  //  stick = control.filter(GCP.STICK).getMatchedDevice("tello-v1");
  //  if (stick == null) {
  //    println("No suitable device configured");
  //   // System.exit(-1); // End the program NOW!
  //  }

  udp = new UDP(this, 8890);
  udp.listen(true);
  //udp.setReceiveHandler("receiveFromTello");

  sendData("command");


  hm.put("roll", 0.0);
  hm.put("pitch", 0.0);
  hm.put("yaw", 0.0);


  hm.put("h", 0.0);
  hm.put("bat", 0.0);
  hm.put("time", 0.0);
  hm.put("temph", 0.0);

  //  hat = stick.getHat("HAT");
  //stick.getButton("BASE2").plug(this, "takeOff", ControlIO.ON_PRESS);
  //stick.getButton("BASE").plug(this, "landing", ControlIO.ON_PRESS);
  
  
 
 
}
void draw()
{
  background(img);
  yaw=hm.get("yaw");
  pitch=hm.get("pitch");
  roll=hm.get("roll");
  
  

  //   pX = int(map(stick.getSlider("X").getValue(), -1, 1, -100, 100));     // Position X
  //pY = int(map(stick.getSlider("Y").getValue(), -1, 1, 100, -100));     // Position Y
  //pZ = int(map(hat.getY(), -1, 1, 100, -100));                          // Position Z
  //yaw = int(map(stick.getSlider("RZ").getValue(), -1, 1, -100, 100));   // Yaw

  //sendCommand("rc " + pX + " " + pY + " " + pZ + " " + yaw);  

  obj_tello();
  //drawCopter_();
  //draw_UAV_();
  
  //gui
   bat();
   temp();
   imu();
   set_compas();
   textIMU();
   alt();
   time();
}

