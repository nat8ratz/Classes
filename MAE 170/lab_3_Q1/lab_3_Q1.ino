// Arduino serial read script
// the setup routine runs once when you press reset:
void setup() {
// initialize serial communication at 115200 bits per second:
Serial.begin(115200);
}
// the loop routine runs over and over again forever
// the loop contains reading the analog in A0 pin and writing the voltage to the
serial port
// followed by the time in microseconds:
void loop() {
Serial.print(analogRead(A0));
Serial.print(", ");
Serial.println(micros());
}