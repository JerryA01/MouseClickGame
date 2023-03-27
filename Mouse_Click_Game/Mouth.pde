class Mouth {
  private int x = width/2-20;
  private int y = height-10;
  private int bgX = 0;
  private PImage img;

  Mouth() {
    img = loadImage("hole.png");
  }

  Mouth(int x, int y) {
    img = loadImage("hole.png");
    this.x = x;
    this.y = y;
  }

  public void render() {
    stroke(153, 20);
    fill(0.3, 0, 3, 0.3);
    ellipse(x, y, 220, 70);
    image(img, width/2-150, height-90, 300, 300);
  }

  boolean MouseCollision (Enemies other)
  {

    float distanceX = abs(mouseX - other.x);
    float distanceY = abs(mouseY - other.y);
    return distanceX<40 && distanceY<40 && mousePressed == true;
  }

  boolean collision (Enemies other)
  {
    {
      float distanceX = abs(this.x-other.x);
      float distanceY = abs(this.y-other.y);
      return distanceY<90 && distanceX<70;
    }
  }
  boolean MouseCollision (Bomb other)
  {

    float distanceX = abs(mouseX - other.x);
    float distanceY = abs(mouseY - other.y);
    return distanceX<40 && distanceY<35 && mousePressed == true;
  }
  boolean collision (Bomb other)
  {
    {
      float distanceX = abs(this.x-other.x);
      float distanceY = abs(this.y-other.y);
      return distanceY<90 && distanceX<70;
    }
  }
}
