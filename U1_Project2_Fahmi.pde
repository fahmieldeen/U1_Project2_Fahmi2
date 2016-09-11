float x = 7; //data types for the shooting firework
float y = 7; 
float y1 = 880;

float FireworkX = 25; //data type for the actual fireworks
float FireworkY = 25;
float circleX[];
float circleY[];

int i = 0; //data type for the collisions
int ii = 450;
int i2 = 1440;
int ii2 = 450;
int circleR = 50;
int circle2R = 50;

String s = "HAPPY NEW YEAR!!"; 
int pos;
int value = 0;
/*
I made most of these data types into floats because I needed to be more precise 
 in the movements/position moving
 */
void setup()
{
  fullScreen();
  circleX = new float[15]; 
  circleY = new float[15];
  for (int i=0; i<15; i++)
  {
    circleX[i] = (int)random(0, width);
    circleY[i] = (int)random(0, height);
  }
}

void draw()
/*
  In this void draw, the DrawShooting Firework is a function drawn in another void 
 and background (0) allows there to show no trail behind the moving circle
 */
{
  background(0);
  noStroke();
  DrawShootingFirework();
  Collisions();
  EndFirework();
}

void DrawShootingFirework()
{
  /*
  movement of the firework shooting into the sky
   */
  fill(255);
  ellipse(713, y1, x, y);
  y = y - 0.25;
  y1 = y1 - 4;
  x = x + 0.2;
}

void Collisions()
{
  /*
  This allows the "fireworks" to react exactly when the shooter hits the top 
   of the screen
   */
  if (y1 <= 0)
  {
    for (int i=0; i<15; i++) //limits to only 15 random circles 
    {
      int pos = (int) random(-1, 1); 
      fill(random(100, 255), random(100, 255), random(100, 255));
      ellipse(circleX[i], circleY[i], FireworkX, FireworkY);
      circleY[i] = circleY[i] - (pos * 0.25);
      FireworkX = FireworkX + 0.1;
      FireworkY = FireworkY + 0.1;
    }
  }
}
void EndFirework()
{
  /*
  Two small circles moving closer together and when colided, a message pops up 
   in console/ portrays the end of the art
   */
  fill(0); //trying to hide the circles when the firework is shooting into the sky
  ellipse(i, ii, circleR*2, circleR*2); //movement of first circle
  i = i + 1;
  ellipse(i2, ii2, circle2R*2, circle2R*2); //movement of second circle
  i2 = i2 - 1;

    if (dist(i, ii, i2, ii2) < circleR+circle2R); //collisions 
    {
      text(s, 600, 720, 450, 700); // s is the string for what it will say on the screen
    println("YAY HAPPY NEW YEAR!!"); // this is for the console once you quit the screen
}
}