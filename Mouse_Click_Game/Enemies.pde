abstract class Enemies {

  float x;
  float y;

  public int speed;
  public int imgCounter;

  Enemies(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    move();
    render();
  }

  abstract void render();
  abstract void move();
}
