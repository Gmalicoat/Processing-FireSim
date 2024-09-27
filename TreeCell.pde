public class TreeCell extends Cell
{
  
  private final color VERY_DARK_GREEN = color(15, 60, 15);
  
  public TreeCell(int x, int y)
  {
    super(x, y);
    this.burnCounter = 15 * 1000;
  }
  
  public color getColor()
  {
    if(super.currentCellState == cellState.FIRE)
    {
      return fireColor;
    } else if(super.currentCellState == cellState.ASH)
    {
      return ashColor;
    } else
    {
      return VERY_DARK_GREEN;
    }
  }
  
  public void display(float x, float y)
  {
    push();
    if(super.isSelected == true)
    {
      fill(super.selectedColor);
    } else {
      stroke(0);
      fill(getColor());
    }
      rect(x, y, cellSize, cellSize);
    pop();
  }
  
}
