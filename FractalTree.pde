private double fractionLength = .8; 
private int smallestBranch = 7; 
private double branchAngle = .7;  
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(0,255,0);   
  //line(320,480,320,380);  
  //line(0, 240, 640, 240);
  //line(320, 0, 320, 480);
  drawBranches(320, 380, 200, 3*Math.PI/2);
  drawBranches(320, 100, 200, Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, 36*branchLength/37, angle + branchAngle);
    drawBranches(endX2, endY2, 36*branchLength/37, angle - branchAngle);
  }
} 
