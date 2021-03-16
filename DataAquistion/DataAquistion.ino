//Fan Variables
double rpm = 0;
double halfrpm = 180;
int fan_control = 36;
//WORKING CODE
int Pulse_Input = 2;
int press_count = 0;

//Water Level Variables
const int sensorPin= A1; //sensor pin connected to analog pin A1 
double liquid_level;

// Led pins
int Red_Pin = 38; 
int Blue_Pin = 40;
int White_Pin = 42;

//Buzzer
int Buzzer = 34;

//Motor Control
int Motor_Control = 32;

// DHT initialization
#include "DHT.h"
#define DHTPIN 7     // Digital pin connected to the D HT sensor
#define DHTTYPE DHT11   // DHT 11

DHT dht(DHTPIN, DHTTYPE);

void setup() {
// put your setup code here, to run once:
  Serial.begin(9600);
pinMode(sensorPin, INPUT);//the liquid level sensor will be an input to the arduino 
pinMode(Red_Pin, OUTPUT);
pinMode(Blue_Pin, OUTPUT);
pinMode(White_Pin, OUTPUT);
pinMode(fan_control, OUTPUT);
pinMode(Buzzer, OUTPUT);
pinMode(Motor_Control, OUTPUT);
//pinMode(Pulse_Input,INPUT);

//WORKING CODE
attachInterrupt(digitalPinToInterrupt(Pulse_Input),pulse_state,RISING);

dht.begin();

}

void loop() {

 // put your main code here, to run repeatedly: 
  //fan controller
  //if (Serial.available() > 0) {
  //rpm =Serial.read();
  //Serial.println(rpm);
//  }
//  byte b2 =Serial.read();
//  rpm = b2 + b1*256;
 //Serial.println(rpm);
  delay(1000);
  //press_count =Serial.read();
  rpm=2*press_count;
  Serial.println(rpm);
  //WORKING CODE BELOW
  //rpm = 2*press_count;
  //Serial.println(rpm);
  press_count = 0;
  
  if (rpm > halfrpm) {
    digitalWrite(fan_control, HIGH);
  } 
  else{
    digitalWrite(fan_control, LOW);
 }

  liquid_level= analogRead(sensorPin); //arduino reads the value from the liquid level sensor

  //float h = dht.readHumidity();
  // Read temperature as Celsius (the default)
  double t = dht.readTemperature(); 
  Serial.println(t);
  Serial.println(liquid_level);

  if (t > 27 || liquid_level > 200) {
    digitalWrite(White_Pin, LOW);
    digitalWrite(Buzzer, HIGH);
    digitalWrite(Motor_Control, LOW);
    if (t > 27) {
      digitalWrite(Red_Pin, HIGH);
      }
    if (liquid_level > 200) {
      digitalWrite(Blue_Pin, HIGH);
      }  
  }
    if (t < 27 && liquid_level <200){
      digitalWrite(Red_Pin, LOW);
      digitalWrite(Blue_Pin, LOW);
      digitalWrite(Buzzer, LOW);
      digitalWrite(White_Pin, HIGH);
      digitalWrite(Motor_Control, HIGH);
     }
     
  
 }

 //WORKING CODE BELOW
  void pulse_state(){
 press_count=press_count+1;
}
 
