void obj_tello()
{
  pushMatrix();
  smooth();
  lights();
  noStroke();

  translate(288,384); //center posisi pada gui
  scale(0.04);

  rotateX(0.9200007);
  rotateY(-0.019999873); 

  //rotateX(rotX);
  //rotateY(rotY);

  translate(0, 0, 0);
  fill(black_);
  rotateX(radians(pitch));
  rotateY(radians(-roll));
  rotateZ(radians(yaw));
  shape(Base);


  pushMatrix();
  fill(white_);
  translate(0, 0, 90);
  scale(25);
  shape(Atas);

  fill(white_, 245);
  translate(43, 43, 3);
  scale(0.04);
  shape(Motor);

  fill(white_, 245);
  translate(-2159, 5, 3);
  shape(Motor);

  fill(white_, 245);
  translate(-8, -2160, 3);
  shape(Motor);

  fill(white_, 245);
  translate(2170, -15, 3);
  shape(Motor);

  pushMatrix();
  fill(black_);
  translate(0, 2175, 230);
  scale(4);
  rotateX(89.5);
  rotateZ(89.6);
  //rotateX(angle);
  shape(Propeller);
  popMatrix();

  pushMatrix();
  fill(black_);
  translate(15, 0, 240);
  scale(4);
  rotateX(89.5);
  rotateZ(89.6);
  //rotateX(angle);
  shape(Propeller);
  popMatrix();

  pushMatrix();
  fill(black_);
  translate(-2175, 0, 240);
  scale(4);
  rotateX(89.5);
  rotateZ(89.6);
  //rotateX(angle);
  shape(Propeller);
  popMatrix();

  pushMatrix();
  fill(black_);
  translate(-2175, 2175, 240);
  scale(4);
  rotateX(89.5);
  rotateZ(89.6);
  //rotateX(angle);
  shape(Propeller);
  popMatrix();

  popMatrix();

  angle += speed + angleDirection;
  if ((angle > PI) || (angle < 0)) {
    angleDirection *= -0.05;
  } 
  popMatrix();
}
