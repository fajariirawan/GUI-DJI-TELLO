void drawCopter_()
{

  angx=roll;
  angy=pitch;
  head=yaw;
  stroke(255);

  //a=radians(angx);
  //if (angy<-90) {
  //  b=radians(-180 - angy);
  //} else if (angy>90) {
  //  b=radians(+180 - angy);
  //} else { 
  //  b=radians(angy);
  //}
  //h=radians(head);

  //a=radians(pitch);
  //b=radians(roll);
  //h=radians(yaw);

  a=radians(sudut_roll);
  b=radians(sudut_pitch);
  h=radians(sudut_yaw);



  float size = 35.0;
  // object
  pushMatrix();
  camera(xObj, yObj, 300/tan(PI*60.0/360.0), xObj/2+30, yObj/2-40, 0, 0, 1, 0);
  translate(xObj, yObj);
  directionalLight(200, 200, 200, 0, 0, -1);

  //  rotateY(radians(-1*(hm.get("yaw")+180)));
  //rotateZ(radians(hm.get("roll")));
  //rotateX(radians(-1*hm.get("pitch")));
  rotateY(a);
  rotateZ(h);
  rotateX(b);


  stroke(150, 255, 150);
  strokeWeight(0);
  sphere(size/3);
  strokeWeight(3);
  line(0, 0, 10, 0, -size-5, 10);
  line(0, -size-5, 10, +size/4, -size/2, 10); 
  line(0, -size-5, 10, -size/4, -size/2, 10);
  stroke(0);

  if (multiType == QUADX) { //QUAD X
    drawMotor(+size, +size, byteMP[0], 'R');
    drawMotor(+size, -size, byteMP[1], 'L');
    drawMotor(-size, +size, byteMP[2], 'L');
    drawMotor(-size, -size, byteMP[3], 'R');
    line(-size, -size, 0, 0);
    line(+size, -size, 0, 0);
    line(-size, +size, 0, 0);
    line(+size, +size, 0, 0);
    noLights();
    fill(255, 0, 255);
    text("Quadcopter", -40, -70);
    camera();
    popMatrix();
  } else if (multiType == BI) { //BI
    drawMotor(-size, 0, byteMP[0], 'R');
    drawMotor(+size, 0, byteMP[1], 'L');
    line(0-size, 0, 0, 0);  
    line(0+size, 0, 0, 0);
    //line(0, size*1.5, 0, 0);
    noLights();
    fill(255, 0, 255);
    text("Bicopter", -30, -40);
    camera();
    popMatrix();
  }
}

void drawMotor(float x1, float y1, int mot_num, char dir) {   //Code by Danal
  float size = 30.0;
  pushStyle();
  float d = 0;
  if (dir == 'L') {
    d = +5; 
    fill(254, 221, 44);
  } 
  if (dir == 'R') {
    d = -5; 
    fill(256, 152, 12);
  }
  ellipse(x1, y1, size, size);
  textFont(font15);
  textAlign(CENTER);
  popStyle();
}

