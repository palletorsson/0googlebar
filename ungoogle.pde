
void setup() {
    Serial.begin(9600);
    pinMode(13, OUTPUT);
}

void loop() {
    if (Serial.available()) {
      
        char google = Serial.read();
            if (google == 'google') {
            digitalWrite(13, HIGH);
            delay(500);
            digitalWrite(13, LOW);
            delay(500);
            digitalWrite(13, HIGH);
            delay(500);
            digitalWrite(13, LOW);
            }

    }
}