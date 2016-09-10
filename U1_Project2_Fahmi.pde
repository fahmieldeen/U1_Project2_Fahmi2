float x = 7; //x position
float y = 7; // y position
float x1 = 713; // x size 
float y1 = 880; // y size 

int pos;

void setup()
{
  fullScreen();

}

void draw()
{
  /*
  In this void draw, the DrawShooting Firework is a function drawn in another void 
  and background (0) allows there to show no trail behind the moving circle
 */
  background(0);
  noStroke();
    DrawShootingFirework();
    
}

void DrawShootingFirework()
{
ellipse(x1, y1, x, y);
y = y - 0.25;
y1 = y1 - 4;
x = x + 0.2;
}