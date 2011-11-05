int input;
int triggerPin = 11;
int stickPin = 3;
int triggerValue;
int stickValue;

void setup() {
  Serial.begin(9600);
  pinMode(triggerPin, OUTPUT);
  pinMode(stickPin, OUTPUT);
}

void loop() {
  while (Serial.available() > 0) {
    input = Serial.read();
    triggerValue = input % 10;
    stickValue = input / 10;
  }
  int triggerOut = int(map(triggerValue,1,9,75,209));
  int stickOut = int(map(stickValue,1,9,105,179));
  analogWrite(stickPin, stickOut);
  analogWrite(triggerPin, triggerOut);
  Serial.write(input);
}
