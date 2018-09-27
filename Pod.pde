class Pod{
  
  int alto, ancho;
  int x,y;
  color Color;
  int incremento;
  int limSup, limInf;
  
  public Pod(int x, int y, int alto, int ancho){
    this.x=x;
    this.y=y;
    this.alto=alto;
    this.ancho=ancho;
    Color=color(#8A0AA7);
    limSup=height;
    limInf=0;
    incremento=15;
  }
  
  public void dibujar(){
    fill(Color);
    stroke(Color); // Define el contorno del rectangulo
    rect(x, y, ancho, alto);
  }
  
  public void subir(){
    // print("PodIzq Subir:");
    y-=incremento;
    if(y<limSup)
      y=limSup;
    //println(y);
  }
  
  public void bajar(){
    // print("PodIzq Bajar: ");
    y+=incremento;
    if(y+alto>limInf)
      y=limInf-alto;
    //println(y);
  }
  
  
}