class Cherry
{
  //Member Data
  float cherryX;
  float cherryY;
  float Speed;

  //Constructors
  Cherry()
  {
    cherryX = random(0, 800);
    cherryY = random(-100, 0);
    speedc = 6;
  }


  void draw()
  {
    image(cherry, cherryX, cherryY);
    cherryY = cherryY + Speed;

    if ( cherryY > icecreamY)
    {
      cherryY = random(-100, 0);
      cherryX = random(0, 800);
    }

    fill(255, 255, 255);
    ellipse(cherryX+22, cherryY+22, 70, 70);
    image(cherry, cherryX, cherryY);
    cherryY = cherryY + speedc;

    if (dist(cherryX, cherryY, icecreamX, icecreamY)< 60)
    {
      cherryY= -100;
      cherryX = random(0, 800);
      score = score +1;
    }
  }
}
