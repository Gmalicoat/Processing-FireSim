class Grid
{

  int gridSize;
  Cell[][] cellData;
  float cellSize;
  Cell selectedCell;
  float xOffset;
  float yOffset;
  float clock;

  public Grid(int gridSize)
  {

    this.gridSize = gridSize;
    cellData = new Cell[gridSize][gridSize];
    this.clock = 0;


    //Creates list of cells
    for (int gridHeight = 0; gridHeight < gridSize; gridHeight++)
    {
      for (int gridWidth = 0; gridWidth < gridSize; gridWidth++)
      {
        int cellType = int(random(0, 3));
        switch(cellType)
        {
          case(0):
          cellData[gridWidth][gridHeight] = new GrassCell(gridWidth, gridHeight);
          break;

          case(1):
          cellData[gridWidth][gridHeight] = new BushCell(gridWidth, gridHeight);
          break;

          case(2):
          cellData[gridWidth][gridHeight] = new TreeCell(gridWidth, gridHeight);
          break;
        }
      }
      cellSize = cellData[0][0].cellSize;
    }
  }

  public void display()
  {
    clock += (1000 * (1 / frameRate));
    xOffset = (width / 2) - (gridSize * cellSize / 2);
    yOffset = (height / 2) - (gridSize * cellSize / 2);
    float x = 0;
    float y = 0;
    for (int gridHeight = 0; gridHeight < gridSize; gridHeight++)
    {
      y = gridHeight * cellSize;
      for (int gridWidth = 0; gridWidth < gridSize; gridWidth++)
      {
        x = gridWidth * cellSize;
        if (cellData != null)
        {
          burnCheck(cellData[gridWidth][gridHeight]);
          spreadBurnCheck(cellData[gridWidth][gridHeight]);
          push();
          translate(xOffset, yOffset);
          cellData[gridWidth][gridHeight].display(x, y);
          pop();
        }
      }
    }
  }

  private void spreadBurnCheck(Cell currentCell)
  {
    if (cellData[int(currentCell.location.x)][int(currentCell.location.y)].currentCellState == cellState.PLANT)
    {
      {
        currentCell.TTI += clock;
        if (clock >= currentCell.TTI)
        {
          currentCell.setState(cellState.FIRE);
        }
        if (cellData[int(currentCell.location.x)][int(currentCell.location.y + 1)].currentCellState == cellState.FIRE || cellData[int(currentCell.location.x)][int(currentCell.location.y - 1)].currentCellState == cellState.FIRE) //<>//
        {
          currentCell.TTI += clock;
          if (clock >= currentCell.TTI)
          {
            currentCell.setState(cellState.FIRE);
          }
        }
      }
    }
  }

  private void burnCheck(Cell currentCell)
  {
    // Checks to see if cell is on fire and starts the depleating the burnCounter
    if (currentCell.currentCellState == cellState.FIRE)
    {
      if (clock >= currentCell.burnCounter)
      {
        currentCell.setState(cellState.ASH);
      }
    }
  }
}
