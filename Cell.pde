 abstract class Cell
{
  public final color fireColor = color(240, 160, 50);
  public final color ashColor = color(90,90,90);
  public color plantColor;
  public final color selectedColor = color(250, 255, 130);
  final float cellSize = 10;
  public PVector location;
  public boolean isSelected = false;
  public cellState currentCellState;
  public float burnCounter;
  public float TTI; //Time to Ignition


  public Cell(int x, int y)
  {
    this.location = new PVector(x, y);
    this.currentCellState = cellState.PLANT; 
  }


  public cellState setState(cellState currentState)
  {
    currentCellState = currentState;
    if(currentCellState == cellState.SMOLDER)
    {
      TTI += grid.clock;
    }
    return currentState;
  }

  public color getColor()
  {
    if(grid.clock > TTI && grid.clock < TTI + 500 && currentCellState == cellState.SMOLDER)
    {
      currentCellState = cellState.FIRE;
      burnCounter += grid.clock;
    }
    if (isSelected == true)
    {
      return selectedColor;
    }
      else if(currentCellState == cellState.FIRE)
    {
      return fireColor;
    } else if(currentCellState == cellState.ASH)
    {
      return ashColor;
    } else
    {
      return plantColor;
    }
  }

  public abstract void display(float x, float y);
}

public enum cellState
{
  FIRE,
  SMOLDER,
  ASH,
  PLANT;
}
