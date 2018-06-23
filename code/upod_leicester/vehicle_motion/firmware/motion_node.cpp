/***
designed by feifei
created by wawa
From leicester university team
Email:736499127wawa@gmail.com

***/

#if (ARDUINO >= 100)
 #include <Arduino.h>
#else
 #include <WProgram.h>
#endif

#include <ros.h>
#include <Servo.h>  
#include <cavlab_core/PodDemand.h>

ros::NodeHandle  nh;
Servo mymotor,servo;

float angle_ini= 99.0;
float i,angle;
int angle1;
float V,Mrmp;


//For rosserial void nh.loginfo() can only publish string data.
//showme_servo will help you check the signal you write to servo
void showme_servo(float value){
  char result[8];
  char log_msg[30];
  dtostrf(value,6,2,result);
  sprintf(log_msg,"servo angle is %s",result);
  nh.loginfo(log_msg);
  }
  
//showme_motor will help you check the signal you write to motor 
void showme_motor(int value){
  char result[8];
  char log_msg[30];
  dtostrf(value,6,2,result);
  sprintf(log_msg,"motor angle is %s",result);
  nh.loginfo(log_msg);
}



void servo_cb( const cavlab_core::PodDemand& cmd_msg){
  
  V = cmd_msg.speed; 
  
  // according to Ackmansteering, our servo's effective angle range is [48,150]
 //you have to scale it to your max and min angle of your design  
  angle = (atan(cmd_msg.steer * 0.19)* 180/PI)*9.392+99;
  
  // make sure velocity is positive because our vehicle cannot backward  
  if (V>=0)
  {

  angle1= 24.96*V/(PI*0.08*4.15)+60;
  showme_motor(angle1);
  mymotor.write(angle1); //set servo angle, should be from 0-180 
  nh.loginfo("--motor is powering on--");
  } 
  
  // this for loop is to make the steering move smoothly and gradually
  // you can change the delay time to meet your requirement
  if(angle >= angle_ini){
  for(i=angle_ini;i<=angle;i++){
      showme_servo(i);
      servo.write(i);
      delay(6);
    }
  } else if(angle <angle_ini){
    for(i=angle_ini;i>=angle;i--){
      showme_servo(i);
      servo.write(i);
      delay(6);
    }
    }
    angle_ini = angle;//store the angle_ini
}

// the subscribed topic should be changed to age_checked_pod_demand
ros::Subscriber<cavlab_core::PodDemand> sub("/cavlab_core/pod_demand_age_checked", servo_cb);

void setup() {
  mymotor.write(20);
//  servo.write(103);
  nh.initNode();
  nh.subscribe(sub);

  
 // signal wire connection
  mymotor.attach(7);
  servo.attach(13);
  
}

void loop() {
  
  nh.spinOnce();
  delay(1);  
}

