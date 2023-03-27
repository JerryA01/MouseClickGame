class PurpleEnemy extends Enemies {

  public int speed;
  public int speed1;
  public int imgCounter;
  public PImage [] imgs1 = new PImage[6];

  PurpleEnemy(int x, int y) {
    super(x, y);
    this.speed = 3;
    this.speed1 = 3;
    for (int j = 0; j < imgs1.length; j++) {
      imgs1[j] = loadImage("deadlypenguin" + (j+1) + ".png");
    }
  }

  @Override
    public void render() {
    fill(150, 80, 70);
    image ( imgs1[imgCounter /9 % imgs1.length], x, y);
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
