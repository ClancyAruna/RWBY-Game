//Caelan Apesland
//
// 10/Oct/2017
//RWBY Platformer game

char[][] tiles;
PImage levelBackground;
PImage platform, coin, box, fly, p1, slime, empty;
int tilesHigh, tilesWide;
float tileWidth, tileHeight;
String bgImage, levelToLoad;
PImage [] runR = new PImage [11];
PImage standR; 

boolean movingUp, movingDown, movingLeft, movingRight;
float x, y;
float dx, dy;

void setup() {
  size(600, 450);  // 4:3 ratio
  bgImage = "level_background.png";
  levelToLoad = "levels/0.txt";
  standR = loadImage("0.png");
  initializeValues();
  
  x = width/2;
  y = height/2;
  dx = 5;
  dy = 5;
  
  //Loading Character
  stand = loadImage("0.png");
  
}

void draw() {
  display();
}

void initializeValues() {
  loadImages();

  //load level data
  String lines[] = loadStrings(levelToLoad);

  tilesHigh = lines.length;
  tilesWide = lines[0].length();

  tileWidth = width/tilesWide;
  tileHeight = height/tilesHigh;

  //println(tilesHigh, tilesWide);

  tiles = new char[tilesWide][tilesHigh];

  //put values into 2d array of characters
  for (int y = 0; y < tilesHigh; y++) {
    for (int x = 0; x < tilesWide; x++) {
      char tileType = lines[y].charAt(x);
      tiles[x][y] = tileType;
    }
  }
}

void moveCharacter() {
  if (movingUp) {
    y -= dy;
  }
  if (movingDown) {
    y += dy;
  }
  if (movingLeft) {
    x -= dx;
  }
  if (movingRight) {
    x += dx;
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    movingUp = true;
  }
  if (key == 's' || key == 'S') {
    movingDown = true;
  }
  if (key == 'd' || key == 'D') {
    movingRight = true;
  }
  if (key == 'a' || key == 'A') {
    movingLeft = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    movingUp = false;
  }
  if (key == 's' || key == 'S') {
    movingDown = false;
  }
  if (key == 'd' || key == 'D') {
    movingRight = false;
  }
  if (key == 'a' || key == 'A') {
    movingLeft = false;
  }
}

void display() {
  image(levelBackground, 0, 0, width, height);

  for (int y = 0; y < tilesHigh; y++) {
    for (int x = 0; x < tilesWide; x++) {
      showTile(tiles[x][y], x, y);
    }
  }
}

void showTile(char location, int x, int y) {
  if (location == '#') {
    image(platform, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'C') {
    image(coin, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'B') {
    image(box, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'F') {
    image(fly, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'P') {
    image(p1, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'S') {
    image(slime, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else {
    image(empty, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  }
}

void loadImages() {
  //load background
  levelBackground = loadImage(bgImage);

  //load tile images
  platform = loadImage("platform.png");
  coin = loadImage("coin.png");
  box = loadImage("boxItem.png");
  fly = loadImage("flyFly1.png");
  p1 = loadImage("p1_front.png");
  slime = loadImage("slimeWalk1.png");
  empty = loadImage("empty.png");
}