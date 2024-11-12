Grid grid;
int selectedGridX;
int selectedGridY;

void setup()
{
  size(500, 500);
  grid = new Grid(50);
  frameRate(60);
}

void draw()
{
  background(0);
  grid.display();
}

void mouseClicked()
{
  if(grid.selectedCell.isSelected)
  {
    grid.selectedCell.setState(cellState.FIRE);
    grid.selectedCell.burnCounter += grid.clock;
  }
}

void mouseMoved()
{
  int pSelectedGridX = int((pmouseX - grid.xOffset) / grid.cellSize);
  int pSelectedGridY = int((pmouseY - grid.yOffset) / grid.cellSize);
  selectedGridX = int((mouseX - grid.xOffset) / grid.cellSize);
  selectedGridY = int((mouseY - grid.yOffset) / grid.cellSize);
  if (selectedGridX > -1 && selectedGridX < grid.gridSize && selectedGridY > -1 && selectedGridY < grid.gridSize) {
    grid.selectedCell = grid.cellData[selectedGridX][selectedGridY];
    grid.cellData[selectedGridX][selectedGridY].isSelected = true;
    if (pSelectedGridX > -1 && pSelectedGridY > -1 && pSelectedGridX < grid.gridSize && pSelectedGridY < grid.gridSize) {
      if (pSelectedGridX != selectedGridX || pSelectedGridY != selectedGridY)
      {
        grid.cellData[selectedGridX][selectedGridY].isSelected = true;
        grid.cellData[pSelectedGridX][pSelectedGridY].isSelected = false;
      }
    }
  }
  if (selectedGridX < 0 || selectedGridX > grid.gridSize || selectedGridY < 0 || selectedGridY > grid.gridSize) 
  {
    if(grid.selectedCell != null)
    {
      grid.selectedCell.isSelected = false;
    }
  }
}
