public class GrassCell extends Cell
{

  private final color VERY_LIGHT_GREEN = color(73, 255, 100);
  public GrassCell(int x, int y)
  {
    super(x, y);
    this.plantColor = VERY_LIGHT_GREEN;
    this.burnCounter = 1 * 1000;
    this.TTI = 0.025 * 1000;
  }

  public void display(float x, float y)
  {
    push();
    stroke(0);
    fill(super.getColor());
    rect(x, y, cellSize, cellSize);
    pop();
  }
}
