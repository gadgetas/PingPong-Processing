class Marcador
{
  int alto, ancho;
  int x, y;
  color colorFondo, colorContorno;
  int anchoContorno;
  Jugador local, visitante;
  PFont f;
  boolean mostrarGanador;

  public Marcador() {
    this(65, 355, 500, 70);
  }

  public Marcador(int x, int y, int ancho, int alto) {
    this(x, y, ancho, alto, new Jugador("local"), new Jugador("visitante"));
  }


  public Marcador(int x, int y, int ancho, int alto, Jugador local, Jugador visitante) {
    this.x=x;
    this.y=y;
    this.alto=alto;
    this.ancho=ancho;
    colorFondo=color(#000000);
    colorContorno=color(#FF0000);
    anchoContorno=4;
    this.local=local;
    this.visitante=visitante;
    f = loadFont("Laksaman-48.vlw");
    textFont(f);
    mostrarGanador=false;
  }

  public void dibujar() {
    dibujarMarcador();
  }

  private void dibujarMarcador() {
    fill(colorFondo);
    stroke(colorContorno); // Define el contorno del rectangulo
    strokeWeight(anchoContorno); // Ancho del contorno
    rect(x, y, ancho, alto);
    if (mostrarGanador) {      
      textSize(50);
      fill(color(random(255),random(255),random(255)));    
      textAlign(CENTER);
      String ganador=local.nombre;
      if(visitante.puntos>local.puntos)
        ganador=visitante.nombre;
      text("GANADOR: "+ganador, this.x+ancho*.5, this.y+alto*.7);    
    } else
    {
      textSize(20);
      fill(150);    
      textAlign(CENTER);
      text(local.nombre, this.x+ancho*.25, this.y+alto*.3);    
      text(visitante.nombre, this.x+ancho*0.75, this.y+alto*.3);  
      fill(255);    
      textSize(30);
      text(local.puntos, this.x+ancho*.25, this.y+alto*.8);   
      text(visitante.puntos, this.x+ancho*0.75, this.y+alto*.8);
    }
  }

}
