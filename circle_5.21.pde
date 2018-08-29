void settings()
{

// pixelDensity(displayDensity); // tried adding this but doesn’t do anything
}

void setup() 
{ 
  size (300, 300); 
  // pixelDensity(displayDensity); // THIS ARGUMENT ISN’T COMPATIBLE WITH PROCESSING.JS YIPPEE
  smooth();
  radio = 1; 
}

float radio = 1;
float incr = 0;
int count = 0;

void draw()
{
  background (255, 255, 255); 
  
  count += 1; 
  // text(count, 30, 30); // optional counter to show which frame it's on
  // fill(0, 102, 153, 51);
  
  fill(240, 255, 255); 
  stroke(18, 165, 255);
  ellipse(width/2, height/2, radio, radio); 
  
  fill(18, 165, 255);
  stroke(18, 165, 255);
  ellipse(width/2, height/2, 5, 5);
  
  if (radio < 280) { 
  incr = 13*exp(-pow(count-45, 2)/1000)/pow((2*PI), 0.5);
  radio += incr; 
  }
  
  else { radio += 0; }

}
