const int ldrPin = A1;
const int buttonPin = A2;

const int ledPins[3] = {11, 12, 13}; //R, Y, G

int ldr = 0;

int button = 0;
int buttonPrevious = 0;

int timer = 2500;
int timeStep = 0;
int offset = 0;

void setup() {
  Serial.begin(9600);
  pinMode(buttonPin, INPUT_PULLUP);
  int timeStep = millis();
}

void loop() {
  timeStep = millis() + offset*timer;
  for(int i = 0; i < sizeof(ledPins)/sizeof(1); i++) {
    analogWrite(ledPins[i], 0);  
  }  

  button = !digitalRead(buttonPin);  
  if(button != buttonPrevious) {
    if(button != 0) { 
      offset = offset+1;
    }
    buttonPrevious = button;
  }
   
  Serial.println(button);
 
  analogWrite(ledPins[(timeStep/timer % 3)], 255);  
  delay(100);

}
