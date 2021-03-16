


char mystr[5] = "Hello";
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
Serial.write(mystr,5);
delay(1000);
}
