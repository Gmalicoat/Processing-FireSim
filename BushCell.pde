public class BushCell extends Cell
{
  
  private final color GREEN = color(0, 153, 0);
  
  
  public BushCell(int x, int y)
  {
    super(x, y);
    this.plantColor = GREEN;
    this.burnCounter = 3 * 1000;
    this.TTI = 1 * 1000;
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
  
