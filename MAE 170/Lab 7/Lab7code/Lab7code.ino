
void setup() {
  // Set your Baud rate to 9600
  Serial.begin(9600);
  // specify use of digital pin 9 in OUTPUT mode
  pinMode(9, OUTPUT);
}
// initialize an integer of variable name “runcommand” to “0”. “runcommand” will serve as the
// variable that sets your PWM value (0 = 0% duty cycle, 255 = 100% duty cycle, and values in
// between)
int runcommand = 0;

void loop() {
  // create a while loop to see if there is anything “available” to be read in the
  // buffer. The condition must be set so that available bits must be greater than 1, because when
  // you read the serial stream with parseInt it leaves 1 bit behind so then it always gets a 0
  // bit instead of the null bit
  while (Serial.available() > 1) {
    // while strings are available in the buffer, parse the integer(s) available
    // and set “runcommand” to this value
    runcommand = Serial.parseInt();
    // reset “runcommand” to its own absolute value
    runcommand = abs(runcommand);
    // then print out the value of “runcommand” to the serial monitor
    Serial.println(runcommand);
  }
  // after your while loop, check if “runcommand” is greater than 255 (the maximum PWM value)
  // if it is, set “runcommand” to 255
  if (runcommand > 255) {
    runcommand = 255;
  }
  // at the end of your void loop() section, write the value of runcommand to digital pin 9
  analogWrite(9,runcommand);
}