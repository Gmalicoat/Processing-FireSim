public class BushCell extends Cell
{
  
  private final color GREEN = color(0, 153, 0);
  
  
  public BushCell(int x, int y)
  {
    super(x, y);
    this.burnCounter = 10 * 1000;
  }
  
  public color getColor()
  {
    if(super.currentCellState == cellState.FIRE) //<>//
    {
      return fireColor;
    } else if(super.currentCellState == cellState.ASH)
    {
      return ashColor;
    } else
    {
      return GREEN;
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
  
