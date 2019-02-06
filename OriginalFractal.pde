public void setup(){
  size(1000,1000);
  rectMode(CENTER);
  frameRate(10);
}

public void draw(){
  background(0);
  myProfessionalism(500,500,(int)(Math.random()*1000));
}

public void mouseDragged()
{
  stroke((float)(Math.random()/255),(float)(Math.random()+(255)),(float)(Math.random()-255));
  myProfessionalism(mouseX,mouseY,(int)(Math.random()*1000));
}

public void myProfessionalism(int x, int y, int siz)
{
  rect(x,y,siz,siz);
  line(x,y,x,siz);
    if(siz >= 75){
      stroke((float)(Math.random()*255),(float)(Math.random()-(255)),(float)(Math.random()*255));
      noFill();
      myProfessionalism(x,y-(int)(Math.random()*10),siz/2);
      myProfessionalism(x+siz/2,y+(int)(Math.random()*30),siz/2);
      myProfessionalism(x-siz/2,y-(int)(Math.random()*20),siz/2);
      myProfessionalism(x*siz/2,y+(int)(Math.random()*50),siz/2);
  }
}