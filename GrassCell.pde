public class GrassCell extends Cell
{

  private final color VERY_LIGHT_GREEN = color(73, 255, 100);
  public GrassCell(int x, int y)
  {
    super(x, y);
    this.burnCounter = 5 * 1000;
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
      return VERY_LIGHT_GREEN;
    }
  }


  public void display(float x, float y)
  {
    push();
    if (super.isSelected == true)
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
