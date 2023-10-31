void setup() {
  // put your setup code here, to run once:
  Serial.begin(38400);
}

void loop() {
  // put your main code here, to run repeatedly:
  long int t = millis();
  Serial.println("This is hopefully a string that takes 25 +/- 2 milliseconds to print out, hopefully, maybe?");
  Serial.println(millis()-t);
}
