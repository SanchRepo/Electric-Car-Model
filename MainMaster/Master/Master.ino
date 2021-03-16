int INPUT_VOLTAGE=A0;
float val = 0.0;
float dutycycle = 0.0;
float maxvol= 1023.0;
int PWM_out=9;
float maxdc=255;
int press_count=0;
int Pulse_Input=2;
float rpm = 0;
double halfrpm = 180;
float cruise = 170; //rpm is 166
double ccontrol = 0;
float maxrpm = 348;
float jumpval = 0;
float cdutycycle=0;
float sdutycycle=0;


// pinMode(INPUT_PIN,INPUT);

void setup() {
// put your setup code here, to run once:
Serial.begin(9600);
TCCR2B=(TCCR2B & 0xF8)|0x03;
//pinMode(Pulse_Input,INPUT);
pinMode(INPUT_VOLTAGE,INPUT);
pinMode(PWM_out,OUTPUT);

attachInterrupt(digitalPinToInterrupt(Pulse_Input),pulse_state,RISING);

}

void loop() {
 // put your main code here, to run repeatedly:

 val=analogRead(INPUT_VOLTAGE);
 dutycycle=(val/maxvol);
 //cdutycycle=(rpm/maxrpm);
 //sdutycycle=(cruise/maxrpm);

 jumpval = abs(rpm-cruise)/2;
 //Serial.println(jumpval);

//   if (ccontrol == 1) {
//    if (rpm > cruise) {
//      dutycycle=cdutycycle-jumpval;
//      }
//    if (rpm < cruise ) {
//      dutycycle=cdutycycle+jumpval;
//
//      }  
//  }


   if (ccontrol == 1) {
      
    if (rpm < cruise) {
      cdutycycle=cdutycycle+jumpval;
      analogWrite(PWM_out, cdutycycle);
      }
    if (rpm > cruise ) {
      cdutycycle=cdutycycle-jumpval;
      analogWrite(PWM_out, cdutycycle);

      }  
  }

 //Serial.println(cdutycycle);
 if (ccontrol ==0) {
 analogWrite(PWM_out, dutycycle*maxdc);
 }
//analogWrite(PWM_out, dutycycle*maxdc);
 
 //Serial.println(val);

 delay(1000);
 rpm=2*press_count;
 Serial.println(rpm);

 // half rpm is calculated by dividing max value from rpmpc data by 2
 
 //Serial.write(press_count);


 //Serial.flush();
 press_count=0;
 


 }

  void pulse_state(){
 press_count=press_count+1;
}
