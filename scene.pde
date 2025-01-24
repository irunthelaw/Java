
size(800, 800); // Set the canvas size
background(0, 0, 255); // Blue background for underwater scene


// Alien Body
stroke(0);
fill(0,255,0);
rect(95,100,10,50);

// Alien head
fill(#7EA500);
ellipse(100,70,60,60);

// Alien eyes
fill(0);
ellipse(81,70,26,12);
ellipse(119,70,26,12);

// Alien legs
line(90,150, 80, 160);
line(110,150, 120, 160);
fill(0,255,0);

// Alien arms
line(90,150, 80, 160);
line(110,150, 120, 160);
fill(#8B060F);

// Seabed
noStroke();
fill(150, 89, 19);
rect(0, 700, 800, 100);

// Seaweed
fill(35, 140, 35); 
rect(150, 650, 20, 100);
rect(250, 670, 15, 80);
rect(350, 640, 25, 120);
rect(420, 640, 45, 120);
rect(530, 600, 25, 180);

// Bubbles
noFill();
stroke(255); 
ellipse(100, 200, 20, 20);
ellipse(400, 250, 25, 25);

// Fishs
noStroke();
fill(255, 165, 0); 
ellipse(500, 500, 60, 30); 
triangle(470, 500, 490, 485, 490, 515); 
fill(0);
ellipse(520, 490, 5, 5); 

fill(255, 0, 0); 
ellipse(600, 600, 50, 25);
triangle(575, 600, 590, 590, 590, 610);
fill(0);
ellipse(610, 590, 5, 5);

