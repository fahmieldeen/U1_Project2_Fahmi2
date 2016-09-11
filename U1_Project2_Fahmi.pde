float x = 7; //data types for the shooting firework
float y = 7; 
float y1 = 880;

float FireworkX = 50; //data type for the actual fireworks
float FireworkY = 50;
float circleX[];
float circleY[];

String s = "HAPPY NEW YEAR!!"; 
int pos;
int value = 0;

boolean isReleased = false;
int Screen = 0;

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
  if (Screen == 0)
  {
    StartScreen();
  }
  if (Screen == 1)
  {
  DrawShootingFirework();
  Collisions();
  }
}

void DrawShootingFirework()
{
  /*
  movement of the firework shooting into the sky
   */
  fill(255);
  ellipse(713, y1, x, y);
  y = y - 0.1;
  y1 = y1 - 4;
  x = x + 0.1;
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
    {
      text(s, 400, 700, 450, 20);
    }
  }
}

void StartScreen()
{
  text("PRESS SPACE TO LAUNCH FIREWORKS", 670, height/2);
  if( isReleased )
  {
    if ( key == ' ' )
    {
      Screen = 1;
    }
    isReleased = false;
  }
}

void keyReleased()
{
  isReleased = true;
}