Particle[] regenald;
public void setup() {
  size(1000, 1000);
  rectMode(CENTER);
  //frameRate(10);
  regenald = new Particle[1000];
  for(int i=0; i<regenald.length; i++)
  {
    regenald[i] = new NormalParticle();
  }
}

public void draw() {
  fill(0,5);
  rect(0,0,width*2,height*2);
  noStroke();
  myProfessionalism(500, 500, (int)(Math.random()*1000));
  for(int i=0; i<regenald.length; i++)
   {
     noFill();
     regenald[i].show();
     regenald[i].move();
   }  
}

public void mouseDragged()
{
  stroke((float)(Math.random()/255), (float)(Math.random()+(255)), (float)(Math.random()-255));
  myProfessionalism(mouseX, mouseY, (int)(Math.random()*1000));
}

public void myProfessionalism(int x, int y, int siz)
{
  rect(x, y, siz, siz);
  line(x, y, x, siz);
  if (siz >= 200) {
    stroke((float)(Math.random()*255), (float)(Math.random()-(255)), (float)(Math.random()*255));
    noFill();
    myProfessionalism(x, y-(int)(Math.random()*10), siz/2);
    myProfessionalism(x+siz/2, y+(int)(Math.random()*30), siz/2);
    myProfessionalism(x-siz/2, y-(int)(Math.random()*20), siz/2);
    myProfessionalism(x*siz/2, y+(int)(Math.random()*50), siz/2);
  }
}

class NormalParticle implements Particle
{
  double myX,myY,myAngle,mySpeed,myX1,myY1;
  int myColor;
  NormalParticle()
  {
  myX = myY = 500;
  myX1 = myY1 = 500;
  myAngle = Math.random()*8*Math.PI;
  mySpeed = Math.random()*5;
  myColor = color(255,0,0);
  }
  void move()
   {
     myX=myX+Math.cos(myAngle)*mySpeed;
     myY=myY-Math.sin(myAngle)*mySpeed;
     myX1=myX1-Math.cos(myAngle)*mySpeed;
     myY1=myY1+Math.sin(mySpeed)*mySpeed;
     myAngle=mySpeed+1;
     mySpeed=mySpeed+0.1;
     if((myX>1000)||(myX<0)||(myY>1000)||(myY<0) || (myX1>1000)||(myX1<0)||(myY1>1000)||(myY1<0))
    {
      myX = myX1 = 500;
      myY = myY1 = 500;
      myAngle = Math.random()*8*Math.PI;
      mySpeed = Math.random()*5;     
    }
   }
   void show()
   {
     stroke(myColor);
     ellipse((float)myX,(float)myY,(int)(Math.random()*5),(int)(Math.random()*5));
     ellipse((float)myX1,(float)myY1,(int)(Math.random()*5),(int)(Math.random()*5));
   }
   
}
interface Particle
{
  public void show();
  public void move();
}