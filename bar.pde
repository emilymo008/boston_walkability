void setup()
{
  size (400, 60);
  smooth(); 
}

int level = 0;

void draw()
{
  background (255, 255, 255);
  
  fill(255, 255, 255); 
  stroke(200, 200, 200);
  strokeWeight(2);
  rect(10, 10, 280, 40, 7);
  
  fill(230, 230, 230);
  rect(10, 10, level, 40, 7, 0, 0, 7);
  if (level < round(0.8*280)) { 
  level += 2;
  }
  else { level += 0; }
  
}
