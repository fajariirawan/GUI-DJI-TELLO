
void bat() {

  bat= int(hm.get("bat"));

  fill(23, 116, 186);
  textAlign(CENTER);
  textFont(font30);
  text(bat, 660, 140);
  rectMode(CENTER);
  if (bat>20) {
    rect(613, 143, 16, 5); //1
  }
  if (bat>40) {
      rect(613, 136, 16, 5); //2
    }
  if (bat>60) {
        rect(613, 129, 16, 5); //3
      }
  if (bat>80) {
        rect(613, 122, 16, 5); //4
      }
  if (bat>99) {
        rect(613, 115, 16, 5); //FULL
      }
    }

    void temp() {
  temp=int((hm.get("temph")-32)*5/9); //range -10 to 50
  text(temp, 761, 140);
  rectMode(CORNER);
      _temp=int(map(temp, -10,50,0,-30));
      rect(704, 140, 4, _temp);//full (-30 to 0)0=empty
      
    }

void imu(){
    float j;
    float horizonInstrSize;
    float angyLevelControl;
  
  angy=-1*hm.get("pitch");
 a=-radians(hm.get("roll"));
  // ---------------------------------------------------------------------------------------------
  // Magnetron Combi Fly Level Control
  // ---------------------------------------------------------------------------------------------
  horizonInstrSize=68;
  angyLevelControl=((angy<-horizonInstrSize) ? -horizonInstrSize : (angy>horizonInstrSize) ? horizonInstrSize : angy);
  pushMatrix();
  translate(694,308);
  noStroke();
  // instrument background
  fill(50,50,50);
  ellipse(0,0,150,150);
  // full instrument
  rotate(-a);
  rectMode(CORNER);
  // outer border
  strokeWeight(1);
  stroke(90,90,90);
  //border ext
  arc(0,0,140,140,0,TWO_PI);
  stroke(190,190,190);
  //border int
  arc(0,0,138,138,0,TWO_PI);
  // inner quadrant
  strokeWeight(1);
  stroke(255,255,255);
  fill(124,73,31);
  //earth
  float angle = acos(angyLevelControl/horizonInstrSize);
  arc(0,0,136,136,0,TWO_PI);
  fill(38,139,224); 
  //sky 
  
  
  arc(0,0,136,136,HALF_PI-angle+PI,HALF_PI+angle+PI);
  float x = sin(angle)*horizonInstrSize;
  if (angy>0) 
    fill(124,73,31);
  noStroke();   
  triangle(0,0,x,-angyLevelControl,-x,-angyLevelControl);
  // inner lines
  strokeWeight(1);
  for(int i=0;i<8;i++) {
    j=i*15;
    if (angy<=(35-j) && angy>=(-65-j)) {
      stroke(255,255,255); line(-30,-15-j-angy,30,-15-j-angy); // up line
      fill(255,255,255);
      textFont(font9);
      text("+" + (i+1) + "0", 34, -12-j-angy); //  up value
      text("+" + (i+1) + "0", -48, -12-j-angy); //  up value
    }
    if (angy<=(42-j) && angy>=(-58-j)) {
      stroke(167,167,167); line(-20,-7-j-angy,20,-7-j-angy); // up semi-line
    }
    if (angy<=(65+j) && angy>=(-35+j)) {
      stroke(255,255,255); line(-30,15+j-angy,30,15+j-angy); // down line
      fill(255,255,255);
      textFont(font9);
      text("-" + (i+1) + "0", 34, 17+j-angy); //  down value
      text("-" + (i+1) + "0", -48, 17+j-angy); //  down value
    }
    if (angy<=(58+j) && angy>=(-42+j)) {
      stroke(127,127,127); line(-20,7+j-angy,20,7+j-angy); // down semi-line
    }
  }
  strokeWeight(2);
  stroke(255,255,255);
  if (angy<=50 && angy>=-50) {
    line(-40,-angy,40,-angy); //center line
    fill(255,255,255);
    textFont(font9);
    text("0", 34, 4-angy); // center
    text("0", -39, 4-angy); // center
  }

  // lateral arrows
  strokeWeight(1);
  // down fixed triangle
  stroke(60,60,60);
  fill(180,180,180,255);

  triangle(-horizonInstrSize,-8,-horizonInstrSize,8,-55,0);
  triangle(horizonInstrSize,-8,horizonInstrSize,8,55,0);

  // center
  strokeWeight(1);
  stroke(255,0,0);
  line(-20,0,-5,0); line(-5,0,-5,5);
  line(5,0,20,0); line(5,0,5,5);
  line(0,-5,0,5);
  popMatrix();
  
  }
  
  
void set_compas(){
  pushMatrix();
  compas=int(hm.get("yaw"));
  translate(777,244);
   imageMode(CENTER);
  rotate(radians(compas));
  image(_compas, 0,0); 
popMatrix();
}

  void textIMU(){
    textAlign(CENTER);
      fill(23, 116, 186);
    textFont(font30);
    text(int(hm.get("roll")), 623,445);
       text(int(hm.get("pitch")),692,445);
          text(int(hm.get("yaw")),764,445);
  }
  
  void alt(){
    alt=int(hm.get("h"))/10;
    fill(23, 116, 186);
    textFont(font50);
    textAlign(CENTER);
    text(alt,698, 530);
  }
  
  void time(){
    time=int(hm.get("time"));
    int _time=0;
      fill(23, 116, 186);
    textFont(font15);
    textAlign(CENTER);

       
    text(int(time/60)+":"+time%60,698, 206);
  }
  
