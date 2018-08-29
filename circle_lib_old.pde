void setup() 
{ 
  size (300, 350); 
  smooth();
  radio = 1; 
}

float radio = 1;
float incr = 0;
int count = 0;
int level = 0;

void draw()
{
  background (255, 255, 255); 
  
  count += 1; 
  // text(count, 30, 30); // optional counter to show which frame it's on
  // fill(0, 102, 153, 51);
  
  fill(240, 255, 255); 
  stroke(18, 165, 255);
  ellipse(width/2, 300/2, radio, radio); 
  
  fill(18, 165, 255);
  stroke(18, 165, 255);
  ellipse(width/2, 300/2, 5, 5);
  
  if (radio < 280) { 
  incr = 13*exp(-pow(count-45, 2)/1000)/pow((2*PI), 0.5);
  radio += incr; 
  }
  
  else { radio += 0; }
  
  //////////////////////////////////////////////////////////////////////
  
  fill(255, 255, 255); 
  stroke(200, 200, 200);
  strokeWeight(2);
  rect(10, 300, 280, 40, 7);
  
  // fill(255, 255, 255);
  // stroke(255, 255, 255);
  // rect(10, 300, 280, 40);
 
  fill(230, 230, 230);
  rect(10, 300, level, 40, 7, 0, 0, 7);
  if (level < round(0.49*280)) { // 0.9 is an example percentage
  level += 2;
  }
  else { level += 0; }
  
  textSize(30);
  fill(255, 255, 255);
  text("49%", (0.49*280-55), 332);
  
  if (count > 240) { 
  noLoop(); 
}
  
}
