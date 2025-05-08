class Grid
{

  int gridSize = int(width / Cell.cellSize);
  Cell[][] cellData;
  float cellSize;
  Cell selectedCell;
  float xOffset;
  float yOffset;

  public Grid()
  {
    cellData = new Cell[gridSize][gridSize];
    for (int gridHeight = 0; gridHeight < gridSize; gridHeight++)
    {
      for (int gridWidth = 0; gridWidth < gridSize; gridWidth++)
      {
        cellData[gridWidth][gridHeight] = new Cell(gridWidth, gridHeight);
      }
      cellSize = cellData[0][0].cellSize;
    }
  }

  public void display()
  {
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
          push();
          translate(xOffset, yOffset);
          cellData[gridWidth][gridHeight].display(x, y);
          pop();
        }
      }
    }
  }
}
