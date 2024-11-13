public class TreeCell extends Cell
{
  
  private final color VERY_DARK_GREEN = color(15, 60, 15);
  
  public TreeCell(int x, int y)
  {
    super(x, y);
    this.plantColor = VERY_DARK_GREEN;
    this.burnCounter = 5 * 1000;
    this.TTI = 2 * 1000;
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
