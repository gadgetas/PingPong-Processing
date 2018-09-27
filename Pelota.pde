class Pelota{
  int x,y;
  int velX,velY;
  color Color;
  int radio;
  boolean detener;
  
  public Pelota(int exis, int ye){
    x=exis;
    y=ye;
    radio=15;
    Color=color(#F0FF27);
    velAzar();
    detener=false;
  }
  
  public void velAzar(){
    velX=velAzar(4);
    velY=velAzar(4);    
  }
  
  public void dibujar(){
    fill(Color);
    stroke(Color);
    ellipse(x,y,radio*2,radio*2);
    if(detener)
      return;
    x+=velX;
    y+=velY;
  }  
  
  //Devuelve un numero al azar positivo o negativo diferente de cero
  private int velAzar(int lim){
    int azar = (int)random(lim*(-1),lim);
    if (azar==0)
      azar=lim;
    return azar;
  }
 
}
