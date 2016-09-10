float x = 7;
float y = 7; 
float y1 = 880;
float FireworkX = 50;
float FireworkY = 50;
float circleX[];
float circleY[];
float i;
float ii;
float i2;
float ii2;
int pos;
/*
I made most of these data types into floats because I needed to be more precise 
in the movements/position moving
*/
void setup()
{
  fullScreen();
  circleX = new float[15];//arrays 
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
  fill(0, 255, 0);
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
    for (int i=0; i<15; i++)
    {
      int pos = (int) random(-1, 1); 
      fill(random(255), random(255), random(255));
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
  ellipse(i-1, ii+449, 50, 50);
  i = i + 1;
  ellipse(i2+1399, ii2+449, 50, 50);
  i2 = i2 - 1;
  {
  if (dist(i, ii, i2, ii2) >50);
  {
    print("HAPPY NEW YEAR!!");
  }
}
}