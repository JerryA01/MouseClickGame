Mouth mouth;
int SCORE = 0;
int HEALTH = 15;
final int PLAYING = 1;
final int FINISHED = 0;
int gameMode = PLAYING;
PImage background;
PImage SplashScreen;
private PImage img5;
PImage MouseImage;
int BackgroundX = 0;
boolean ready = false;
boolean StartMenu = true;

ArrayList<Enemies> enemies = new ArrayList<>();
ArrayList<Bomb> bomb = new ArrayList<>();

void setup() {
  size(700, 500);
  img5 = loadImage("MouseImage.png");
  mouth = new Mouth();
  for (int i = 0; i < 150; i = i + 1) {
    enemies.add( new GreenEnemy ( (int) random(80, width-80), (int) random(-20000, -10) ) );
  }
  for (int i = 0; i < 150; i = i + 1) {
    enemies.add( new PurpleEnemy ( (int) random(80, width-80), (int) random(-20000, -10) ) );
  }
  for (int p = 0; p < 45; p = p + 1) {
    bomb.add( new Bomb ( (int) random(width/2, width/2-80), (int) random(-20000, -10) ) );
  }
  background = loadImage("sky.jpg");
  SplashScreen = loadImage("SplashScreen.png");
  background.resize(width, height+140);
}


void draw() {
  if (StartMenu) {
    SplashScreenImage();
    if (ready) {
      if (gameMode == PLAYING) {
        if (mouth != null)
        {
          MovingBackGround();
          MouseImage();
          mouth.render();
          Collisions();
          In_Game_Text();
          EndGameAndHighScore();
        }
      }
    }
  }
}
void keyPressed() {
  if (key == 'w') {
    ready = !ready;
  }
}

void SplashScreenImage() {
  image(SplashScreen, BackgroundX, 0, 700, 500);
}
void MovingBackGround() {
  image(background, BackgroundX, 0);
  image(background, BackgroundX+background.width, 0);
  BackgroundX = BackgroundX- 4;
  if (BackgroundX == -background.width)
  {
    BackgroundX=0;
  }
}

void Collisions() {
  for (int i = enemies.size()-1; i >= 0; i--) {
    Enemies currentattacker = enemies.get(i);
    currentattacker.update();

    if (mouth.collision(currentattacker)) {
      enemies.remove( currentattacker );
      HEALTH = HEALTH - 1;
    }
    if (mouth.MouseCollision(currentattacker)) {
      enemies.remove( currentattacker );
      SCORE = SCORE + 5;
    }
  }
  for (int p = bomb.size()-1; p >= 0; p--) {
    Bomb currentbomb = bomb.get(p);
    currentbomb.update();

    if (mouth.collision(currentbomb)) {
      bomb.remove( currentbomb );
      HEALTH = 0;
    }
    if (mouth.MouseCollision(currentbomb)) {
      bomb.remove( currentbomb );
      SCORE = SCORE + 10;
    }
  }
}
void In_Game_Text() {
  fill(255);
  textSize(20);
  fill(0, 0, 200);
  text("SCORE: " + SCORE, 20, 20);
  fill(255, 0, 0);
  text("HEALTH: " + HEALTH, width-100, 20);
  fill(128, 0, 128);
  text("watch out for the bombs! ", width-500, 20);
}
void EndGameAndHighScore() {
  if (HEALTH <= 0) {
    gameMode = FINISHED;
    textSize(40);
    text("GAME OVER", 250, 200);
    textSize(20);
    StartMenu = !StartMenu;
    String words = "Your new high score is " + SCORE;
    text(words, 20, 60);
    String[] list = split(words, ' ');
    saveStrings("this.txt", list);
  }
}
void MouseImage() {
  image(img5, mouseX, mouseY, 60, 60);
}
