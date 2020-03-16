void sendData(String input) {
  byte[] byteBuffer = input.getBytes();
  udp.send(byteBuffer, "192.168.10.1", 8889);
}

void receive( byte[] data ) {  
  String received = "";
  for (int i=0; i < data.length; i++) {
    received+=char(data[i]);
  }  
  println(received);
  String[] rawArray = split(received, ';');
  for (int i = 0; i < rawArray.length - 1; i++) {
    String[] telloData = split(rawArray[i], ':');
    hm.put(telloData[0], float(telloData[1]));
  }
}

void takeOff() {
  println("Take Off");
  sendCommand("takeoff");
}

void landing() {
  println("Landing");
  sendCommand("land");
}

void sendCommand(String input) {
  println(input);
  byte[] byteBuffer = input.getBytes();
  udp.send(byteBuffer, "192.168.10.1", 8889);
}

//void receiveFromTello( byte[] data ) {    
//  String received = "";
//  for (int i=0; i < data.length; i++) {
//    received+=char(data[i]);     
//  }  
//  //println(received);
//}

void keyPressed() {

  char formatedKey = key;
  // Take and Land
  //  if     (formatedKey == 'x') {
  //    sendData("takeoff");
  //  } else if (formatedKey == 'z') {
  //    sendData("land");
  //  } else if (formatedKey == 'w') {
  //    sendData("forward 30");
  //  } else if (formatedKey == 'a') {
  //    sendData("left 30");
  //  } else if (formatedKey == 's') {
  //    sendData("back 30");
  //  } else if (formatedKey == 'd') {
  //    sendData("right 30");
  //  } else if (formatedKey == 'u') {
  //    sendData("up 30");
  //  } else if (formatedKey == 'q') {
  //    sendData("ccw 30");
  //  } else if (formatedKey == 'j') {
  //    sendData("down 30");
  //  } else if (formatedKey == 'e') {
  //    sendData("cw 30");
  //  }

  if     (formatedKey == 'x') {
    sendData("takeoff");
  } else if (formatedKey == 'z') {
    sendData("land");
  } else if (formatedKey == 'u') {
    sendData("up 30");
  } else if (formatedKey == 'j') {
    sendData("down 30");
  } else if (formatedKey == 'w'||formatedKey == 'a'||formatedKey == 's'||formatedKey == 'd'||formatedKey == 'q'||formatedKey == 'e'||key == CODED) {
    if (formatedKey == 'w') {
      rc_command[1] = 1;
    } else if (formatedKey == 's') {
      rc_command[1] = -1;
    }
    
    if (formatedKey == 'd') {
      rc_command[0] = 1;
    } else if (formatedKey == 'a') {
      rc_command[0] = -1;
    }
    
    if (formatedKey == 'e') {
      rc_command[3] = 1;
    } else if (formatedKey == 'q') {
      rc_command[3] = -1;
    }
    
    if (keyCode == UP) {
      rc_command[2] = 1;
    } else if (keyCode == DOWN) {
      rc_command[2] = -1;
    }
    
    sendData("rc "+ rc_command[0]*75+" "+ rc_command[1]*75+" "+ rc_command[2]*75+" "+ rc_command[3]*75);
    
  } 
}

void keyReleased() {
  char formatedKey = key;
  if (formatedKey == 'd'||formatedKey == 'a') {
      rc_command[0] = 0;
    }
    
    if (formatedKey == 'w'||formatedKey == 's') {
      rc_command[1] = 0;
    }
    
    if (formatedKey == 'q'||formatedKey == 'e') {
      rc_command[3] = 0;
    }
    if (keyCode == DOWN||keyCode == UP) {
      rc_command[2] = 0;
    }
     sendData("rc "+ rc_command[0]*20+" "+ rc_command[1]*20+" "+ rc_command[2]*20+" "+ rc_command[3]*20);
}
