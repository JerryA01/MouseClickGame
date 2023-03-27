class GreenEnemy extends Enemies {

  int speed;
  int speed1;
  int imgCounter;
  PImage [] imgs = new PImage[2];

  GreenEnemy(int x, int y) {
    super(x, y);
    this.speed = 3;
    this.speed1 = 5;
    for (int i = 0; i < imgs.length; i++) {
      imgs[i] = loadImage("penguin" + (i+1) + ".png");
    }
  }

  @Override
    public void render() {
    fill(150, 80, 70);
    image ( imgs[imgCounter /9 % imgs.length], x, y);
    imgCounter++;
  }

  @Override
    public void move() {
    y = y + speed;
    x = x + speed1;
    if (x > width-20) {
      speed1 = speed1 * -1;
    }
    if (x < 0) {
      speed1 = speed1 * -1;
    }
  }
}
