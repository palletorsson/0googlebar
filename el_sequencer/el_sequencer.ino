// Test sketch for El Escudo Dos
// Turn each EL channel (A-H) on in sequence and repeat
// Mike Grusin, SparkFun Electronics

#define GOOGLE 2
#define SKANDA 3
#define GREEN  4
#define WHITE  5
#define ANKA   6

void setup() {
  // The EL channels are on pins 2 through 9
  // Initialize the pins as outputs
  pinMode(2, OUTPUT);  // channel A
  pinMode(3, OUTPUT);  // channel B
  pinMode(4, OUTPUT);  // channel C
  pinMode(5, OUTPUT);  // channel D
  pinMode(6, OUTPUT);  // channel E
  pinMode(7, OUTPUT);  // channel F
  pinMode(8, OUTPUT);  // channel G
  pinMode(9, OUTPUT);  // channel H
  // We also have two status LEDs, pin 10 on the Escudo,
  // and pin 13 on the Arduino itself
  pinMode(10, OUTPUT);
  pinMode(13, OUTPUT);
  
  Serial.begin(115200);
  pinMode(13, OUTPUT);
  
  digitalWrite(GOOGLE, HIGH);
  digitalWrite(SKANDA, HIGH);
  digitalWrite(WHITE,  HIGH);
  digitalWrite(GREEN,  HIGH);
  
  delay(1500);
  
  digitalWrite(GOOGLE, LOW);
  digitalWrite(SKANDA, LOW);
  digitalWrite(WHITE,  LOW);
  digitalWrite(GREEN,  LOW);
}

void serialWriteName(int channel)
{
  switch(channel)
  {
    case WHITE:
      Serial.print("white\n");
      break;
    case GREEN:
      Serial.print("green\n");
      break;
    case GOOGLE:
      Serial.print("KUKEN\n");
      break;
    case SKANDA:
      Serial.print("blue\n");
      break;
    case ANKA:
      Serial.print("ANKA!\n");
      break;
  }
}

void blink(int channel, int delayTime)
{
  // Check if channel is out of bounds (2 - 11?)
  
  raise(channel);
  delay(delayTime);
  lower(channel);
  delay(delayTime);
}

void raise(int channel)
{
//  Serial.print("Raising  ");
//  serialWriteName(channel);
  digitalWrite(channel, HIGH);
}

void lower(int channel)
{
//  Serial.print("Lowering ");
//  serialWriteName(channel);
  digitalWrite(channel, LOW);
}

void loop()
{
  int x,status;

  // Green always on
  raise(GREEN);

  raise(WHITE);
  blink(SKANDA, 125);
  lower(WHITE);
  blink(SKANDA, 125);
  
  if(Serial.available())
  {
    char motor = Serial.read();
    if (motor == 'g')
    {
      raise(GOOGLE);
      blink(WHITE, 250);
      blink(WHITE, 250);
      blink(WHITE, 250);
      blink(WHITE, 250);
      lower(GOOGLE);
    }
    else if (motor == 'd')
    {
      lower(SKANDA);
      lower(GOOGLE);
      lower(WHITE);
      lower(GREEN);
      for(int i=0;i<20;i++)
      {
        blink(ANKA, 50);
      }
    }
  }
}
