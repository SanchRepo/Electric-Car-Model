
char mystr[10];

void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

  Serial.readBytes(mystr,5);
  Serial.println(mystr);
  delay(1000);
}
