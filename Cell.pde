class Cell
{
  private int ashColorChoice;
  public final color selectedColor = color(250, 255, 130);
  static final float cellSize = 10;
  public int x;
  public int y;
  public boolean isSelected = false;
  private boolean isBurning = false;
  public cellState currentCellState;
  public cellType currentCellType;
  public float fireDuration;
  public float burnTime;
  public float TTI;


  public Cell(int xPos, int yPos)
  {
    this.x = xPos;
    this.y = yPos;
    this.ashColorChoice = int(random(0, 2));
    this.currentCellState = cellState.PLANT;
    float noiseFactor = 0.1f;
    float noiseValue = noise(x * noiseFactor, y * noiseFactor);
    if (noiseValue < 0.5)
    {
      fireDuration =  2500;
      currentCellType = cellType.GRASS;
    } else if (noiseValue > 0.5 && noiseValue < 0.6)
    {
      fireDuration =  5000;
      currentCellType = cellType.BUSH;
    } else
    {
      fireDuration =  7500;
      currentCellType = cellType.TREE;
    }
  }

  public void setState(cellState newState)
  {
    this.currentCellState = newState;
  }

  private color getColor()
  {
    if (currentCellState == cellState.PLANT || currentCellState == cellState.SMOLDER)
    {
      if (currentCellType == cellType.GRASS)
      {

        return color(160, 225, 145);
      }
      if (currentCellType == cellType.BUSH)
      {

        return color(65, 190, 40);
      }
      if (currentCellType == cellType.TREE)
      {

        return color(15, 90, 0);
      }
    }
    if (currentCellState == cellState.FIRE)
    {
      int colorChoice = int(random(0, 3));
      switch(colorChoice)
      {
      case 0:
        return color(255, 165, 25);

      case 1:
        return color(255, 200, 25);

      case 2:
        return color(255, 110, 25);
      }
    }
    if (currentCellState == cellState.ASH)
    {
      switch(ashColorChoice)
      {
      case 0:
        return color(90, 90, 90);

      case 1:
        return color(130, 130, 130);

      case 2:
        return color(50, 50, 50);
      }
    }

    return color(242, 3, 255);
  }

  private void update()
  {
    if (currentCellState == cellState.FIRE)
    {
      if (!isBurning)
      {
        burnTime = millis() + fireDuration;
        isBurning = false;
      }
    }
  }

  public void display(float x, float y)
  {
    update();
    stroke(0);
    fill(getColor());
    rect(x, y, cellSize, cellSize);
  }
}
public enum cellType
{
  GRASS,
    BUSH,
    TREE;
}
public enum cellState
{
  FIRE,
    SMOLDER,
    ASH,
    PLANT;
}
