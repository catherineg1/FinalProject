PImage go;

PImage replay;
int replayX= 310;
int replayY= 505;

int replaX= replayX + 100;
int replaY= replayY + 100;

PImage cherry;

PImage dynamite;
float dynamiteX = random (0, 800);
float dynamiteY = random(-100, -500);

float sprinklessX = random(0, 800);
float sprinklessY = random(-100, -500);

float bombbX = random(0, 800);
float bombbY = random(-100, -500);

PImage sprinkles;
float sprinklesX = random(0, 800);
float sprinklesY = -50;

PImage bomb;
float bombX = random(0, 800);
int bombY = -200;

PImage icecream;
float icecreamX = 400;
float icecreamY = 600; 

int speedi = 20;
int speedc= 6;

float cherryyX = random(0, 800);
float cherryyY = random(-100, -500);


PImage store;
PImage background;

int X= 10;

int score = 0;

int Screen = 1;

Cherry firstCherry = new Cherry();
Cherry secondCherry = new Cherry();
Cherry thirdCherry = new Cherry();

void setup()
{
  size(800, 800); 

  replay = loadImage("replay.png");
  replay.resize(200, 200);

  go = loadImage("go.png");
  go.resize(600, 400);

  dynamite = loadImage("dyna.png");
  dynamite.resize(40, 50);

  cherry = loadImage("cherry1.png");
  cherry.resize(50, 50);

  icecream = loadImage("icn.png");
  icecream.resize(40, 50);

  background = loadImage("Background.jpg");
  background.resize(800, 800);

  store = loadImage("store.jpg");
  store.resize(800, 800);

  bomb= loadImage("bomb.png");
  bomb.resize(50, 50);

  sprinkles= loadImage("sprinkles.png");
  sprinkles.resize(50, 50);
}

void draw()
{
  if (Screen == 1) //start
  {
    background(store);

    fill(255, 0, 0);
    ellipse(width/2, height/2, 100, 100);
    textSize(20);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("START", width/2, height/2);
  }
  ////////
  if (Screen == 2)
  { 
    background(background);

    firstCherry.draw();

    secondCherry.draw();
    thirdCherry.draw();

    fill(#F295C7);
    rect(550, 50, 230, 70);
    fill(255, 255, 255);
    text("SCOREBOARD", 665, 75);
    text(score, 650, 100);

    ellipse(icecreamX+20, icecreamY+20, 70, 70);
    image(icecream, icecreamX, icecreamY);

    ellipse(sprinklesX+20, sprinklesY+20, 70, 70);
    image(sprinkles, sprinklesX, sprinklesY);
    sprinklesY= sprinklesY + speedc;

    fill(255, 255, 255);
    ellipse(bombX+20, bombY+20, 70, 70);
    image(bomb, bombX, bombY);
    bombY= bombY + speedc;

    if (dist(bombX, bombY, icecreamX, icecreamY)< 60)
    {
      bombY= -100;
      bombY= bombY + speedc;
      bombX= random(0, 800);
      score = 0;
    }

    if (bombY>800)
    {
      bombY= -100;
      bombX = random(0, 800);
    }

    if (dist(bombbX, bombbY, icecreamX, icecreamY)< 60)
    {
      bombbY= -100;
      bombbY= bombbY + speedc;
      bombbX= random(0, 800);
      score = 0;
    }

    if (bombbY>800)
    {
      bombbY= -100;
      bombbX = random(0, 800);
    }

    if (dist(sprinklesX, sprinklesY, icecreamX, icecreamY)< 60)
    {
      sprinklesY= -100;
      sprinklesX = random(0, 800);
      score = score +1;
    }

    if (sprinklesY>800)
    {
      sprinklesY= -100;
      sprinklesX = random(0, 800);
    }

    if (dist(sprinklessX, sprinklessY, icecreamX, icecreamY)< 60)
    {
      sprinklessY= -100;
      sprinklessX = random(0, 800);
      score = score +1;
    }

    if (sprinklesY>800)
    {
      sprinklesY= -100;
      sprinklesX = random(0, 800);
    }

    fill(255, 255, 255);
    ellipse(dynamiteX+22, dynamiteY+22, 70, 70);
    image(dynamite, dynamiteX, dynamiteY);
    dynamiteY = dynamiteY + speedc;

    if (dynamiteY >800)
    {
      dynamiteY= -100;
      dynamiteX = random(0, 800);
    }

    if (dist(dynamiteX, dynamiteY, icecreamX, icecreamY)< 60)
    {
      Screen = 3;
    }
  }  
  ///////
  if (Screen == 3)
  {
    background(0, 0, 0);

    dynamiteY = -100;
    dynamiteX = -100;

    textSize(100);
    text("SCORE:", 400, 400);
    text(score, 600, 400);

    image(go, 100, 0);

    fill(255, 255, 255);
    ellipse(replaX, replaY, 210, 210);
    image(replay, replayX, replayY);

    if (dist(replayX + 100, replayY + 100, mouseX, mouseY) < 105)
    {
      fill(#B40404);
    }
  }
}


void keyPressed()
{

  if (key == 'a')
  {
    icecreamX = icecreamX - speedi;
  }

  if (key== 'd')
  {
    icecreamX = icecreamX + speedi;
  }
}

void mouseReleased()
{ 

  if (dist(width/2, height/2, mouseX, mouseY) < 50)
  {
    Screen = 2;
  }

  if (dist(replaX, replaY, mouseX, mouseY) < 105)
  {
    Screen = 1;
  }
}
