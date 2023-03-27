class Bomb {

  private float x;
  private float y;
  private int imgCounter;
  private int speed;
  private PImage[] imgs2 = new PImage[11];

  Bomb(int x, int y) {
    this.x = x;
    this.y = y;
    this.speed = 2;
    for (int i = 0; i < imgs2.length; i++) {
      imgs2[i] = loadImage("bomb" + (i+1) + ".png");
    }
  }

  public void update() {
    move();
    render();
  }

  private void move() {
    y = y + speed;
  }

  private void render() {
    fill(150, 80, 70);
    image ( imgs2[imgCounter /9 % imgs2.length], x, y);
    imgCounter++;
  }
}
